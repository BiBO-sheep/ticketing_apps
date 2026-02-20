import 'package:dartz/dartz.dart';
import 'package:ticketing_apps/core/constants/variable.dart';
import 'package:ticketing_apps/core/data/local_datasources/auth_local_datasources.dart';
import 'package:ticketing_apps/models/responses/product_response_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  Future<Either<String, ProductResponseModel>> getProducts() async {
    final authData = await AuthlocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variable.baseUrl}api/products/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData.token}',
      },
    );
    if (response.statusCode == 200) {
      return Right(ProductResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }
}
