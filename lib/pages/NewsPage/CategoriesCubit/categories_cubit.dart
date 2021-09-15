import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsappfinal/pages/NewsPage/Repository/CategoryRepository.dart';
part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryRepository categoryRepository;
  CategoriesCubit(this.categoryRepository) : super(CategoriesInitial());
  List <dynamic> categories=[];
  
  List<dynamic> getCategoryData(String category)  {
    categoryRepository.getCategoryData(category).then((categories) {
      this.categories = categories;
      emit(CategoriesLoaded(categories));
    });
    return categories;
  }
}
