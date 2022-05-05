part of 'pages.dart';

/// Creates list of video players
class PlayerPage extends StatefulWidget {
  final ContentParam contentParam;
  final Content content;
  const PlayerPage(
      {Key? key, required this.contentParam, required this.content})
      : super(key: key);

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  late YoutubePlayerController _controllers;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controllers = YoutubePlayerController(
        initialVideoId: widget.content.videoUrl.split("v=")[1].substring(0, 11),
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    Future.delayed(const Duration(milliseconds: 1000), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        context.read<PageBloc>().add(ToContentPage(widget.contentParam));
        return Future.value(false);
      },
      child: Scaffold(
        appBar: CustomAppBar(title: widget.content.title),
        body: isLoading
            ? const Center(child: Spinner())
            : Center(
                child: YoutubePlayer(
                  controller: _controllers,
                  actionsPadding: const EdgeInsets.only(left: 16.0),
                  bottomActions: [
                    CurrentPosition(),
                    const SizedBox(width: 10.0),
                    ProgressBar(isExpanded: true),
                    const SizedBox(width: 10.0),
                    RemainingDuration(),
                    FullScreenButton(),
                  ],
                ),
              ),
      ),
    );
  }
}
