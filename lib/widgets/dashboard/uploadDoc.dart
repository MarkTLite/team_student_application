import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocWidget extends StatefulWidget {
  final String docPath;
  final Function docUploader;
  final double width;
  final double height;
  final String filename;
  final String doctype;

  const UploadDocWidget({
    Key? key,
    required this.docPath,
    required this.docUploader,
    required this.height,
    required this.width,
    required this.filename,
    required this.doctype,
  }) : super(key: key);

  @override
  UploadDocWidgetState createState() => UploadDocWidgetState();
}

class UploadDocWidgetState extends State<UploadDocWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: Colors.,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(15)),
      width: widget.width,
      height: widget.height,
      child: widget.docPath.isEmpty
          ? IconButton(
              padding: EdgeInsets.all(1),
              onPressed: () => widget.docUploader(widget.doctype), //getImage,
              icon: Container(
                width: widget.width,
                height: widget.height,
                alignment: Alignment.center,
                child: Text(
                  "Upload Document",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Open Sans',
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ))
          : Center(
              child: Container(
                  color: Colors.transparent,
                  width: widget.width,
                  height: widget.height,
                  child: Text(widget.filename)),
            ),
    );
  }
}
