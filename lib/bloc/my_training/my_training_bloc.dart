import 'package:bloc/bloc.dart';
import 'package:cimb_growthhub_app/bloc/training/training_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'my_training_event.dart';
part 'my_training_state.dart';

class MyTrainingBloc extends Bloc<MyTrainingEvent, MyTrainingState> {
  MyTrainingBloc() : super(MyTrainingInitial()) {
    on<MyTrainingEvent>((event, emit) {
      
    });

    on<GetMyTrainingData>(_getMyTraining);
  }


  Future<void> _getMyTraining(GetMyTrainingData event, Emitter<MyTrainingState> emit) async {
    emit(MyTrainingLoading());
    try {
      
      emit(MyTrainingLoaded());
      
    } catch (e) {
      emit(MyTrainingError(error: e.toString()));
    }

  }


 
}
