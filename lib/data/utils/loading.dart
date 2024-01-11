import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

showLoading(context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      );
    },
  );
}
hideLoading(context) {
  Navigator.of(context).pop();
}