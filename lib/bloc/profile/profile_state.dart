part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

final class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}


final class ProfileLoaded extends ProfileState {

  @override
  List<Object> get props => [];
}


final class ProfileError extends ProfileState {
  final String error;

  const ProfileError(this.error);

  @override
  List<Object?> get props => [error];
}
