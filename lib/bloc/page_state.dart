part of 'page_bloc.dart';

@immutable
abstract class PageState extends Equatable {
  const PageState();

  @override
  List<Object> get props => [];
}

class PageInitial extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMenuPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLevelPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnChapterPage extends PageState {
  final int level;
  const OnChapterPage(this.level);
  @override
  List<Object> get props => [level];
}

class OnContentPage extends PageState {
  final String title;
  final int chapterId;
  final int levelId;
  const OnContentPage(this.title, this.chapterId, this.levelId);

  @override
  List<Object> get props => [title, chapterId, levelId];
}
