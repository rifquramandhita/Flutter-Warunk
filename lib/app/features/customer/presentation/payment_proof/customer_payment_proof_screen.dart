import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/presentation/payment_proof/bloc/customer_payment_proof_bloc.dart';
import 'package:warunk/app/features/customer/presentation/payment_proof/bloc/customer_payment_proof_event.dart';
import 'package:warunk/app/features/customer/presentation/payment_proof/bloc/customer_payment_proof_state.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/core/dependency/dependency.dart';

class CustomerPaymentProofScreen extends StatefulWidget {
  final CustomerOrderEntity order;

  const CustomerPaymentProofScreen({Key? key, required this.order}) : super(key: key);

  @override
  State<CustomerPaymentProofScreen> createState() => _CustomerPaymentProofScreenState();
}

class _CustomerPaymentProofScreenState extends State<CustomerPaymentProofScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _showPickerBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Galeri'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Kamera'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CustomerPaymentProofBloc>(),
      child: BlocConsumer<CustomerPaymentProofBloc, CustomerPaymentProofState>(
        listener: (context, state) {
          if (state is CustomerPaymentProofSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Bukti pembayaran berhasil dikirim')),
            );
            Navigator.of(context).pop(true);
          } else if (state is CustomerPaymentProofFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is CustomerPaymentProofLoading;
          
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Upload Bukti Pembayaran',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Silakan unggah foto bukti transfer Anda.',
                    style: TextStyle(fontSize: 14, color: AppColors.greyText),
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: isLoading ? null : _showPickerBottomSheet,
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.greyBorder, width: 1),
                      ),
                      child: _imageFile != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.file(_imageFile!, fit: BoxFit.cover),
                            )
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_a_photo_outlined, size: 48, color: AppColors.greyText),
                                SizedBox(height: 12),
                                Text(
                                  'Tap untuk memilih foto',
                                  style: TextStyle(color: AppColors.greyText, fontSize: 14),
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: _imageFile == null || isLoading
                      ? null
                      : () {
                          context.read<CustomerPaymentProofBloc>().add(
                            CustomerPaymentProofSubmitted(
                              orderId: widget.order.id!,
                              file: _imageFile!,
                            ),
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey[300],
                    disabledForegroundColor: Colors.grey[600],
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                        )
                      : const Text(
                          'Kirim Bukti Pembayaran',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
