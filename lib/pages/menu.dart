part of 'pages.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  int currentIndex = 0;

  void onItemTap(int index) {
    print(index);
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> items = [
    const LevelPage(),
    Center(
      child: Text("Halaman masih dalam pengembangan"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: currentIndex == 0 ? "Mulai Belajar" : "Mulai Latihan"),
      body: items[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: mainColor,
        currentIndex: currentIndex,
        onTap: onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: "Belajar",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.model_training), label: "Latihan")
        ],
      ),
    );
  }
}
