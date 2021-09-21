import 'package:flutter/material.dart';
import 'package:newsappfinal/pages/NewsPage/models/category_model.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({ Key? key,required this.categoryModel }) : super(key: key);
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width:double.infinity ,
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: (){

          categoryModel.description!=""?Navigator.pushNamed(context, "/WebViewPage",arguments: categoryModel):
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No description provided",style: TextStyle(fontSize: 18),)))
          ;
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Row(
              children: [
                Expanded(flex: 2, child: Padding(
                padding: EdgeInsets.all(5),
                  child: Text("${categoryModel.title},",style: TextStyle(
                    fontSize: 20
                  ),),
                )),

                Expanded(child: Hero(
                  tag: categoryModel.title.toString(),
                  child: Container(
                    //padding: EdgeInsets.all(5),
                    height: double.infinity,
                    child: categoryModel.urlToImage!.isNotEmpty ? FadeInImage.assetNetwork(placeholder: "assets/images/loading.gif", image: categoryModel.urlToImage!,width: double.infinity,height: double.infinity,fit: BoxFit.cover,):Image.asset("assets/images/placeholder.jpg")
                    ),
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}