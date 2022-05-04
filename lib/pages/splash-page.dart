part of 'pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void goToMenu() async {
    await Future.delayed(Duration(milliseconds: svSplashTime), () {});
    // context.read<PageBloc>().add(ToMenuPage());
  }

  @override
  void initState() {
    super.initState();
    goToMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: AssetImage("assets/images/pjsb.png"))),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Pasraman Jnana Sila Bhakti",
                style: fontPacifico.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: fontAccent1),
              )
            ],
          ),
        ),
      ),
    );
  }
}
