import 'package:flutter/material.dart';
import 'package:warunk/theme/app_colors.dart';

class CustomerDetailProductScreen extends StatefulWidget {
  final String productName;
  final String price;
  final String subtitle;
  final Color color;
  final IconData icon;

  const CustomerDetailProductScreen({
    super.key,
    required this.productName,
    required this.price,
    required this.subtitle,
    required this.color,
    required this.icon,
  });

  @override
  State<CustomerDetailProductScreen> createState() =>
      _DetailProductScreenState();
}

class _DetailProductScreenState extends State<CustomerDetailProductScreen> {
  int _qty = 1;
  bool _descExpanded = false;
  final _noteCtrl = TextEditingController();

  static const _relatedProducts = [
    ('Telur Ayam', 'Rp2.500', Icons.egg_rounded, Color(0xFFFFF8E1)),
    ('Teh Botol', 'Rp4.000', Icons.local_drink_rounded, Color(0xFFFFE0E0)),
    ('Kopi Sachet', 'Rp500', Icons.coffee_rounded, Color(0xFFEFEBE9)),
  ];

  String get _totalPrice {
    final raw = widget.price.replaceAll(RegExp(r'[^0-9]'), '');
    final num = int.tryParse(raw) ?? 0;
    final total = num * _qty;
    // Format with thousand separator
    final str = total.toString();
    final buf = StringBuffer('Rp');
    for (var i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) buf.write('.');
      buf.write(str[i]);
    }
    return buf.toString();
  }

  @override
  void dispose() {
    _noteCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              // ── App bar ─────────────────────────────────────────────────────
              SliverAppBar(
                backgroundColor: AppColors.background,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.greyBorder),
                    ),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: AppColors.textDark,
                      size: 20,
                    ),
                  ),
                ),
                title: const Text(
                  'Detail Produk',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),
                centerTitle: true,
                actions: [
                  Container(
                    margin: const EdgeInsets.only(right: 12, top: 8, bottom: 8),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.greyBorder),
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                        color: AppColors.textDark,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
                pinned: true,
              ),

              // ── Product image ────────────────────────────────────────────────
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Container(
                    height: 230,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: widget.color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Icon(
                        widget.icon,
                        size: 110,
                        color: AppColors.primary.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                ),
              ),

              // ── Info section ─────────────────────────────────────────────────
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name + Best Seller
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.productName,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: AppColors.textDark,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF3C4),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.star_rounded,
                                  color: Color(0xFFF59E0B),
                                  size: 13,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Best Seller',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFF59E0B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Category badge
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.eco_rounded,
                              size: 12,
                              color: AppColors.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.subtitle.isNotEmpty
                                  ? 'Makanan Instan'
                                  : 'Produk Segar',
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Rating
                      Row(
                        children: const [
                          Icon(
                            Icons.star_rounded,
                            color: Color(0xFFFBBC05),
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '4.9 (2.1rb)',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.textDark,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Price
                      Text(
                        widget.price,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                        ),
                      ),

                      const Divider(height: 28, color: AppColors.greyBorder),

                      // Description
                      GestureDetector(
                        onTap: () =>
                            setState(() => _descExpanded = !_descExpanded),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Deskripsi',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                Icon(
                                  _descExpanded
                                      ? Icons.keyboard_arrow_up_rounded
                                      : Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.greyText,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '${widget.productName} adalah produk pilihan terbaik yang tersedia di warung kami. Berkualitas tinggi, higienis, dan siap memenuhi kebutuhan sehari-hari kamu. Cocok untuk segala keperluan, praktis dan mengenyangkan.',
                              maxLines: _descExpanded ? null : 3,
                              overflow: _descExpanded
                                  ? TextOverflow.visible
                                  : TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 13,
                                color: AppColors.greyText,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const Divider(height: 28, color: AppColors.greyBorder),

                      // Quantity
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Jumlah',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                          ),
                          Row(
                            children: [
                              _qtyButton(Icons.remove, () {
                                if (_qty > 1) setState(() => _qty--);
                              }),
                              Container(
                                width: 42,
                                alignment: Alignment.center,
                                child: Text(
                                  '$_qty',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ),
                              _qtyButton(
                                Icons.add,
                                () => setState(() => _qty++),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const Divider(height: 28, color: AppColors.greyBorder),

                      // Notes
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Catatan untuk penjual ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                            ),
                            TextSpan(
                              text: '(Opsional)',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.greyText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _noteCtrl,
                        maxLength: 100,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 13,
                          color: AppColors.textDark,
                        ),
                        decoration: InputDecoration(
                          hintText:
                              'Contoh: Tidak usah pakai sendok, tolong dipilihkan yang exp lama, dll.',
                          hintStyle: const TextStyle(
                            color: AppColors.greyText,
                            fontSize: 13,
                            height: 1.4,
                          ),
                          counterStyle: const TextStyle(
                            color: AppColors.greyText,
                            fontSize: 11,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: AppColors.greyBorder,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: AppColors.greyBorder,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                            ),
                          ),
                          contentPadding: const EdgeInsets.all(12),
                          filled: true,
                          fillColor: AppColors.white,
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Related products
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Produk Terkait',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: AppColors.textDark,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Row(
                              children: [
                                Text(
                                  'Lihat semua',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right_rounded,
                                  color: AppColors.primary,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Related horizontal list
                      SizedBox(
                        height: 150,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _relatedProducts.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                          itemBuilder: (context, i) {
                            final (name, price, icon, color) =
                                _relatedProducts[i];
                            return Container(
                              width: 110,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: AppColors.greyBorder),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius:
                                            const BorderRadius.vertical(
                                              top: Radius.circular(13),
                                            ),
                                      ),
                                      child: Center(
                                        child: Icon(
                                          icon,
                                          size: 40,
                                          color: AppColors.primaryLight,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name,
                                          style: const TextStyle(
                                            fontSize: 11,
                                            fontWeight: FontWeight.w700,
                                            color: AppColors.textDark,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              price,
                                              style: const TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w700,
                                                color: AppColors.primary,
                                              ),
                                            ),
                                            Container(
                                              width: 22,
                                              height: 22,
                                              decoration: BoxDecoration(
                                                color: AppColors.primary,
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ── Bottom bar ────────────────────────────────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total Harga',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.greyText,
                        ),
                      ),
                      Text(
                        _totalPrice,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.shopping_cart_outlined, size: 18),
                      label: const Text(
                        'Tambah ke Keranjang',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.primary, size: 18),
      ),
    );
  }
}
