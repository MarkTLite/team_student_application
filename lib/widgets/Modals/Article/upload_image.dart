import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/string_consts.dart';

class UploadImageWidget extends StatefulWidget {
  final String imagePath;
  final Function uploader;

  const UploadImageWidget(
      {Key? key, required this.imagePath, required this.uploader})
      : super(key: key);

  @override
  UploadImageWidgetState createState() => UploadImageWidgetState();
}

class UploadImageWidgetState extends State<UploadImageWidget> {
  File? imageFile;
  late bool isLoading;
  String imageUrl = '';

  Widget? _iframeWidget;
  @override
  void initState() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        'artelement',
        (int viewId) => IFrameElement()
          ..width = '100%'
          ..height = '100%'
          ..srcdoc = """
        <!DOCTYPE html>
        <html>
        <style>
        .articleImage {
  vertical-align: middle;
  width: 900px;
  height: 130px;
  border-radius: 2%;
}
        </style>
          <body>
          <img src="${widget.imagePath}" alt="Avatar" class="articleImage">
          </body>
          </html>
          """
          ..style.border = 'none');

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: 'artelement',
    );

    super.initState();
    bool isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFEFF2F5),
      ),
      child: widget.imagePath.isEmpty
          ? Center(
              child: Container(
                  width: 90,
                  child: IconButton(
                    padding: EdgeInsets.all(1),
                    onPressed: () => widget.uploader(),
                    icon: Column(children: [
                      SvgPicture.asset(StringConsts.articleModalImages[0]),
                      const Text("Upload Image")
                    ]),
                  )),
            )
          : _iframeWidget,
    );
  }
}
