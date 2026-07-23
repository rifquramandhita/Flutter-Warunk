import 'dart:io';

import 'package:image/image.dart' as img;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:warunk/app/features/customer/domain/repository/customer_order_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class CustomerOrderPaymentProofUseCase {
  final CustomerOrderRepository _repository;

  CustomerOrderPaymentProofUseCase(this._repository);

  Future<DataState<dynamic>> call(String id, File paymentProof) async {
    File fileToSubmit = paymentProof;
    
    if (!fileToSubmit.existsSync()) {
      return ErrorState(message: 'File gambar tidak ditemukan atau sudah dihapus dari penyimpanan.');
    }

    final int maxSize = 5 * 1024 * 1024; // 5 MB
    int fileSize = await fileToSubmit.length();

    if (fileSize > maxSize) {
      final tempDir = await getTemporaryDirectory();
      int quality = 85;
      
      while (fileSize > maxSize && quality > 5) {
        final targetPath = '${tempDir.path}/compressed_proof_${DateTime.now().millisecondsSinceEpoch}_$quality.jpg';
        
        try {
          final compressed = await FlutterImageCompress.compressAndGetFile(
            paymentProof.absolute.path,
            targetPath,
            quality: quality,
            minWidth: 1024,
            minHeight: 1024,
            format: CompressFormat.jpeg,
          );
          
          if (compressed != null) {
            fileToSubmit = File(compressed.path);
            fileSize = await fileToSubmit.length();
            quality -= 20;
          } else {
            break; // Fallback to current fileToSubmit if compression fails
          }
        } catch (e, stackTrace) {
          print('Native compression failed ($e). Falling back to pure Dart image package...');
          try {
            final bytes = await fileToSubmit.readAsBytes();
            final image = img.decodeImage(bytes);
            
            if (image != null) {
               final targetPathDart = '${tempDir.path}/compressed_proof_dart_${DateTime.now().millisecondsSinceEpoch}_70.jpg';
               final compressedBytes = img.encodeJpg(image, quality: 70); 
               final dartCompressedFile = File(targetPathDart);
               await dartCompressedFile.writeAsBytes(compressedBytes);
               
               fileToSubmit = dartCompressedFile;
               break;
            } else {
               print('Dart image package also failed to decode the image.');
               return ErrorState(message: 'Format gambar tidak didukung atau gambar rusak. Mohon pilih gambar lain.');
            }
          } catch (dartE) {
            print('Dart compression exception: $dartE');
            return ErrorState(message: 'Memori tidak cukup untuk memproses gambar ini karena ukurannya yang terlalu besar. Mohon pilih gambar lain.');
          }
        }
      }
    }

    return _repository.submitPaymentProof(id, fileToSubmit);
  }
}
