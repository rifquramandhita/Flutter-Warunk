import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/merchant/domain/entity/merchant_notification.dart';
import 'package:warunk/app/features/merchant/presentation/notification/bloc/merchant_notification_bloc.dart';
import 'package:warunk/core/dependency/dependency.dart';
import 'package:warunk/core/helper/global_helper.dart';
import 'package:warunk/core/helper/dialog_helper.dart';
import 'package:warunk/core/widgets/loading_app_widget.dart';

class MerchantNotificationScreen extends StatelessWidget {
  const MerchantNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<MerchantNotificationBloc>()..add(MerchantNotificationEventLoad()),
      child: BlocConsumer<MerchantNotificationBloc, MerchantNotificationState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            DialogHelper.showErrorSnackBar(
              context: context,
              text: state.errorMessage!,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(appBar: _appBarBuild(), body: _bodyBuild(context));
        },
      ),
    );
  }

  AppBar _appBarBuild() => AppBar(title: Text('Notifikasi'));

  Widget _bodyBuild(BuildContext context) {
    final state = context.watch<MerchantNotificationBloc>().state;
    return SafeArea(
      child: Stack(
        children: [
          _bodyLayout(context),
          if (state.isLoading) const LoadingAppWidget(),
        ],
      ),
    );
  }

  Widget _bodyLayout(BuildContext context) {
    final state = context.watch<MerchantNotificationBloc>().state;
    return Column(children: [Expanded(child: _buildList(context, state))]);
  }

  Widget _buildList(BuildContext context, MerchantNotificationState state) {
    final items = state.items;
    final colorScheme = GlobalHelper.getColorSchema(context);

    if (items.isEmpty && !state.isLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.notifications_off_outlined,
                size: 36,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Tidak ada notifikasi',
              style:
                  GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_LARGE,
                  )?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.onSurface,
                  ),
            ),
            const SizedBox(height: 6),
            Text(
              'Notifikasi merchant kamu akan tampil di sini',
              style: GlobalHelper.getTextTheme(
                context,
                appTextStyle: AppTextStyle.BODY_MEDIUM,
              )?.copyWith(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (_, i) => _notifCard(context, items[i]),
    );
  }

  Widget _notifCard(BuildContext context, MerchantNotificationEntity notif) {
    final colorScheme = GlobalHelper.getColorSchema(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: notif.isRead ? 0.03 : 0.06),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
        border: notif.isRead
            ? null
            : Border.all(color: colorScheme.primary.withValues(alpha: 0.10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        notif.title ?? '',
                        style:
                            GlobalHelper.getTextTheme(
                              context,
                              appTextStyle: AppTextStyle.BODY_MEDIUM,
                            )?.copyWith(
                              fontWeight: notif.isRead
                                  ? FontWeight.w600
                                  : FontWeight.w800,
                              color: colorScheme.onSurface,
                              height: 1.35,
                            ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: notif.isRead
                              ? colorScheme.outline
                              : colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  notif.description ?? '',
                  style: GlobalHelper.getTextTheme(
                    context,
                    appTextStyle: AppTextStyle.BODY_SMALL,
                  )?.copyWith(color: colorScheme.onSurfaceVariant, height: 1.4),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 13,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _formatDate(notif.createdAt),
                      style: GlobalHelper.getTextTheme(
                        context,
                        appTextStyle: AppTextStyle.LABEL_SMALL,
                      )?.copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String? dateStr) {
    if (dateStr == null) return '';
    try {
      final date = DateTime.parse(dateStr).toLocal();
      final now = DateTime.now();
      final diff = now.difference(date);
      if (diff.inMinutes < 1) return 'Baru saja';
      if (diff.inMinutes < 60) return '${diff.inMinutes} menit lalu';
      if (diff.inHours < 24) return '${diff.inHours} jam lalu';
      if (diff.inDays == 1) return 'Kemarin';
      return '${date.day}/${date.month}/${date.year}';
    } catch (_) {
      return '';
    }
  }
}
