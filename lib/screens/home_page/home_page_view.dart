import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newproectap/core/baseview/baseview.dart';
import 'package:newproectap/core/constants/size_config.dart';
import 'package:newproectap/screens/home_page/home_page_cubit.dart';
import 'package:newproectap/screens/home_page/home_page_state.dart';

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
    SizeConfig().init(context);
    return BlocProvider(
      create: ((context) => MenuCubit()),
      child: BlocBuilder<MenuCubit, FilterState>(
        builder: ((context, state) => BaseView(
            viewModal: HomePage(),
            onPageBuilder: (context, widget) {
              return mkScaffold();
            })),
      ),
    );
  }

  Scaffold mkScaffold() {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: getWidth(44)),
              child: SizedBox(
                height: getHeight(86),
                width: getWidth(244),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Qanday darslar sizni qiziqtiradi?",
                      style:
                          textStyle(getWidth(24), FontWeight.w700, 0xFF0A191E),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: getWidth(4)),
                      child: Text(
                        "28 xil yo`nalishda darsliklar mavjud",
                        style: textStyle(
                            getWidth(11), FontWeight.w500, 0xFF798184),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: getWidth(21)),
              child: Container(
                height: getHeight(41),
                width: getWidth(343),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F2F6),
                  borderRadius: BorderRadius.circular(getWidth(10)),
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
              padding: EdgeInsets.only(top: getWidth(20), left: getWidth(8)),
              child: SizedBox(
                height: getHeight(101),
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(5)),
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
          height: getHeight(72),
          width: getWidth(71),
          decoration: BoxDecoration(
              color: context.watch<MenuCubit>().menuIndex == index
                  ? const Color(0xFF31B9CC)
                  : const Color(0xFFF1F2F6),
              borderRadius: BorderRadius.circular(getWidth(16))),
          child: Center(
              child: SvgPicture.asset(
            svgPath,
            color: context.watch<MenuCubit>().menuIndex == index
                ? const Color(0xFFF1F2F6)
                : const Color(0xFF010002),
          )),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: getWidth(2)),
          child: Text(
            title,
            style: textStyle(getWidth(11), FontWeight.w500, 0xFF0A191E),
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
