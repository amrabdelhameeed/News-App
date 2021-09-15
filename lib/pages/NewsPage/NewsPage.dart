import 'package:flutter/material.dart';
import 'package:newsappfinal/pages/NewsPage/ContentScreen.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({ Key? key }) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<String> categories =[
    "sports",
      "health",
      "science"
  ];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.teal,
        onTap: (value){
          setState(() {
          index = value;
          });
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.sports_soccer_outlined),
            label: "Sports" 
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.science_outlined),
            label: "health" 
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.health_and_safety_outlined),
            label: "Science" 
          ),
        ],
      ),
      body: ContentScreen(category: categories[index],),
    );
  }
}