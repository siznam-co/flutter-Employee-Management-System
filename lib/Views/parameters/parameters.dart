import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/*
class SetParametersScr extends StatelessWidget {
  static const String routeName = "/SetParametersView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: const Icon(Icons.check),
          )
        ],
      ),
    );
  }
}
*/

class SetParametersScr extends StatefulWidget {
  static const String routeName = "/SetParametersView";
  const SetParametersScr({Key key}) : super(key: key);

  @override
  State<SetParametersScr> createState() => _SetParametersScrState();
}

class _SetParametersScrState extends State<SetParametersScr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: const Icon(Icons.check),
          )
        ],
      ),
    );
  }
}
