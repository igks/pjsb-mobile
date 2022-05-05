import 'package:PJSBDigital/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:PJSBDigital/bloc/page_bloc.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  void showSplashScreen() async {
    context.read<PageBloc>().add(ToSplashPage());
  }

  @override
  void initState() {
    super.initState();
    showSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, PageState>(builder: (_, state) {
      if (state is OnSplashPage) {
        return const SplashPage();
      } else if (state is OnMenuPage) {
        return const MenuPage();
      } else if (state is OnLevelPage) {
        return const LevelPage();
      } else if (state is OnChapterPage) {
        return ChapterPage(
          level: state.level,
        );
      } else if (state is OnContentPage) {
        return ContentsPage(contentParam: state.contentParam);
      } else if (state is OnPlayerPage) {
        return PlayerPage(
            contentParam: state.contentParam, content: state.content);
      } else {
        return Container();
      }
    });
  }
}
