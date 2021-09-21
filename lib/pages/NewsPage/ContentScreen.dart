import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappfinal/pages/NewsPage/CategoriesCubit/categories_cubit.dart';
import 'package:newsappfinal/pages/NewsPage/widgets/ArticleItem.dart';
class ContentScreen extends StatelessWidget {
  const ContentScreen({ Key? key,required this.category }) : super(key: key);
  final String category;
  @override
  Widget build(BuildContext context) {
        List<dynamic> categories=[];
    Widget loaded() {
      return SingleChildScrollView(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context,index)=>
          ArticleItem(categoryModel: categories[index])
        ,itemCount: categories.length,shrinkWrap: true,),
      );
    }
    Widget loadedOrNot(CategoriesState state){
      if(state is CategoriesLoaded){
        categories = state.categories;
        return loaded();
      }
      else {
        return Center(
          child:CircularProgressIndicator() ,
        );
      }
    }
    BlocProvider.of<CategoriesCubit>(context).getCategoryData(category);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(category),
        ),
        body: Container(
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              return loadedOrNot(state);
            },
          ),
      ),
    );
  }
}