import 'package:flutter/material.dart';
import 'package:warunk/app/features/customer/domain/entity/customer_merchant.dart';
import 'package:warunk/theme/app_colors.dart';

class CustomerMerchantItemWidget extends StatelessWidget {
  final CustomerMerchantEntity store;
  final VoidCallback? onTap;

  const CustomerMerchantItemWidget({
    super.key,
    required this.store,
    this.onTap,
  });

  String get _status => store.isOpen ? 'Buka' : 'Tutup';
  Color get _statusColor =>
      store.isOpen ? const Color(0xFF3B8251) : const Color(0xFFE53935);

  String get _rating => (store.rating ?? 0.0).toStringAsFixed(1);
  String get _reviews => '${store.reviewsCount ?? 0}';

  String get _distance {
    if (store.distance != null) {
      if (store.distance! >= 1.0) {
        return '${store.distance!.toStringAsFixed(1)} km';
      } else {
        return '${(store.distance! * 1000).toInt()} m';
      }
    }
    return '-';
  }

  String get _location => store.city ?? store.district ?? store.address ?? '-';

  String get _promo {
    if (store.promoBadges != null && store.promoBadges!.isNotEmpty) {
      return store.promoBadges!.first;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.greyBorder),
        ),
        child: Row(
          children: [
            // Image placeholder
            Container(
              width: 86,
              height: 86,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: store.photo != null && store.photo!.isNotEmpty
                  ? ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16),
                      ),
                      child: Image.network(
                        store.photo!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                              child: Text('🏪', style: TextStyle(fontSize: 40)),
                            ),
                      ),
                    )
                  : const Center(
                      child: Text('🏪', style: TextStyle(fontSize: 40)),
                    ),
            ),
            const SizedBox(width: 12),
            // Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: Text(
                                  store.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.textDark,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (store.isVerified == true) ...[
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.verified,
                                  color: Colors.blue,
                                  size: 16,
                                ),
                              ],
                            ],
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: _statusColor.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            _status,
                            style: TextStyle(
                              color: _statusColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFF59E0B),
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$_rating ($_reviews)',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textDark,
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          '•',
                          style: TextStyle(color: AppColors.greyText),
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.radio_button_unchecked,
                          size: 10,
                          color: AppColors.greyText,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _distance,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.greyText,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _location,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.greyText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    if (_promo.isNotEmpty)
                      Row(
                        children: [
                          const Icon(
                            Icons.local_offer_rounded,
                            size: 14,
                            color: Color(0xFF3B8251),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _promo,
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF3B8251),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.chevron_right_rounded,
                color: AppColors.greyText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
