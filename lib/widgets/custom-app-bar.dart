part of 'widgets.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar(
      {Key? key, required this.title, this.actions, this.leading})
      : preferredSize = const Size.fromHeight(80.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: fontSecondary.copyWith(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      ),
      leading: widget.leading,
      actions: widget.actions ?? [],
      centerTitle: true,
      backgroundColor: mainColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
    );
  }
}
