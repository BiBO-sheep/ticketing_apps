import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:ticketing_apps/core/assets/assets.gen.dart';
import 'package:ticketing_apps/core/components/button.dart';
import 'package:ticketing_apps/core/components/spaces.dart';
import 'package:ticketing_apps/core/constants/colors.dart';
import 'package:ticketing_apps/core/extensions/build_context_ext.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Pembayaran Berhasil',
          style: TextStyle(color: AppColors.white),
        ),
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Assets.images.back.image(color: AppColors.white),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: context.deviceHeight / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
              color: AppColors.primary,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Assets.images.receiptCard.provider(),
                alignment: Alignment.topCenter,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                children: [
                  Text(
                    'PAYMENT RECEIPT',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5,
                    ),
                  ),
                  SpaceHeight(16),
                  QrImageView(data: 'payment_receipt_data', version: QrVersions.auto,),
                  SpaceHeight(16),
                  Text('Scan this QR code to verify ticket payment.'),
                  SpaceHeight(18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('tagihan'),
                      Text('Rp.150.000'),
                    ],
                  ),
                  SpaceHeight(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Metode Pembayaran'),
                      Text('QRIS'),
                    ],
                  ),
                  SpaceHeight(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Waktu'),
                      Text('17.08.2026 14:00'),
                    ],
                  ),
                  SpaceHeight(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Status'),
                        Text('Belum Lunas'),
                      ],
                  ),
                  SpaceHeight(8),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(36, 0, 36, 16),
        child: Button.filled(onPressed: () {}, label: 'Cetak Transaksi', borderRadius: 20,),
      ),
    );
  }
}
