import 'package:equatable/equatable.dart';

abstract class FavoriteStates extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavInitialState extends FavoriteStates {}

class FavLoadingState extends FavoriteStates {}

class FavSuccessState extends FavoriteStates {
  final String msg;
  FavSuccessState({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class FavRemovedState extends FavoriteStates {
  final String msg;
  FavRemovedState({required this.msg});

  @override
  List<Object?> get props => [msg];
}

class FavErrorState extends FavoriteStates {
  final String errorMSG;
  FavErrorState({required this.errorMSG});

  @override
  List<Object?> get props => [errorMSG];
}
