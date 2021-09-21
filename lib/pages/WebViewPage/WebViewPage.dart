import 'package:flutter/material.dart';
import 'package:newsappfinal/pages/NewsPage/models/category_model.dart';
class WebViewPage extends StatelessWidget {
  const WebViewPage({ Key? key ,required this.categoryModel}) : super(key: key);
final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            categoryModel.urlToImage!.isNotEmpty ? SliverAppBar(
              expandedHeight: 600,
              centerTitle: true,
              pinned: true,
              stretch: true,
              backgroundColor: Colors.teal,
              flexibleSpace:  FlexibleSpaceBar(
                background: Hero(
                tag: categoryModel.title.toString(),
                child: categoryModel.urlToImage!.isNotEmpty ? FadeInImage.assetNetwork(placeholder: "assets/images/loading.gif", image: categoryModel.urlToImage!,width: double.infinity,height: double.infinity,fit: BoxFit.cover,):Image.asset("assets/images/placeholder.jpg",width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
                ),
                centerTitle: true,
              title: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("${categoryModel.title}",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),
              
              ),
            ):SliverAppBar(
              elevation: 0.0,
              pinned: true,
               title: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("${categoryModel.title}",maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),
            ),
            SliverList(delegate: SliverChildListDelegate(
              [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(right:30,left: 30,top: 20),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(categoryModel.description!,style: TextStyle(
                        color: Colors.black,fontSize: 30
                      ),
                      
                      ),
                    ),
                  ),
                ),
              ]          
            ),),
          ],
        ),
      ),
    );
  }
}
/*Column(
            children: [ 
              Container(
                width: double.infinity,
                height: 500,
                child: Hero(
                tag: categoryModel.urlToImage.toString(),
                child: categoryModel.urlToImage!.isNotEmpty ? FadeInImage.assetNetwork(placeholder: "assets/images/loading.gif", image: categoryModel.urlToImage!,width: double.infinity,height: double.infinity,fit: BoxFit.cover,):Image.asset("assets/images/placeholder.jpg"),
                ),
              ),
                   Container(
                width: double.infinity,
                height: 150,
                child:Hero(
                  tag: categoryModel.title.toString(),
                  child: Padding(
                  padding: EdgeInsets.all(5),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text("${categoryModel.title},",style: TextStyle(
                        fontSize: 35
                      ),),
                    ),
                  ),
                )
              ),
                          
            ],
          )*/