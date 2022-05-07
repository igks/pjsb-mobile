// ignore_for_file: prefer_const_constructors

part of 'pages.dart';

class LevelPage extends StatelessWidget {
  const LevelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var classes = List<int>.generate(13, (i) => i);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.3,
        children: classes
            .map((value) => SizedBox(
                  height: 40,
                  child: GestureDetector(
                    onTap: () {
                      context.read<PageBloc>().add(ToChapterPage(value));
                    },
                    child: Card(
                      shadowColor: mainColor,
                      elevation: 5,
                      child: Center(
                        child: Text(value == 0 ? "PAUD" : value.toString(),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
