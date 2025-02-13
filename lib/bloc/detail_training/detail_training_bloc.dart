import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detail_training_event.dart';
part 'detail_training_state.dart';

class DetailTrainingBloc extends Bloc<DetailTrainingEvent, DetailTrainingState> {
  DetailTrainingBloc() : super(DetailTrainingInitial()) {
    on<DetailTrainingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
