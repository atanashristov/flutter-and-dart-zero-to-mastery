import 'package:adviser/0_data/datasources/advice_remote_datasource.dart';
import 'package:adviser/0_data/exceptions/exceptions.dart';
import 'package:adviser/0_data/models/advice_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';

import 'advice_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>()])
void main() {
  group('AdviceRemoteDataSource', () {
    group('should return AdviceModel', () {
      test('when Client response was 200 and has valid data', () async {
        final mockClient = MockClient();
        final sut = AdviceRemoteDataSourceImpl(client: mockClient);
        const responseBody = '''
{
  "advice_id": 1,
  "advice": "test advice"
}
''';

        when(mockClient.get(
          Uri.parse('https://api.flutter-community.com/api/v1/advice'),
          headers: {'accept': 'application/json'},
        )).thenAnswer(
          (realInvocation) => Future.value(
            Response(responseBody, 200),
          ),
        );

        final result = await sut.getRandomAdviceFromApi();

        expect(result, AdviceModel(id: 1, advice: 'test advice'));
      });
    });
  });

  group('should throw', () {
    test('a Server exception when Client response is not 200', () {
      final mockClient = MockClient();
      final sut = AdviceRemoteDataSourceImpl(client: mockClient);
      when(mockClient.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {'accept': 'application/json'},
      )).thenAnswer((realInvocation) => Future.value(Response('', 201)));

      expect(() => sut.getRandomAdviceFromApi(), throwsA(isA<ServerException>()));
    });

    test('a Type Error exception when Client response is 200 and has no valid data', () {
      final mockClient = MockClient();
      final sut = AdviceRemoteDataSourceImpl(client: mockClient);
      const responseBody = '''
{
  "advice": "test advice"
}
''';
      when(mockClient.get(
        Uri.parse('https://api.flutter-community.com/api/v1/advice'),
        headers: {'accept': 'application/json'},
      )).thenAnswer((realInvocation) => Future.value(Response(responseBody, 200)));

      expect(() => sut.getRandomAdviceFromApi(), throwsA(isA<TypeError>()));
    });
  });
}
