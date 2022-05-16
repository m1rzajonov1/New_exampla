import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newproectap/core/extensions/mediaquary_extension.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050352),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: context.h*0.4),
            child: Center(
                child: SizedBox(
              height: context.h*0.2,
              width: context.w*0.5,
              child: SvgPicture.asset("assets/svg/Group 734App.svg"),
            )),
          ),
           Padding(
             padding:  EdgeInsets.only(top: context.w*0.6),
             child: SvgPicture.asset("assets/svg/Group 733title.svg"),
           ),
          
        ],
      ),
    );
  }
}
