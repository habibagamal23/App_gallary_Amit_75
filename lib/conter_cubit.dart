import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class ConterCubit extends Cubit<conterState>{
  ConterCubit(): super(conterState(0));

  void increment(){
    emit(conterState(state.count+1));
  }

  void decrement(){
   emit(conterState(state.count-1));
  }
}