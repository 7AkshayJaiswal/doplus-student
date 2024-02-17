import 'package:get/get.dart';

import '../student_data_model.dart';

class StudentDataProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return StudentData.fromJson(map);
      if (map is List)
        return map.map((item) => StudentData.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<StudentData?> getStudentData(int id) async {
    final response = await get('studentdata/$id');
    return response.body;
  }

  Future<Response<StudentData>> postStudentData(
          StudentData studentdata) async =>
      await post('studentdata', studentdata);

  Future<Response> deleteStudentData(int id) async =>
      await delete('studentdata/$id');
}
