import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_promotion_national.dart';
import 'package:warunk/core/helper/global_helper.dart';

class MerchantDetailPromotionScreen extends StatelessWidget {
  final MerchantPromotionNationalEntity promo;

  const MerchantDetailPromotionScreen({super.key, required this.promo});

  @override
  Widget build(BuildContext context) {
    final colors = GlobalHelper.getColorSchema(context);
    final textThemeTitle = GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.TITLE_MEDIUM);
    final textThemeBody = GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_MEDIUM);
    
    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Detail Promo Nasional',
          style: textThemeTitle?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (promo.bannerImage != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  promo.bannerImage!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              promo.title,
              style: GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.HEADLINE_SMALL)?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: colors.primary),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    '${DateFormat('d MMM yyyy').format(promo.datetimeStart)} - ${DateFormat('d MMM yyyy').format(promo.datetimeEnd)}',
                    style: textThemeBody?.copyWith(color: colors.primary, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            if (promo.description != null && promo.description!.isNotEmpty) ...[
              Text(
                'Deskripsi',
                style: textThemeTitle?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                promo.description!,
                style: textThemeBody?.copyWith(color: colors.onSurfaceVariant),
              ),
              const SizedBox(height: 24),
            ],
            
            Text(
              'Syarat & Ketentuan',
              style: textThemeTitle?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colors.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: colors.outlineVariant),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailItem(context, 'Tipe Promo', promo.typeLabel),
                  const Divider(height: 24),
                  _buildDetailItem(context, 'Diskon', promo.discountLabel),
                  const Divider(height: 24),
                  _buildDetailItem(context, 'Min. Pembelian', promo.minPurchaseLabel),
                  if (promo.maxDiscountLabel != null && promo.maxDiscountLabel!.isNotEmpty) ...[
                    const Divider(height: 24),
                    _buildDetailItem(context, 'Maks. Diskon', promo.maxDiscountLabel!),
                  ],
                  const Divider(height: 24),
                  _buildDetailItem(context, 'Kuota', promo.quotaLabel),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            if (promo.hasJoined)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.withValues(alpha: 0.5)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Colors.green),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Anda sudah mengikuti promo ini',
                        style: textThemeBody?.copyWith(color: Colors.green, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              )
            else if (promo.isOpenToJoin)
               Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: colors.primary.withValues(alpha: 0.5)),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: colors.primary),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Anda belum mengikuti promo ini. Klik tombol Join pada halaman promo untuk bergabung.',
                        style: textThemeBody?.copyWith(color: colors.primary),
                      ),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(BuildContext context, String label, String value) {
    final colors = GlobalHelper.getColorSchema(context);
    final textThemeBody = GlobalHelper.getTextTheme(context, appTextStyle: AppTextStyle.BODY_MEDIUM);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: textThemeBody?.copyWith(color: colors.onSurfaceVariant),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: textThemeBody?.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
