import 'package:flutter/material.dart';
import 'package:newsappfinal/pages/NewsPage/models/category_model.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({ Key? key,required this.categoryModel }) : super(key: key);
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity ,
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, "/WebViewPage",arguments: categoryModel);
        },
        child: ListTile(
          title: Text("${categoryModel.title}"),
          trailing:categoryModel.urlToImage==""?Text(""): Image.network("${categoryModel.urlToImage}",fit:BoxFit.cover,)
        ),
      ),
    );
  }
}