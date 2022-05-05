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

class ToLevelPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class ToChapterPage extends PageEvent {
  final int level;
  const ToChapterPage(this.level);
  @override
  List<Object> get props => [level];
}

class ToContentPage extends PageEvent {
  final ContentParam contentParam;
  const ToContentPage(this.contentParam);

  @override
  List<Object> get props => [contentParam];
}

class ToPlayerPage extends PageEvent {
  final ContentParam contentParam;
  final Content content;
  const ToPlayerPage(this.contentParam, this.content);

  @override
  List<Object> get props => [contentParam, content];
}
