import 'dart:io';

import 'package:image/image.dart' as img;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:warunk/app/features/merchant/domain/repository/merchant_merchant_repository.dart';
import 'package:warunk/core/network/data_state.dart';

class MerchantMerchantUploadTransferProofUseCase {
  final MerchantMerchantRepository _repository;

  MerchantMerchantUploadTransferProofUseCase(this._repository);

  Future<DataState<dynamic>> call(String id, File transferProof) async {
    File fileToSubmit = transferProof;

    if (!fileToSubmit.existsSync()) {
      return ErrorState(
        message: 'File gambar tidak ditemukan atau sudah dihapus dari penyimpanan.',
      );
    }

    final int maxSize = 500 * 1024; // 500 KB
    int fileSize = await fileToSubmit.length();

    if (fileSize > maxSize) {
      final tempDir = await getTemporaryDirectory();
      int quality = 85;

      while (fileSize > maxSize && quality > 5) {
        final targetPath =
            '${tempDir.path}/compressed_transfer_proof_${DateTime.now().millisecondsSinceEpoch}_$quality.jpg';

        try {
          final compressed = await FlutterImageCompress.compressAndGetFile(
            transferProof.absolute.path,
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
            throw Exception('Native compression returned null');
          }
        } catch (e) {
          try {
            final bytes = await fileToSubmit.readAsBytes();
            final image = img.decodeImage(bytes);

            if (image != null) {
              final targetPathDart =
                  '${tempDir.path}/compressed_transfer_proof_dart_${DateTime.now().millisecondsSinceEpoch}_70.jpg';
              final compressedBytes = img.encodeJpg(image, quality: 70);
              final dartCompressedFile = File(targetPathDart);
              await dartCompressedFile.writeAsBytes(compressedBytes);

              fileToSubmit = dartCompressedFile;
            }
          } catch (_) {}
          break;
        }
      }
    }

    return _repository.uploadTransferProof(id: id, transferProof: fileToSubmit);
  }
}
