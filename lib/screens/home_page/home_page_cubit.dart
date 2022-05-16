import 'package:bloc/bloc.dart';
import 'package:newproectap/screens/home_page/home_page_state.dart';

class MenuCubit extends Cubit<FilterState> {
  MenuCubit() : super(FilterInitial());

  int menuIndex = 0;

  changeMenuIndex(index) {
    menuIndex = index;
    emit(ChangeState());
  }
}