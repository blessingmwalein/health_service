part of 'tollfree_bloc.dart';


abstract class TollFreeBlocState extends Equatable {
  const TollFreeBlocState();

  @override
  List<Object> get props => [];
}

class TollFreeInitial extends TollFreeBlocState {}

class TollFreeLoading extends TollFreeBlocState {}

class TollFreeSuccess extends TollFreeBlocState {
  final List<TollFree> tollFrees;

  const TollFreeSuccess({required this.tollFrees});

  @override
  List<Object> get props => [tollFrees];
}

class TollFreeFailure extends TollFreeBlocState {
  final String message;

  const TollFreeFailure({required this.message});

  @override
  List<Object> get props => [message];
}

