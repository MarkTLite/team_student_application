import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:universal_html/js.dart' as js;
import 'package:universal_html/html.dart' as html;

class RichTextEditorWidget extends StatefulWidget {
  final Function extractor;
  RichTextEditorWidget({Key? key, required this.extractor}) : super(key: key);

  @override
  State<RichTextEditorWidget> createState() => _RichTextEditorWidgetState();
}

class _RichTextEditorWidgetState extends State<RichTextEditorWidget> {
  late html.IFrameElement element;
  String editorId = Random().nextInt(100).toString();
  late js.JsObject connector;

  @override
  void initState() {
    js.context["connect_content_to_flutter"] = (js.JsObject content) {
      connector = content;
    };
    element = html.IFrameElement()
      //..src = '/assets/html/editor.html'
      ..style.border = 'none'
      ..srcdoc = """ <!DOCTYPE html>
<html>
<title>Sample</title>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, maximum-scale=1.0" />
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <!-- Theme included stylesheets -->
    <link href="http://cdn.quilljs.com/1.2.0/quill.snow.css" rel="stylesheet">
    <link href="http://cdn.quilljs.com/1.2.0/quill.bubble.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdn.quilljs.com/0.20.1/quill.snow.css" />
</head>

<body>

    <form method="post" style="height:calc(100vh - 20vh)">
        <div id="editor"></div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script src="https://cdn.rawgit.com/kensnyder/quill-image-resize-module/3411c9a7/image-resize.min.js"></script>
    <style>
        span.fr-emoticon {
            background-repeat: no-repeat !important;
            font-size: 28px;
        }
    </style>
    <script>
        var quill = null;
        \$(document).ready(function () {
            var toolbarOptions = [
                ['bold', 'italic', 'underline', 'strike'],        // toggled buttons
                ['blockquote', 'code-block'],
                [{ 'list': 'ordered' }, { 'list': 'bullet' }],
                [{ 'script': 'sub' }, { 'script': 'super' }],      // superscript/subscript
                [{ 'indent': '-1' }, { 'indent': '+1' }],          // outdent/indent
                [{ 'direction': 'rtl' }],                         // text direction

                [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
                [{ 'header': [1, 2, 3, 4, 5, 6, false] }],
                ['link', 'image', 'video'],
                [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
                [{ 'font': [] }],
                [{ 'align': [] }],
                ['clean']                                         // remove formatting button
            ];

            quill = new Quill('#editor', {
                modules: {
                    imageResize: {
                        displaySize: true
                    },
                    toolbar: toolbarOptions
                },
                theme: 'snow',
            });
        });
        parent.connect_content_to_flutter && parent.connect_content_to_flutter(window)
        function getValue() {
            var justHtml = quill.container.firstChild.innerHTML;
            return justHtml;
        }
        window.addEventListener("message", (message) => {
            if (message.data.id === "value") {
                quill.root.innerHTML = message.data.msg;
            }
        })
    </script>
</body>

</html>""";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry
        .registerViewFactory(editorId, (int viewId) => element);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 160, child: HtmlElementView(viewType: editorId)),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(vertical: 10, horizontal: 30))),
            onPressed: () {
              final String str = connector.callMethod(
                'getValue',
              ) as String;
              widget.extractor(str);
            },
            child: Text("Save",
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 15,
                )))
      ],
    );
  }

  String getMessageFromEditor() {
    final String str = connector.callMethod(
      'getValue',
    ) as String;
    return str;
  }
}
