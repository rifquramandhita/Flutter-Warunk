import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order_item.dart';
import 'package:warunk/app/features/customer/presentation/review_order/bloc/customer_review_order_bloc.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/main.dart';

class CustomerReviewOrderScreen extends StatelessWidget {
  final CustomerOrderEntity order;

  const CustomerReviewOrderScreen({super.key, required this.order});

  Future<void> _pickImage(BuildContext context, String orderItemId) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null && context.mounted) {
      context.read<CustomerReviewOrderBloc>().add(
        CustomerReviewOrderImageAdded(
          orderItemId: orderItemId,
          image: File(image.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerReviewOrderBloc>()
            ..add(CustomerReviewOrderInit(order.items ?? [])),
      child: BlocConsumer<CustomerReviewOrderBloc, CustomerReviewOrderState>(
        listener: (context, state) {
          if (state.status == CustomerReviewOrderStatus.success) {
            DialogHelper.showSnackBar(
              context: context,
              text: 'Ulasan berhasil dikirim!',
            );
            navigatorKey.currentState?.pop(true);
          } else if (state.status == CustomerReviewOrderStatus.failure) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage ?? 'Gagal mengirim ulasan',
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Ulas Pesanan')),
            body: _bodyBuild(context),
          );
        },
      ),
    );
  }

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<CustomerReviewOrderBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          if (state.status == CustomerReviewOrderStatus.loading)
            const LoadingAppWidget()
          else
            const SizedBox(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<CustomerReviewOrderBloc>().state;
    final items = order.items ?? [];
    
    if (items.isEmpty) {
      return Center(
        child: Text(
          'Tidak ada produk untuk diulas.',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_MEDIUM,
          ),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (context, index) => Divider(
              height: 32,
              color: GlobalHelper.getColorSchema(context).outlineVariant,
            ),
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
        _buildSubmitButton(context, state),
      ],
    );
  }
  
  Widget _buildSubmitButton(BuildContext context, CustomerReviewOrderState state) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: GlobalHelper.getColorSchema(context).surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 16,
            offset: const Offset(0, -4),
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
                      orderId: order.id ?? '',
                    ),
                  );
                },
          style: ElevatedButton.styleFrom(
            backgroundColor: GlobalHelper.getColorSchema(context).primary,
            foregroundColor: GlobalHelper.getColorSchema(context).onPrimary,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Kirim Ulasan',
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.BODY_MEDIUM,
            )?.copyWith(
              fontWeight: FontWeight.bold,
              color: GlobalHelper.getColorSchema(context).onPrimary,
            ),
          ),
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
                    style: GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.BODY_MEDIUM,
                    )?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (variantName != null && variantName.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      variantName,
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.BODY_SMALL,
                      )?.copyWith(
                        color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Kualitas Produk',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_MEDIUM,
          )?.copyWith(fontWeight: FontWeight.w600),
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
                color: isSelected 
                  ? Colors.orange 
                  : GlobalHelper.getColorSchema(context).outlineVariant,
                size: 36,
              ),
            );
          }),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Bagaimana kualitas produk ini? (Opsional)',
            hintStyle: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.BODY_SMALL,
            )?.copyWith(
              color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: GlobalHelper.getColorSchema(context).outlineVariant,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: GlobalHelper.getColorSchema(context).outlineVariant,
              ),
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
        Text(
          'Tambah Foto (Maks 3)',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_MEDIUM,
          )?.copyWith(fontWeight: FontWeight.w600),
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
                    color: GlobalHelper.getColorSchema(context).surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: GlobalHelper.getColorSchema(context).outlineVariant,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.add_a_photo, 
                      color: GlobalHelper.getColorSchema(context).onSurfaceVariant,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
