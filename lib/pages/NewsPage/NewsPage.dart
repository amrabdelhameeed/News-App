import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappfinal/pages/NewsPage/ContentScreen.dart';
import 'package:newsappfinal/pages/NewsPage/NavBarCubit/navbar_cubit.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({ Key? key }) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>NavbarCubit(),
      child: BlocConsumer<NavbarCubit, NavbarState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          NavbarCubit navbarcubit = NavbarCubit.get(context);
          return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.teal,
          onTap: (value){
            navbarcubit.changeIndex(value);
          },
          currentIndex: navbarcubit.index,
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
        body: ContentScreen(category:navbarcubit.categories[navbarcubit.index],),
      );
        },
      ),
    );
  }
}