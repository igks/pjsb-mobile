part of 'page_bloc.dart';

@immutable
abstract class PageEvent extends Equatable {
  const PageEvent();

  @override
  List<Object> get props => [];
}

class ToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class ToMenuPage extends PageEvent {
  @override
  List<Object> get props => [];
}
