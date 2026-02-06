import 'package:flutter/material.dart';
import 'package:ticketing_apps/core/assets/assets.gen.dart';
import 'package:ticketing_apps/core/components/button.dart';
import 'package:ticketing_apps/core/components/spaces.dart';
import 'package:ticketing_apps/core/constants/colors.dart';
import 'package:ticketing_apps/core/extensions/idr_currency.dart';
import 'package:ticketing_apps/core/widgets/payment_method_button.dart';
import 'package:ticketing_apps/ui/dialog/payment_qris_dialog.dart';
import 'package:ticketing_apps/ui/home/model/product_model.dart';

class OrderDetailScreen extends StatelessWidget {
  final List<ProductModel> products;
  const OrderDetailScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    int paymentButtonIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Pesanan'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Assets.images.back.image(),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          final item = products[index];
          return Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.stroke),
              borderRadius: BorderRadius.circular(46),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.productName,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(item.type),
                      ],
                    ),
                  ],
                ),
                SpaceHeight(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${item.price.currencyFormatRp} x ${item.quantity}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      (item.price * item.quantity).currencyFormatRp,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SpaceHeight(20),
        itemCount: products.length,
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: PaymentMethodButton(
                        iconPath: Assets.icons.payment.qris.path,
                        label: 'QRIS',
                        isActive: paymentButtonIndex == 0,
                        onPressed: () => setState(() => paymentButtonIndex = 0),
                      ),
                    ),
                    SpaceWidth(12),
                    Expanded(
                      child: PaymentMethodButton(
                        iconPath: Assets.icons.payment.tunai.path,
                        label: 'Tunai',
                        isActive: paymentButtonIndex == 1,
                        onPressed: () => setState(() => paymentButtonIndex = 1),
                      ),
                    ),
                    SpaceWidth(12),
                    Expanded(
                      child: PaymentMethodButton(
                        iconPath: Assets.icons.payment.transfer.path,
                        label: 'Transfer',
                        isActive: paymentButtonIndex == 2,
                        onPressed: () => setState(() => paymentButtonIndex = 2),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SpaceHeight(32),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 30,
                  spreadRadius: 0,
                  offset: Offset(0, -2),
                  color: AppColors.black.withOpacity(0 / 100),
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order Summary",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SpaceHeight(4),
                      Text(
                        200000.currencyFormatRp,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Button.filled(
                    onPressed: () {
                      if (paymentButtonIndex == 0) {
                        showDialog(
                          context: context,
                          builder: (context) => PaymentQrisDialog(),
                        );
                      }
                    },
                    label: "Proccess",
                    borderRadius: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
