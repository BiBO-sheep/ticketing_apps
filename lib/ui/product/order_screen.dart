import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ticketing_apps/core/assets/assets.gen.dart';
import 'package:ticketing_apps/core/components/button.dart';
import 'package:ticketing_apps/core/components/spaces.dart';
import 'package:ticketing_apps/core/constants/colors.dart';
import 'package:ticketing_apps/core/extensions/build_context_ext.dart';
import 'package:ticketing_apps/core/extensions/idr_currency.dart';
import 'package:ticketing_apps/models/responses/product_response_model.dart';
import 'package:ticketing_apps/ui/home/model/product_model.dart';
import 'package:ticketing_apps/ui/home/order_detail_screen.dart';
import 'package:ticketing_apps/ui/product/bloc/product_bloc.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  void initState() {
    context.read<ProductBloc>().add(ProductEvent.getLocalProduct());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Penjualan Ticket')),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          final products = state.maybeWhen(
            orElse: () => [],
            success: (products) => products,
          );

          if (products.isEmpty) {
            return Center(child: Text('No Product Avaible'));
          }

          return ListView.separated(
            itemBuilder: (context, index) {
              final Product item = products[index];
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
                              item.name ?? '',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            Text(item.criteria ?? ''),
                          ],
                        ),
                        Row(
                          children: [
                            Assets.icons.reduceQuantity.svg(),
                            Text(
                              '0',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Assets.icons.addQuantity.svg(),
                          ],
                        ),
                      ],
                    ),
                    SpaceHeight(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.price!.currencyFormatRp,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          item.price!.currencyFormatRp,
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
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Order Summary',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    SpaceHeight(4),
                    Text(
                      30000000.currencyFormatRp,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Button.filled(
                  onPressed: () {
                    context.push(
                      OrderDetailScreen(
                        products: [dummyProducts[0], dummyProducts[4]],
                      ),
                    );
                  },
                  label: 'Checkout',
                  borderRadius: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
