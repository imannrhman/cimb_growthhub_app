part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfileData extends ProfileEvent {

  @override
  List<Object?> get props => [];

}