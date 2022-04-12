import 'package:flutter/material.dart';
import 'package:flutter_indoparts_apps/controllers/authC.dart';
import 'package:flutter_indoparts_apps/controllers/loginC.dart';
import 'package:flutter_indoparts_apps/views/Animation/FadeAnimation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  final auth = Get.find<AuthC>();
  final c = Get.find<LoginC>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill)),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 140,
            left: 10,
            width: 200,
            height: 200,
            child: FadeAnimation(
                1,
                Container(
                  child:
                      SvgPicture.asset('assets/svg/undraw_working_re_ddwy.svg'),
                )),
          ),
          Positioned(
            left: 30,
            width: 50,
            height: 150,
            child: FadeAnimation(
                1.3,
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/light-2.png'))),
                )),
          ),
          Positioned(
            top: 40,
            right: 10,
            width: 150,
            height: 120,
            child: FadeAnimation(
                1.5,
                Column(
                  children: [
                    Center(
                      child: Text(
                        DateFormat('hh:mm').format(DateTime.now()),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Center(
                      child: Text(
                        DateFormat('MM/dd/yyyy').format(DateTime.now()),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Center(
                      child: Text(
                        "CSApps",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
