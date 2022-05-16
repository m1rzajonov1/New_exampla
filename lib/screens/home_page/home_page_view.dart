import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newproectap/core/baseview/baseview.dart';
import 'package:newproectap/screens/home_page/home_page_cubit.dart';
import 'package:newproectap/screens/home_page/home_page_state.dart';
import 'package:newproectap/core/extensions/mediaquary_extension.dart';
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  List data = [
    {'svgPath': "assets/svg/Vectorcoder.svg", 'title': "Dasturlash"},
    {'svgPath': "assets/svg/Vectordizayn.svg", 'title': "Dizayn"},
    {'svgPath': "assets/svg/Слой_x0020_1smm.svg", 'title': "SMM"},
    {'svgPath': "assets/svg/Слой_x0020_1til.svg", 'title': "Til kurslari"}
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => MenuCubit()),
      child: BlocBuilder<MenuCubit, FilterState>(
        builder: ((context, state) => BaseView(
            viewModal: HomePage(),
            onPageBuilder: (context, widget) {
              return mkScaffold(context);
            })),
      ),
    );
  }

  Scaffold mkScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.w*0.04),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: context.w*0.14,left: context.w*0.04),
              child: SizedBox(
                height: context.h*0.115,
                width: context.w*0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Qanday darslar sizni qiziqtiradi?",
                      style:
                          textStyle(context.w*0.063, FontWeight.w700, 0xFF0A191E),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: context.w*0.01),
                      child: Text(
                        "28 xil yo`nalishda darsliklar mavjud",
                        style: textStyle(
                            context.w*0.03, FontWeight.w500, 0xFF798184),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: context.w*0.04),
              child: Container(
                height: context.h*0.05,
                width: context.w*0.9,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F2F6),
                  borderRadius: BorderRadius.circular(context.w*0.02),
                ),
                child: TextFormField(
                    decoration: InputDecoration(
                  hoverColor: const Color(0xFFF1F2F6),
                  hintText: 'Izlash',
                  suffixIcon: const Icon(Icons.search_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: context.w*0.04, left: context.w*0.02),
              child: SizedBox(
                height: context.h*0.12,
                width: context.w,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: context.w*0.016),
                        child: InkWell(
                          child: dasturFilterColums(data[index]['svgPath'],
                              data[index]['title'], context, index),
                          onTap: () {
                            context.read<MenuCubit>().changeMenuIndex(index);
                          },
                        ),
                      )),
                  itemCount: data.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column dasturFilterColums(
      String svgPath, String title, BuildContext context, int index) {
    return Column(
      children: [
        Container(
          height: context.h*0.095,
          width: context.w*0.19,
          decoration: BoxDecoration(
              color: context.watch<MenuCubit>().menuIndex == index
                  ? const Color(0xFF31B9CC)
                  : const Color(0xFFF1F2F6),
              borderRadius: BorderRadius.circular(context.w*0.04)),
          child: Center(
              child: SvgPicture.asset(
            svgPath,
            color: context.watch<MenuCubit>().menuIndex == index
                ? const Color(0xFFF1F2F6)
                : const Color(0xFF010002),
          )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.w*0.005),
          child: Text(
            title,
            style: textStyle(context.w*0.03, FontWeight.w500, 0xFF0A191E),
          ),
        )
      ],
    );
  }

  TextStyle textStyle(double size, FontWeight fntW, int color) {
    return TextStyle(
        color: Color(color),
        fontStyle: FontStyle.normal,
        fontFamily: 'Google Sans',
        fontWeight: fntW,
        fontSize: size);
  }
}
