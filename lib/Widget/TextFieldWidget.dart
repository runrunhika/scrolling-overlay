import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({Key? key}) : super(key: key);

  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final focusNode = FocusNode();
  final layerLink = LayerLink();
  late TextEditingController controller;
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();

    WidgetsBinding.instance!.addPostFrameCallback((_) => showOverlay());

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
      } else {
        hideOverlay();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    // final offset = renderBox.localToGlobal(Offset.zero);

    entry = OverlayEntry(
        builder: (context) => Positioned(
              // left: offset.dx,
              // top: offset.dy + size.height + 8,
              width: size.width,
              child: CompositedTransformFollower(
                  link: layerLink,
                  showWhenUnlinked: false,
                  offset: Offset(0, size.height + 8),
                  child: buildOverlay()),
            ));
    overlay.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        decoration: InputDecoration(
            label: Text("Username"),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }

  Widget buildOverlay() => Material(
        elevation: 8,
        child: Column(
          children: [
            ListTile(
              leading: Image.network(
                "https://i1.wp.com/soramimiescargot.com/wp-content/uploads/2020/12/dtI7XPN.jpg?resize=900%2C900&ssl=1",
                fit: BoxFit.cover,
              ),
              title: Text('森田ひかる'),
              subtitle: Text("桜坂"),
              onTap: () {
                controller.text = "森田ひかる";
                hideOverlay();
                focusNode.unfocus();
              },
            ),
            ListTile(
              leading: Image.network(
                "https://keyakizaka46.antena-kun.com/wp-content/uploads/2020/06/538bf70d-s.png",
                fit: BoxFit.cover,
              ),
              title: Text('守屋麗奈'),
              subtitle: Text("桜坂"),
              onTap: () {
                controller.text = "守屋麗奈";
                hideOverlay();
                focusNode.unfocus();
              },
            ),
            ListTile(
              leading: Image.network(
                "https://contents.oricon.co.jp/upimg/news/20200919/2171959_202009190072477001600460106c.jpg",
                fit: BoxFit.cover,
              ),
              title: Text('渡辺理沙'),
              subtitle: Text("桜坂"),
              onTap: () {
                controller.text = "渡辺理沙";
                hideOverlay();
                focusNode.unfocus();
              },
            ),
          ],
        ),
      );
}
