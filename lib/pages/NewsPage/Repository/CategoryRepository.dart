import 'package:newsappfinal/pages/NewsPage/models/category_model.dart';
import 'package:newsappfinal/pages/NewsPage/webServices/CategoryWebServices.dart';

class CategoryRepository {
  final CategoryWebServices categoryWebServices;

  CategoryRepository(this.categoryWebServices);

  
  Future<List<dynamic>> getCategoryData(String category) async {
    final allNews = await categoryWebServices.getCategoryData(category);
    return allNews["articles"].map((categoryModel)=>CategoryModel.fromJson(categoryModel)).toList();
   }
}