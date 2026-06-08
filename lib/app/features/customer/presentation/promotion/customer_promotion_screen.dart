import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_order.dart';
import 'package:warunk/app/features/customer/presentation/promotion/bloc/customer_promotion_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/widgets/primary_button.dart';
import 'package:warunk/core/helper/global_helper.dart';

class CustomerPromotionScreen extends StatefulWidget {
  final CustomerOrderGetPromotionParam param;

  const CustomerPromotionScreen({super.key, required this.param});

  @override
  State<CustomerPromotionScreen> createState() =>
      _CustomerPromotionScreenState();
}

class _CustomerPromotionScreenState extends State<CustomerPromotionScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<CustomerPromotionBloc>()
            ..add(CustomerPromotionEventGet(widget.param)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Pilih Promo',
            style: GlobalHelper.getTextTheme(
              context,
              appTextStyle: AppTextStyle.TITLE_LARGE,
            )?.copyWith(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          backgroundColor: GlobalHelper.getColorSchema(context).surface,
        ),
        body: BlocBuilder<CustomerPromotionBloc, CustomerPromotionState>(
          builder: (context, state) {
            return Column(
              children: [
                _buildInputPromo(context),
                const Divider(height: 1, thickness: 1),
                Expanded(child: _buildPromoList(context, state)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInputPromo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _codeController,
              decoration: InputDecoration(
                hintText: 'Masukkan kode promo',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: GlobalHelper.getColorSchema(context).outline,
                  ),
                ),
              ),
              onChanged: (val) {},
            ),
          ),
          const SizedBox(width: 16),
          PrimaryButton(
            label: 'Terapkan',
            width: 100,
            onPressed: () {
              if (_codeController.text.isNotEmpty) {
                Navigator.pop(context, {'code': _codeController.text});
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPromoList(BuildContext context, CustomerPromotionState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.errorMessage != null) {
      return Center(
        child: Text(
          state.errorMessage!,
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_LARGE,
          )?.copyWith(color: GlobalHelper.getColorSchema(context).error),
        ),
      );
    }

    if (state.promotions.isEmpty) {
      return Center(
        child: Text(
          'Tidak ada promo yang tersedia',
          style: GlobalHelper.getTextTheme(
            context,
            appTextStyle: AppTextStyle.BODY_LARGE,
          )?.copyWith(color: GlobalHelper.getColorSchema(context).outline),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.promotions.length,
      itemBuilder: (context, index) {
        final promo = state.promotions[index];
        final title = promo.title ?? 'Promo';
        final description = promo.discountLabel ?? '';

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: GlobalHelper.getColorSchema(
                context,
              ).outline.withValues(alpha: 0.3),
            ),
          ),
          elevation: 0,
          color: GlobalHelper.getColorSchema(context).surface,
          child: InkWell(
            onTap: () {
              Navigator.pop(context, {'promo': promo});
            },
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GlobalHelper.getTextTheme(
                      context,
                      appTextStyle: AppTextStyle.TITLE_MEDIUM,
                    )?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  if (description.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style:
                          GlobalHelper.getTextTheme(
                            context,
                            appTextStyle: AppTextStyle.BODY_MEDIUM,
                          )?.copyWith(
                            color: GlobalHelper.getColorSchema(context).outline,
                          ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
