// ignore_for_file: prefer_const_constructors

part of 'pages.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var classes = List<int>.generate(13, (i) => i);

    return Scaffold(
      appBar: CustomAppBar(
          title: Text(
        "Pilih Kelas",
        style: fontSecondary.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      )),
      body: GridView.count(
        crossAxisCount: 3,
        children: classes
            .map((value) => GestureDetector(
                  onTap: () {
                    print(value);
                  },
                  child: Card(
                    child: Center(
                      child: Text(value == 0 ? "PAUD" : value.toString(),
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
