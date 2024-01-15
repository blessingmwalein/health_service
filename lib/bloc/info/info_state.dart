

part of 'info_bloc.dart';

abstract class InfoBlocState extends Equatable {
  const InfoBlocState();

  @override
  List<Object> get props => [];
}

class InfoInitial extends InfoBlocState {}

class InfoLoading extends InfoBlocState {}

class InfoSuccess extends InfoBlocState {
  final List<Info> infos;

  const InfoSuccess({required this.infos});

  @override
  List<Object> get props => [infos];
}

class InfoFailure extends InfoBlocState {
  final String message;

  const InfoFailure({required this.message});

  @override
  List<Object> get props => [message];
}

