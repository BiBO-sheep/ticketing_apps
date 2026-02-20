// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:ticketing_apps/core/data/local_datasources/product_local_datasources.dart';
import 'package:ticketing_apps/core/data/remotedatasources/product_remote_datasources.dart';
import 'package:ticketing_apps/models/responses/product_response_model.dart';

part 'product_bloc.freezed.dart';
part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRemoteDataSource productRemoteDataSource;
  final ProductLocaldatasource productLocaldatasource;
  ProductBloc(this.productRemoteDataSource, this.productLocaldatasource)
    : super(_Initial()) {
    List<Product> product = [];
    on<_getProduct>((event, emit) async {
      emit(_Loading());
      final response = await productRemoteDataSource.getProducts();

      response.fold(
        (error) {
          emit(_Error(error));
        },
        (data) {
          emit(_Success(data.data ?? []));
        },
      );
      // TODO: implement event handler
    });
    on<_syncProduct>((event, emit) async {
      final List<ConnectivityResult> connectivityResult = await (Connectivity()
          .checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.none)) {
        emit(_Error('No Internet connection'));
      } else {
        emit(_Loading());
        final response = await productRemoteDataSource.getProducts();
        productLocaldatasource.removeAllProduct();
        productLocaldatasource.insertAllProduct(
          response.getOrElse(() => ProductResponseModel(data: [])).data ?? [],
        );

        product =
            response.getOrElse(() => ProductResponseModel(data: [])).data ?? [];

        emit(_Success(product));
      }
      // TODO: implement event handler
    });
    on<_getLocalProduct>((event, emit) async {
      emit(_Loading());
      final localData = await productLocaldatasource.getProduct();
      product = localData;
      emit(_Success(localData));
      // TODO: implement event handler
    });
  }
}
