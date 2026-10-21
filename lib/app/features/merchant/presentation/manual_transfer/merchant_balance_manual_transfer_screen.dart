import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_balance_history.dart';
import 'package:warunk/app/features/merchant/presentation/manual_transfer/bloc/merchant_balance_manual_transfer_bloc.dart';
import 'package:warunk/app/features/merchant/presentation/manual_transfer/bloc/merchant_balance_manual_transfer_event.dart';
import 'package:warunk/app/features/merchant/presentation/manual_transfer/bloc/merchant_balance_manual_transfer_state.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/number_helper.dart';
import 'package:warunk/core/widgets/primary_button.dart';

class MerchantBalanceManualTransferScreen extends StatefulWidget {
  final MerchantBalanceHistoryItemEntity topUpItem;

  const MerchantBalanceManualTransferScreen({
    super.key,
    required this.topUpItem,
  });

  @override
  State<MerchantBalanceManualTransferScreen> createState() =>
      _MerchantBalanceManualTransferScreenState();
}

class _MerchantBalanceManualTransferScreenState
    extends State<MerchantBalanceManualTransferScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null && context.mounted) {
        context.read<MerchantBalanceManualTransferBloc>().add(
              MerchantBalanceManualTransferEventSelectImage(
                File(pickedFile.path),
              ),
            );
      }
    } catch (e) {
      if (context.mounted) {
        DialogHelper.showErrorSnackBar(
          context: context,
          text: 'Gagal mengambil gambar: $e',
        );
      }
    }
  }

  void _showImageSourceBottomSheet(BuildContext blocContext) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Text(
                'Pilih Sumber Foto',
                style: GlobalHelper.getTextTheme(
                  context,
                  appTextStyle: AppTextStyle.TITLE_MEDIUM,
                )?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text('Kamera'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(blocContext, ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Galeri Foto'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage(blocContext, ImageSource.gallery);
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
      create: (context) => sl<MerchantBalanceManualTransferBloc>()
        ..add(MerchantBalanceManualTransferEventFetchDetail(widget.topUpItem.id)),
      child: BlocConsumer<
          MerchantBalanceManualTransferBloc,
          MerchantBalanceManualTransferState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }

          if (state.isSuccess) {
            DialogHelper.showSnackBar(
              context: context,
              text: state.successMessage ?? 'Bukti transfer berhasil dikirim!',
            );
            Navigator.of(context).pop(true);
          }
        },
        builder: (context, state) {
          final colorScheme = GlobalHelper.getColorSchema(context);
          final titleLarge = GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.TITLE_LARGE,
          );

          final currentItem = state.topUpItem ?? widget.topUpItem;

          return Scaffold(
            backgroundColor: Colors.grey[50],
            appBar: AppBar(
              title: const Text('Transfer Manual'),
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: colorScheme.primary),
              titleTextStyle: titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            body: SafeArea(
              child: state.isFetchingDetail && state.topUpItem == null
                  ? Center(
                      child: CircularProgressIndicator(
                        color: colorScheme.primary,
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        context.read<MerchantBalanceManualTransferBloc>().add(
                              MerchantBalanceManualTransferEventFetchDetail(
                                widget.topUpItem.id,
                              ),
                            );
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildNoticeBanner(context, currentItem),
                            const SizedBox(height: 16),
                            _buildAmountCard(context, currentItem),
                            const SizedBox(height: 16),
                            _buildBankDestinationCard(context, currentItem),
                            const SizedBox(height: 16),
                            _buildUploadProofCard(context, state, currentItem),
                            const SizedBox(height: 24),
                            PrimaryButton(
                              label: 'Kirim Bukti Transfer',
                              isLoading: state.isLoading,
                              onPressed: state.selectedImage == null
                                  ? null
                                  : () {
                                      context
                                          .read<
                                              MerchantBalanceManualTransferBloc>()
                                          .add(
                                            MerchantBalanceManualTransferEventSubmit(
                                              currentItem.id,
                                            ),
                                          );
                                    },
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNoticeBanner(
    BuildContext context,
    MerchantBalanceHistoryItemEntity item,
  ) {
    final colorScheme = GlobalHelper.getColorSchema(context);
    final statusLabel =
        item.paymentStatusLabel ?? 'Menunggu Unggah Bukti Transfer';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info_outline, color: colorScheme.primary, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statusLabel,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Silakan transfer tepat sesuai nominal yang tertera ke salah satu rekening tujuan di bawah, lalu unggah bukti transfer.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmountCard(
    BuildContext context,
    MerchantBalanceHistoryItemEntity item,
  ) {
    final colorScheme = GlobalHelper.getColorSchema(context);
    final amount = item.amount ?? 0;
    final reference = item.reference ?? item.id;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Total Nominal Transfer',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 6),
            Text(
              NumberHelper.formatIDR(amount),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const Divider(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nomor Referensi',
                  style: TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const SizedBox(height: 2),
                Text(
                  reference,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankDestinationCard(
    BuildContext context,
    MerchantBalanceHistoryItemEntity item,
  ) {
    final colorScheme = GlobalHelper.getColorSchema(context);
    final bankAccounts = item.destinationBankAccounts;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.account_balance, color: colorScheme.primary, size: 18),
                const SizedBox(width: 8),
                const Text(
                  'Rekening Tujuan Transfer',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (bankAccounts.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Informasi rekening tujuan belum tersedia. Silakan hubungi admin.',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              )
            else
              ...bankAccounts.map((account) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: colorScheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          account.bankName.isNotEmpty ? account.bankName : 'BANK',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                            fontSize: 13,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              account.accountNumber,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'a.n. ${account.accountName}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            if (item.transferInstructions != null &&
                item.transferInstructions!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                item.transferInstructions!,
                style: TextStyle(fontSize: 11, color: Colors.grey[700]),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildUploadProofCard(
    BuildContext context,
    MerchantBalanceManualTransferState state,
    MerchantBalanceHistoryItemEntity item,
  ) {
    final colorScheme = GlobalHelper.getColorSchema(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.upload_file, color: colorScheme.primary, size: 18),
                const SizedBox(width: 8),
                const Text(
                  'Unggah Bukti Transfer',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Pastikan foto bukti transfer terlihat jelas dengan nominal dan tujuan yang sesuai.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            const SizedBox(height: 14),
            if (item.transferProofUrl != null &&
                item.transferProofUrl!.isNotEmpty &&
                state.selectedImage == null) ...[
              Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        item.transferProofUrl!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Bukti transfer sebelumnya sudah diunggah. Anda dapat mengunggah ulang jika diperlukan.',
                        style: TextStyle(fontSize: 11, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (state.selectedImage != null)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colorScheme.primary),
                  color: colorScheme.primary.withValues(alpha: 0.03),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        state.selectedImage!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () => _showImageSourceBottomSheet(context),
                          icon: const Icon(Icons.edit, size: 14),
                          label: const Text('Ganti Foto', style: TextStyle(fontSize: 12)),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton.icon(
                          onPressed: () {
                            context
                                .read<MerchantBalanceManualTransferBloc>()
                                .add(
                                  const MerchantBalanceManualTransferEventRemoveImage(),
                                );
                          },
                          icon: const Icon(Icons.delete, size: 14, color: Colors.red),
                          label: const Text(
                            'Hapus',
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            else
              InkWell(
                onTap: () => _showImageSourceBottomSheet(context),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      style: BorderStyle.solid,
                    ),
                    color: Colors.grey.shade50,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_a_photo_outlined,
                        size: 40,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Pilih Foto Bukti Transfer',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Ambil dari Kamera atau Galeri (JPG, PNG)',
                        style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
