import 'package:PJSBDigital/models/models.dart';
import 'package:PJSBDigital/params/params.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(PageInitial()) {
    on<ToSplashPage>((event, emit) {
      emit(OnSplashPage());
    });

    on<ToMenuPage>((event, emit) {
      emit(OnMenuPage());
    });

    on<ToLevelPage>((event, emit) {
      emit(OnLevelPage());
    });

    on<ToChapterPage>((event, emit) {
      emit(OnChapterPage(event.level));
    });

    on<ToContentPage>((event, emit) {
      emit(OnContentPage(event.contentParam));
    });

    on<ToPlayerPage>((event, emit) {
      emit(OnPlayerPage(event.contentParam, event.content));
    });
  }
}
