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
  final ContentParam contentParam;
  const OnContentPage(this.contentParam);

  @override
  List<Object> get props => [contentParam];
}

class OnPlayerPage extends PageState {
  final ContentParam contentParam;
  final Content content;
  const OnPlayerPage(this.contentParam, this.content);

  @override
  List<Object> get props => [contentParam, content];
}
