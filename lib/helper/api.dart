import 'package:dio/dio.dart';

class Api {
  final Dio dio = Dio();

  Future<dynamic> get({required String url}) async {
    try {
      Response response = await dio.get(url);
      print(response.data);
      return response.data;
    } on DioException catch (e) {
      throw Exception('${e.toString()}');}
    catch (e) {
      throw Exception(
        '${e.toString()}'
      );
    }

  }
}
