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
  final String title;
  final int chapterId;
  final int levelId;
  const ToContentPage(this.title, this.chapterId, this.levelId);

  @override
  List<Object> get props => [title, chapterId, levelId];
}
