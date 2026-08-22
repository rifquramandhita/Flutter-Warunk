import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/sales/presentation/merchant/bloc/sales_merchant_bloc.dart';
import 'package:warunk/app/features/sales/presentation/merchant/bloc/sales_merchant_event.dart';
import 'package:warunk/app/features/sales/presentation/merchant/sales_merchant_webview_screen.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/theme/app_colors.dart';

class SalesMerchantScreen extends StatelessWidget {
  const SalesMerchantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<SalesMerchantBloc>()..add(const SalesMerchantLoadEvent()),
      child: const _SalesMerchantContent(),
    );
  }
}

class _SalesMerchantContent extends StatelessWidget {
  const _SalesMerchantContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<SalesMerchantBloc, SalesMerchantState>(
        listener: (context, state) {
          if (state.claimSuccessMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.claimSuccessMessage!),
                backgroundColor: Colors.green,
              ),
            );
          } else if (state.claimErrorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.claimErrorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state.webviewErrorMessage != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.webviewErrorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state.webviewUrl != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SalesMerchantWebviewScreen(url: state.webviewUrl!),
              ),
            ).then((_) {
              // optional: clear webview url state when back if needed
            });
          }
        },
        listenWhen: (previous, current) =>
            previous.claimSuccessMessage != current.claimSuccessMessage ||
            previous.claimErrorMessage != current.claimErrorMessage ||
            previous.webviewErrorMessage != current.webviewErrorMessage ||
            previous.webviewUrl != current.webviewUrl,
        buildWhen: (previous, current) =>
            previous.isLoading != current.isLoading ||
            previous.errorMessage != current.errorMessage ||
            previous.merchants != current.merchants ||
            previous.isWebviewLoading != current.isWebviewLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          } else if (state.errorMessage != null) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (state.merchants != null) {
            final merchants = state.merchants!;
            if (merchants.isEmpty) {
              return const Center(
                child: Text('Tidak ada merchant yang ditemukan.'),
              );
            }

            return Stack(
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    context.read<SalesMerchantBloc>().add(
                      const SalesMerchantLoadEvent(),
                    );
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: merchants.length,
                    itemBuilder: (context, index) {
                      final merchant = merchants[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          onTap: () {
                            if (!state.isWebviewLoading) {
                              context.read<SalesMerchantBloc>().add(
                                    SalesMerchantOpenWebviewEvent(merchantId: merchant.id),
                                  );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        merchant.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text('${merchant.district}, ${merchant.city}'),
                                const SizedBox(height: 4),
                                Text('Telepon: ${merchant.whatsappNumber ?? "-"}'),
                                const SizedBox(height: 12),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: (merchant.isClaimed || state.isClaimLoading)
                                        ? null
                                        : () {
                                            context.read<SalesMerchantBloc>().add(
                                              SalesMerchantClaimEvent(
                                                merchantId: merchant.id,
                                              ),
                                            );
                                          },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primary,
                                      disabledBackgroundColor: Colors.grey[300],
                                    ),
                                    child: state.isClaimLoading
                                        ? const SizedBox(
                                            height: 16,
                                            width: 16,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : Text(
                                            merchant.isClaimed
                                                ? 'Telah di-Claim'
                                                : 'Claim Merchant',
                                            style: TextStyle(
                                              color: merchant.isClaimed
                                                  ? Colors.grey[600]
                                                  : Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (state.isWebviewLoading)
                  Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    child: const Center(
                      child: CircularProgressIndicator(color: AppColors.primary),
                    ),
                  ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
