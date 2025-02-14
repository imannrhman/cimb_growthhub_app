import 'package:bloc/bloc.dart';
import 'package:cimb_growthhub_app/bloc/training/training_bloc.dart';
import 'package:cimb_growthhub_app/model/response/enroll.dart';
import 'package:cimb_growthhub_app/repository/training_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'my_training_event.dart';
part 'my_training_state.dart';

class MyTrainingBloc extends Bloc<MyTrainingEvent, MyTrainingState> {
  final TrainingRepository trainingRepository;

  MyTrainingBloc(this.trainingRepository) : super(MyTrainingInitial()) {
    on<MyTrainingEvent>((event, emit) {
      
    });

    on<GetMyTrainingData>(_getMyTraining);
  }


  Future<void> _getMyTraining(GetMyTrainingData event, Emitter<MyTrainingState> emit) async {
    emit(MyTrainingLoading());
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");

      if (token != null) {
        List<Enrollment> enrollments = await trainingRepository.getEnrolledTraining(token);
        emit(MyTrainingLoaded(enrollments));
      } else {
        emit(MyTrainingError(error: "Anda Perlu Melakukan Login"));
      }
    } catch (e) {
      emit(MyTrainingError(error: e.toString()));
    }
  }


 
}
