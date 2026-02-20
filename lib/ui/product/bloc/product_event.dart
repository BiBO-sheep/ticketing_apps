part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = _Started;
  const factory ProductEvent.getProduct() = _getProduct;
  const factory ProductEvent.syncProducts() = _syncProduct;
  const factory ProductEvent.getLocalProduct() = _getLocalProduct;
}