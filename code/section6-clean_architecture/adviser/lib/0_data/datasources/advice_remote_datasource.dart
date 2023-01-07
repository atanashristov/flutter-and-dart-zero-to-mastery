import 'dart:convert';

import 'package:adviser/0_data/exceptions/exceptions.dart';
import 'package:adviser/0_data/models/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceRemoteDataSource {
  /// Request random advice from API
  /// Returns [AdviceModel] if successful
  /// Throws ServerException if status code is not 200.
  Future<AdviceModel> getRandomAdviceFromApi();
}

class AdviceRemoteDataSourceImpl implements AdviceRemoteDataSource {
  final http.Client client;

  AdviceRemoteDataSourceImpl({required this.client});

  @override
  Future<AdviceModel> getRandomAdviceFromApi() async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {'accept': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw ServerException();
    }

    final responseBody = json.decode(response.body);
    return AdviceModel.fromJson(responseBody);
  }
}
