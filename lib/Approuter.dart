
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappfinal/pages/NewsPage/CategoriesCubit/categories_cubit.dart';
import 'package:newsappfinal/pages/NewsPage/NewsPage.dart';
import 'package:newsappfinal/pages/NewsPage/Repository/CategoryRepository.dart';
import 'package:newsappfinal/pages/NewsPage/models/category_model.dart';
import 'package:newsappfinal/pages/NewsPage/webServices/CategoryWebServices.dart';
import 'package:newsappfinal/pages/WebViewPage/WebViewPage.dart';

class AppRouter {
  late CategoriesCubit categoriesCubit;
  late CategoryRepository categoryRepository;
  AppRouter(){
    categoryRepository = CategoryRepository(CategoryWebServices());
    categoriesCubit = CategoriesCubit(categoryRepository);
  }
  Route ? generateRoute (RouteSettings settings){
    switch (settings.name) {
      case "/":return MaterialPageRoute(builder:(_)=>BlocProvider(
        child: NewsPage(),
        create: (context)=>categoriesCubit));
      case "/WebViewPage":
        return MaterialPageRoute(builder: (_){
          final article = settings.arguments as CategoryModel;
          return WebViewPage(url: article.url!,);
          }
        );    }
  }
}