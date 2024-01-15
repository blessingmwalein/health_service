part of 'tollfree_bloc.dart';

abstract class TollFreeBlocEvent extends Equatable {
  const TollFreeBlocEvent();
  @override
  List<Object> get props => [];
}

class LoadSheetsFetch extends TollFreeBlocEvent {}

//get by status
class GetTollFrees extends TollFreeBlocEvent {


  const GetTollFrees();

  @override
  List<Object> get props => [];
}
