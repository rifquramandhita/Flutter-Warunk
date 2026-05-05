import 'package:flutter/material.dart';
import 'package:warunk/core/constants/app_colors.dart';

/// Shared step indicator untuk alur checkout.
/// [currentStep]: 0=step pertama, 1=step kedua, 2=step ketiga (active).
/// [labels]: Custom label untuk setiap step (default: Keranjang, Checkout, Bayar).
class CheckoutStepIndicator extends StatelessWidget {
  final int currentStep;
  final List<String>? labels;
  const CheckoutStepIndicator({super.key, required this.currentStep, this.labels});

  @override
  Widget build(BuildContext context) {
    final steps = labels ?? ['Keranjang', 'Checkout', 'Bayar'];
    return Row(
      children: List.generate(steps.length * 2 - 1, (i) {
        if (i.isOdd) {
          final filled = (i ~/ 2) < currentStep;
          return Expanded(
            child: Container(height: 2, color: filled ? AppColors.primary : AppColors.greyBorder),
          );
        }
        final idx = i ~/ 2;
        final done   = idx < currentStep;
        final active = idx == currentStep;
        return Column(children: [
          Container(
            width: 32, height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (done || active) ? AppColors.primary : AppColors.white,
              border: Border.all(
                color: (done || active) ? AppColors.primary : AppColors.greyBorder,
                width: 2,
              ),
            ),
            child: Center(
              child: done
                  ? const Icon(Icons.check, color: Colors.white, size: 16)
                  : Text(
                      '${idx + 1}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: active ? Colors.white : AppColors.greyText,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            steps[idx],
            style: TextStyle(
              fontSize: 11,
              fontWeight: active ? FontWeight.w700 : FontWeight.w400,
              color: (done || active) ? AppColors.primary : AppColors.greyText,
            ),
          ),
        ]);
      }),
    );
  }
}
