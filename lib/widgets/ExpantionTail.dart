import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpantionDetailTail extends StatefulWidget {
  final String titletext, discription;
  const ExpantionDetailTail(
      {super.key, required this.titletext, required this.discription});

  @override
  State<ExpantionDetailTail> createState() => _ExpantionDetailTailState();
}

class _ExpantionDetailTailState extends State<ExpantionDetailTail> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      trailing: isExpanded ? Icon(Icons.remove) : Icon(Icons.add),
      title: Text(widget.titletext),
      onExpansionChanged: (bool expanding) {
        // Update the state when the expansion changes
        setState(() {
          isExpanded = expanding;
        });
      },
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.5.w, vertical: 12.h),
          child: Text(
            widget.discription,
            style: TextStyle(
              color: Colors.black87,
              fontFamily: 'montserrat',
              wordSpacing: 6,
              height: 1.3,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
