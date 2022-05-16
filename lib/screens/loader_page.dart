import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newproectap/core/constants/size_config.dart';

class LoaderPage extends StatelessWidget {
  const LoaderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFF050352),
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: getWidth(293)),
            child: Center(
                child: SizedBox(
              height: getHeight(189),
              width: getWidth(162),
              child: SvgPicture.asset("assets/svg/Group 734App.svg"),
            )),
          ),
           Padding(
             padding:  EdgeInsets.only(top: getWidth(212)),
             child: SvgPicture.asset("assets/svg/Group 733title.svg"),
           ),
          
        ],
      ),
    );
  }
}
