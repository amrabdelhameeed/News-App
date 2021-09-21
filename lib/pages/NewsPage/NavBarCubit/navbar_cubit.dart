import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'navbar_state.dart';

class NavbarCubit extends Cubit<NavbarState> {
  NavbarCubit() : super(NavbarInitial());
  static NavbarCubit get (context)=>BlocProvider.of(context);
   List<String> categories =[
      "sports",
      "health",
      "science"
  ];
  int index=0;
  void changeIndex (int i){
    index = i;
    emit(NavbarChangeIndex());
  }
}
