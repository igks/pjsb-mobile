part of 'pages.dart';

class ContentsPage extends StatefulWidget {
  final String title;
  final int chapterId;
  final int levelId;
  const ContentsPage(
      {Key? key,
      required this.title,
      required this.chapterId,
      required this.levelId})
      : super(key: key);

  @override
  State<ContentsPage> createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage> {
  bool isLoading = true;
  List<Content> contents = [];

  void getContents() async {
    try {
      var res =
          await API.get("${svApiDomain}content/details/${widget.chapterId}");
      List<Content> resContent = [];
      res.data["data"]["data"].forEach((content) {
        resContent.add(Content.fromJson(content));
      });
      setState(() {
        contents = resContent;
        isLoading = false;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    super.initState();
    getContents();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(ToChapterPage(widget.levelId));
        return Future.value(false);
      },
      child: Scaffold(
          appBar: CustomAppBar(title: "Materi ${widget.title}"),
          body: isLoading
              ? const Center(child: Spinner())
              : contents.isNotEmpty
                  ? GridView.count(
                      crossAxisCount: 2,
                      children: contents
                          .map((content) => GestureDetector(
                                onTap: () {},
                                child: Card(
                                  shadowColor: mainColor,
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 120,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "$svAssetDomain${content.thumbnail}"))),
                                      ),
                                      Text(content.title)
                                    ],
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  : const Center(
                      child: Text("Tidak Ada Materi!"),
                    )),
    );
  }
}
