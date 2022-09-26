import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String selectedValue, title;
  final List<DropdownMenuItem<String>> dropDownItems;
  final Function changeVal;
  final double width;
  final int scenario;

  const DropDownWidget(
      {Key? key,
      required this.title,
      required this.selectedValue,
      required this.dropDownItems,
      required this.changeVal,
      required this.width,
      required this.scenario})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: 38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300,
              fontSize: 15,
            ),
          ),
          Container(
            width: width * 0.6,
            height: 38,
            child: DropdownButtonFormField(
                // validator: (value) {
                //   if ()
                // },
                icon: Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: theme.primaryColor,
                ),
                iconSize: 24,
                iconDisabledColor: theme.primaryColor,
                iconEnabledColor: theme.primaryColor,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Roboto',
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                ),
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.only(right: 30, top: 5, bottom: 5, left: 8),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    // borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 1),
                    // borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                dropdownColor: Colors.white,
                value: selectedValue,
                onChanged: (String? newValue) {
                  changeVal(newValue, scenario);
                },
                items: dropDownItems),
          )
        ],
      ),
    );
  }
}
