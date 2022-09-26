import 'dart:html';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImageWidget extends StatefulWidget {
  final String imagePath;
  final Function imageUploader;
  final int width;
  final int height;
  final String
      avatarClass; // the css class has to be different in the embedded html or else the latest width will be taken

  ProfileImageWidget({
    Key? key,
    required this.imagePath,
    required this.imageUploader,
    required this.height,
    required this.width,
    required this.avatarClass,
  }) : super(key: key);

  @override
  ProfileImageWidgetState createState() => ProfileImageWidgetState();
}

class ProfileImageWidgetState extends State<ProfileImageWidget> {
  Widget? _iframeWidget;
  @override
  void initState() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        '${widget.avatarClass}',
        (int viewId) => IFrameElement()
          ..width = '100%'
          ..height = '100%'
          ..srcdoc = """
        <!DOCTYPE html>
        <html>
        <style>
        .${widget.avatarClass} {
  vertical-align: middle;
  width: ${widget.width}px;
  height: ${widget.height}px;
  border-radius: 50%;
}
        </style>
          <body>
          <img src="${widget.imagePath}" alt="Avatar" class="${widget.avatarClass}">
          </body>
          </html>
          """
          ..style.border = 'none');

    _iframeWidget = HtmlElementView(
      key: UniqueKey(),
      viewType: '${widget.avatarClass}',
    );

    super.initState();
    bool isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.width + 20,
        height: widget.height + 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: widget.imagePath.isEmpty
            ? IconButton(
                padding: EdgeInsets.all(1),
                onPressed: () =>
                    widget.imageUploader(widget.avatarClass), //getImage,
                icon: CircleAvatar(
                    backgroundColor: Color(0xFFEFF2F5),
                    radius: (widget.width + 20) / 2,
                    child: Container(
                      width: widget.width + 20,
                      alignment: Alignment.center,
                      child: Text(
                        "Upload Photo",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Open Sans',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            : CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: (widget.width + 20) / 2,
                child: _iframeWidget,
              ) //_iframeWidget,
        );
  }
}
