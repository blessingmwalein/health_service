part of 'info_bloc.dart';

abstract class InfoBlocEvent extends Equatable {
  const InfoBlocEvent();
  @override
  List<Object> get props => [];
}

class LoadSheetsFetch extends InfoBlocEvent {}

//get by status
class GetInfos extends InfoBlocEvent {
  const GetInfos();

  @override
  List<Object> get props => [];
}
