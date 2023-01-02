void main() async {
  final dataService = DataService();
  String data = await dataService.getData();
  print('Here is the data from service: $data');
}

class DataService {
  Future<String> getData() async {
    final dataFromCloud = await _getDataFromCloud();
    final parsedData = await _parseDataFromCloud(dataFromCloud);

    //! alternative
    // final parsedData = await _getDataFromCloud().then((dataFromCloud) async {
    //   return await _parseDataFromCloud(dataFromCloud);
    // });

    return parsedData;
  }

  Future<String> _getDataFromCloud() async {
    // get data from cloud -> time
    await Future.delayed(Duration(seconds: 4));
    print('Got data from cloud');
    return "fake data";
  }

  Future<String> _parseDataFromCloud(String dataFromCloud) async {
    // get data from cloud -> time
    await Future.delayed(Duration(seconds: 2));
    print('Parsed data from cloud');
    return "parsed data";
  }
}
