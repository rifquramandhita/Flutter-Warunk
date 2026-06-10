import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order_item.dart';
import 'package:warunk/app/features/customer/presentation/review_order/bloc/customer_review_order_bloc.dart';
import 'package:warunk/theme/app_colors.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';

class CustomerReviewOrderScreen extends StatefulWidget {
  final CustomerOrderEntity order;

  const CustomerReviewOrderScreen({Key? key, required this.order})
    : super(key: key);

  @override
  State<CustomerReviewOrderScreen> createState() =>
      _CustomerReviewOrderScreenState();
}

class _CustomerReviewOrderScreenState extends State<CustomerReviewOrderScreen> {
  final ImagePicker _picker = ImagePicker();
  bool _isPickingImage = false;

  Future<void> _pickImage(BuildContext context, String orderItemId) async {
    if (_isPickingImage) return;

    try {
      _isPickingImage = true;
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null && mounted) {
        context.read<CustomerReviewOrderBloc>().add(
          CustomerReviewOrderImageAdded(
            orderItemId: orderItemId,
            image: File(image.path),
          ),
        );
      }
    } finally {
      _isPickingImage = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerReviewOrderBloc>()
            ..add(CustomerReviewOrderInit(widget.order.items ?? [])),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Ulas Pesanan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          centerTitle: true,
          elevation: 0.5,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocConsumer<CustomerReviewOrderBloc, CustomerReviewOrderState>(
          listener: (context, state) {
            if (state.status == CustomerReviewOrderStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ulasan berhasil dikirim!')),
              );
              Navigator.pop(context, true); // Return true to indicate success
            } else if (state.status == CustomerReviewOrderStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage ?? 'Gagal mengirim ulasan'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state.status == CustomerReviewOrderStatus.loading) {
              return const Center(child: LoadingAppWidget());
            }

            final items = widget.order.items ?? [];
            if (items.isEmpty) {
              return const Center(
                child: Text('Tidak ada produk untuk diulas.'),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    itemCount: items.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 32),
                    itemBuilder: (context, index) {
                      final item = items[index];

                      final orderItemId = item.id;
                      if (orderItemId == null) return const SizedBox.shrink();

                      final reviewParam = state.reviews.firstWhere(
                        (r) => r.orderItemId == orderItemId,
                        orElse: () => CustomerOrderCompleteReviewParam(
                          orderItemId: orderItemId,
                          rating: 0,
                        ),
                      );

                      return _buildReviewItem(context, item, reviewParam);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 16,
                        offset: Offset(0, -4),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          state.status == CustomerReviewOrderStatus.loading
                          ? null
                          : () {
                              context.read<CustomerReviewOrderBloc>().add(
                                CustomerReviewOrderSubmitted(
                                  orderId: widget.order.id ?? '',
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Kirim Ulasan',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildReviewItem(
    BuildContext context,
    CustomerOrderItemEntity item,
    CustomerOrderCompleteReviewParam reviewParam,
  ) {
    final orderItemId = reviewParam.orderItemId;
    final product = item.product;
    final name = product?.name ?? 'Produk';
    final variantName = item.productVariantLabel;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: GlobalHelper.getColorSchema(
                  context,
                ).primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text('📦', style: TextStyle(fontSize: 24)),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (variantName != null && variantName.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      variantName,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Kualitas Produk',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            final ratingValue = index + 1;
            final isSelected = reviewParam.rating >= ratingValue;
            return IconButton(
              onPressed: () {
                context.read<CustomerReviewOrderBloc>().add(
                  CustomerReviewOrderRatingChanged(
                    orderItemId: orderItemId,
                    rating: ratingValue,
                  ),
                );
              },
              icon: Icon(
                isSelected ? Icons.star : Icons.star_border,
                color: isSelected ? Colors.orange : Colors.grey[400],
                size: 36,
              ),
            );
          }),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Bagaimana kualitas produk ini? (Opsional)',
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 13),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
          maxLines: 3,
          onChanged: (val) {
            context.read<CustomerReviewOrderBloc>().add(
              CustomerReviewOrderTextChanged(
                orderItemId: orderItemId,
                reviewText: val,
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        const Text(
          'Tambah Foto (Maks 3)',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ...List.generate(reviewParam.images.length, (index) {
              final file = reviewParam.images[index];
              return Stack(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: FileImage(file),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -8,
                    right: -8,
                    child: IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      onPressed: () {
                        context.read<CustomerReviewOrderBloc>().add(
                          CustomerReviewOrderImageRemoved(
                            orderItemId: orderItemId,
                            imageIndex: index,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
            if (reviewParam.images.length < 3)
              GestureDetector(
                onTap: () => _pickImage(context, orderItemId),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey[300]!,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.add_a_photo, color: Colors.grey),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
