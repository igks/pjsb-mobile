part of 'pages.dart';

class ChapterPage extends StatefulWidget {
  final int level;
  const ChapterPage({Key? key, required this.level}) : super(key: key);

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  bool isLoading = true;
  List<Chapter> chapters = [];

  void getChapter() async {
    try {
      var res = await API.get("${svApiDomain}contents/level/${widget.level}");
      List<Chapter> resChapter = [];
      res.data["data"]["data"].forEach((chapter) {
        resChapter.add(Chapter.fromJson(chapter));
      });
      setState(() {
        chapters = resChapter;
        isLoading = false;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getChapter();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          context.read<PageBloc>().add(ToMenuPage());
          return Future.value(false);
        },
        child: Scaffold(
            appBar: CustomAppBar(
              title:
                  "Materi ${widget.level == 0 ? "PAUD" : "Kelas ${widget.level}"}",
            ),
            body: isLoading
                ? const Center(child: Spinner())
                : chapters.isNotEmpty
                    ? SingleChildScrollView(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: chapters
                              .map((chapter) => GestureDetector(
                                    onTap: () {
                                      context.read<PageBloc>().add(
                                          ToContentPage(ContentParam(
                                              title: chapter.title,
                                              chapterId: chapter.id,
                                              levelId: widget.level)));
                                    },
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                          shadowColor: mainColor,
                                          elevation: 3,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(chapter.title),
                                          )),
                                    ),
                                  ))
                              .toList(),
                        ))
                    : const Center(
                        child: Text("Tidak Ada Materi!"),
                      )));
  }
}
