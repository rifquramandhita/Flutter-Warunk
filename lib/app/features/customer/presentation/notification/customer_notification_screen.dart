import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warunk/app/features/customer/presentation/notification/bloc/customer_notification_bloc.dart';
import 'package:warunk/theme/app_colors.dart';

class CustomerNotificationScreen extends StatelessWidget {
  const CustomerNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomerNotificationBloc(),
      child: const _NotificationView(),
    );
  }
}

class _NotificationView extends StatelessWidget {
  const _NotificationView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<CustomerNotificationBloc, CustomerNotificationState>(
          builder: (context, state) {
            return Column(
              children: [
                _buildHeader(context, state),
                _buildTabs(context, state),
                const SizedBox(height: 8),
                Expanded(child: _buildList(context, state)),
              ],
            );
          },
        ),
      ),
    );
  }

  // ── Header ────────────────────────────────────────────────────────────────
  Widget _buildHeader(BuildContext context, CustomerNotificationState state) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: Row(
        children: [
          const Text(
            'Notifikasi',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
            ),
          ),
          const Spacer(),
          // Mark all read
          if (state.unreadCount > 0)
            GestureDetector(
              onTap: () => context.read<CustomerNotificationBloc>().add(
                CustomerNotificationMarkAllRead(),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Tandai semua',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          const SizedBox(width: 10),
          // Filter icon
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.greyBorder),
            ),
            child: const Icon(
              Icons.tune_rounded,
              color: AppColors.textDark,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  // ── Tabs ──────────────────────────────────────────────────────────────────
  Widget _buildTabs(BuildContext context, CustomerNotificationState state) {
    final tabs = ['Semua', 'Transaksi', 'Promo'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: AppColors.greyBorder),
        ),
        child: Row(
          children: List.generate(tabs.length, (i) {
            final active = state.selectedTab == i;
            return Expanded(
              child: GestureDetector(
                onTap: () => context.read<CustomerNotificationBloc>().add(
                  CustomerNotificationTabChanged(i),
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  decoration: BoxDecoration(
                    color: active ? AppColors.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Center(
                    child: Text(
                      tabs[i],
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: active ? Colors.white : AppColors.greyText,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  // ── List ──────────────────────────────────────────────────────────────────
  Widget _buildList(BuildContext context, CustomerNotificationState state) {
    final items = state.filtered;
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications_off_outlined,
                size: 36,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Tidak ada notifikasi',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Notifikasi kamu akan tampil di sini',
              style: TextStyle(fontSize: 13, color: AppColors.greyText),
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

  // ── Notification card ─────────────────────────────────────────────────────
  Widget _notifCard(BuildContext context, CustomerNotifItemEntity notif) {
    return GestureDetector(
      onTap: () => context.read<CustomerNotificationBloc>().add(
        CustomerNotificationRead(notif.id),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.white,
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
              : Border.all(color: AppColors.primary.withValues(alpha: 0.10)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail + badge icon
            _buildThumbnail(notif),
            const SizedBox(width: 14),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + promo tag + unread dot
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          notif.title,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: notif.isRead
                                ? FontWeight.w600
                                : FontWeight.w800,
                            color: AppColors.textDark,
                            height: 1.35,
                          ),
                        ),
                      ),
                      if (notif.hasPromoLabel) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3E0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Promo',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFF59E0B),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(width: 8),
                      // Unread/read dot
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: notif.isRead
                                ? AppColors.greyBorder
                                : AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  // Body / subtitle
                  Text(
                    notif.body,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.greyText,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Time
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time_rounded,
                        size: 13,
                        color: AppColors.greyText,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        notif.timeLabel,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.greyText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Thumbnail with badge ──────────────────────────────────────────────────
  Widget _buildThumbnail(CustomerNotifItemEntity notif) {
    final badgeIcon = IconData(
      notif.badgeIconCode,
      fontFamily: 'MaterialIcons',
    );
    final badgeBg = Color(notif.badgeBgColor);
    final badgeFg = Color(notif.badgeIconColor);

    return SizedBox(
      width: 64,
      height: 64,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main image / color circle
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: notif.hasStoreThumbnail
                ? _StoreThumbnail(
                    color1: Color(notif.storeColor1),
                    color2: Color(notif.storeColor2),
                    initial: notif.storeInitial,
                  )
                : Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(notif.storeColor1),
                          Color(notif.storeColor2),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        notif.storeInitial,
                        style: TextStyle(
                          fontSize: notif.storeInitial.length > 1 ? 18 : 24,
                          fontWeight: FontWeight.w900,
                          color: notif.storeColor1 == 0xFFFFF9C4
                              ? const Color(0xFFF59E0B)
                              : Colors.white.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ),
          ),
          // Badge icon circle (bottom-right)
          Positioned(
            bottom: -4,
            right: -4,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: badgeBg,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Icon(badgeIcon, color: badgeFg, size: 14),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Store thumbnail painter (same pattern as transaction screen) ───────────
class _StoreThumbnail extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String initial;
  const _StoreThumbnail({
    required this.color1,
    required this.color2,
    required this.initial,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: _ThumbnailPainter(color1: color1, color2: color2),
        ),
        Center(
          child: Text(
            initial,
            style: TextStyle(
              fontSize: initial.length > 2 ? 11 : 14,
              fontWeight: FontWeight.w900,
              color: Colors.white.withValues(alpha: 0.3),
            ),
          ),
        ),
        // Sign bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: color1.withValues(alpha: 0.85),
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            child: Text(
              initial,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 6,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ThumbnailPainter extends CustomPainter {
  final Color color1;
  final Color color2;
  _ThumbnailPainter({required this.color1, required this.color2});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color2, color1],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );
    final shelfPaint = Paint()..color = Colors.black.withValues(alpha: 0.12);
    for (int i = 0; i < 2; i++) {
      final y = size.height * (0.35 + i * 0.28);
      canvas.drawRect(Rect.fromLTWH(0, y, size.width, 3), shelfPaint);
    }
    final rng = math.Random(color1.toARGB32());
    final colors = [
      Colors.red,
      Colors.yellow,
      Colors.orange,
      Colors.blue,
      Colors.green,
    ];
    for (int i = 0; i < 2; i++) {
      final y = size.height * (0.35 + i * 0.28) - 8;
      double x = 2;
      while (x < size.width - 4) {
        final w = 4.0 + rng.nextDouble() * 6;
        canvas.drawRect(
          Rect.fromLTWH(x, y - 6, w, 8),
          Paint()
            ..color = colors[rng.nextInt(colors.length)].withValues(alpha: 0.7),
        );
        x += w + 2;
      }
    }
  }

  @override
  bool shouldRepaint(_ThumbnailPainter old) => false;
}
