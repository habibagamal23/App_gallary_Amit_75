import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void getData() async {
    // sumlite network
    emit(HomeLoading());

    try {
      await Future.delayed(Duration(seconds: 3));
      List<String> list = [];
      if (list.isEmpty) {
        throw Exception("No data found");
      }
      emit(HomeSuccess(list));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
