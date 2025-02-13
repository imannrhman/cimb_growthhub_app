import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) {
      if (event is GetProfileData) {
          emit(ProfileLoading());

          try {
            emit(ProfileLoaded());
          } catch (ex) {
            emit(ProfileError("error"));
          }
      }
    });
  }
}
