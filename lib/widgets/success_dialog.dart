import 'package:flutter/material.dart';

class SuccessDialog extends StatelessWidget {
  final String title, descriptions, text, img;

  const SuccessDialog({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.text,
    required this.img,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0.0,
        backgroundColor: Color(0x00000000),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  left: 20, top: 45 + 20, right: 20, bottom: 20),
              margin: EdgeInsets.only(top: 45),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    descriptions,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(theme.primaryColor),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(8)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              //side: BorderSide(color: Colors.red)
                            ))),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Navigator.of(context).pop();
                        },
                        child: Text(
                          text,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              child: CircleAvatar(
                backgroundColor: Color(0x01FFFFFF),
                radius: 50,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    child: Image.asset(img)),
              ),
            ),
          ],
        ));
  }
}
