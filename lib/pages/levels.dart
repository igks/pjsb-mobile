// ignore_for_file: prefer_const_constructors

part of 'pages.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var classes = List<int>.generate(13, (i) => i);

    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(ToMenuPage());
        return Future.value(false);
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: "Daftar Kelas"),
        body: GridView.count(
          crossAxisCount: 3,
          children: classes
              .map((value) => GestureDetector(
                    onTap: () {
                      context.read<PageBloc>().add(ToChapterPage(value));
                    },
                    child: Card(
                      shadowColor: mainColor,
                      elevation: 5,
                      child: Center(
                        child: Text(value == 0 ? "PAUD" : value.toString(),
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
