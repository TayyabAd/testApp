import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAlerts {
  static showLoadingProgressIndicator(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => const Center(
                child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.black,
            )));
  }

  static void showSnackBar(
      {required BuildContext context, required String content}) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: Padding(
          padding: EdgeInsets.only(
            // top: height * 0.6,
            left: width * 0.1,
            right: width * 0.1,
            bottom: 0,
          ),
          child: Material(
            // color: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 2,
            child: Container(
              // alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: width * 0.02),
              // ignore: sort_child_properties_last
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      // right: 10,
                    ),
                    child: SizedBox(
                      // width: width * 0.5,
                      child: Text(
                        content,
                        style: TextStyle(
                          // fontFamily: semiBold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Color(0xFF319C80),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        )));
  }

  static pop(BuildContext context) {
    Navigator.pop(context);
  }
}
