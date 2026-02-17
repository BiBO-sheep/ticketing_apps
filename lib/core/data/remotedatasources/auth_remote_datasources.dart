import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:ticketing_apps/core/constants/variable.dart';
import 'package:ticketing_apps/core/data/local_datasources/auth_local_datasources.dart';
import 'package:ticketing_apps/models/requests/login_request_model.dart';
import 'package:ticketing_apps/models/responses/login_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, LoginResponseModel>> login(
    LoginRequestModel data,
  ) async {
    final response = await http.post(
      Uri.parse('${Variable.baseUrl}api/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: data.toJson(),
    );

    if (response.statusCode == 200) {
      return Right(LoginResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthlocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variable.baseUrl}api/login'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData.token}',
      },
    );

    if (response.statusCode == 200) {
      return Right('Logout Success');
    } else {
      return Left(response.body);
    }
  }
}
