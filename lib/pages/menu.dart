part of 'pages.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Menu"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<PageBloc>().add(ToLevelPage());
                },
                child: SizedBox(
                  height: 150,
                  child: Card(
                    shadowColor: mainColor,
                    elevation: 5,
                    child: const Center(
                      child: Text("Belajar",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: SizedBox(
                  height: 150,
                  child: Card(
                    shadowColor: mainColor,
                    elevation: 5,
                    child: const Center(
                      child: Text("Latihan",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
