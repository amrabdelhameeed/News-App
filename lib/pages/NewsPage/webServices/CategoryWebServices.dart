import 'package:dio/dio.dart';

class CategoryWebServices {
  late Dio dio;
  CategoryWebServices(){
    BaseOptions options = BaseOptions (
      baseUrl: "https://newsapi.org/v2/",
      receiveDataWhenStatusError: true
    );
    dio = Dio(options);
  }
  Future<Map<String,dynamic>> getCategoryData(String category) async {
    Response response = await dio.get("top-headlines",queryParameters: {
      "country":"eg",
      "category":category,
      "apiKey":"2409b49cd187419c8cac5c08e79bdfe1"
    });
    return response.data;
  }
}