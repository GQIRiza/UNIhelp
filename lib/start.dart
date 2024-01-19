import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            types(),
          ],
        ),
      ),
    );
  }
  
  Widget types() {
    return Center(
      child: Column(
        children: [
          Container(
            // 3dF (72:66)
            padding:  const EdgeInsets.fromLTRB(55.5, 239, 42.5, 246),
            width:  double.infinity,
            decoration:  const BoxDecoration (
              color:  Color(0xffd0d0ff),
            ),
            child:
            Column(
              crossAxisAlignment:  CrossAxisAlignment.center,
              children:  [
                Container(
                  // hSu (72:86)
                  margin:  const EdgeInsets.fromLTRB(0, 0, 0, 14),
                  constraints:  const BoxConstraints (
                    maxWidth:  262,
                  ),
                  child:
                  const Text(
                    'Добро пожаловать\nв',
                    textAlign:  TextAlign.center,
                    style:  TextStyle (
                      fontFamily: 'Inter',
                      fontSize:  28,
                      fontWeight:  FontWeight.w500,
                      height:  1.2125,
                      color:  Color(0xffffffff),
                    ),
                  ),
                ),
                Container(
                  // unihelpZk1 (72:87)
                  margin:  const EdgeInsets.fromLTRB(0, 0, 1, 62),
                  child:
                  RichText(
                    textAlign:  TextAlign.center,
                    text:
                    const TextSpan(
                      style:  TextStyle (
                        fontFamily: 'Rubik Bubbles',
                        fontSize:  54,
                        fontWeight:  FontWeight.w400,
                        height:  1.1849999604,
                        color:  Color(0xff8282da),
                      ),
                      children:  [
                        TextSpan(
                          text:  'U',
                          style:  TextStyle (
                            fontFamily: 'Rubik Bubbles',
                            fontSize:  54,
                            fontWeight:  FontWeight.w400,
                            height:  1.185,
                            color:  Color(0xff8282da),
                          ),
                        ),
                        TextSpan(
                          text:  'N',
                          style:  TextStyle (
                            fontFamily: 'Rubik Bubbles',
                            fontSize:  54,
                            fontWeight:  FontWeight.w400,
                            height:  1.185,
                            color:  Color(0xffacacf9),
                          ),
                        ),
                        TextSpan(
                          text:  'I',
                          style:  TextStyle (
                            fontFamily: 'Rubik Bubbles',
                            fontSize:  54,
                            fontWeight:  FontWeight.w400,
                            height:  1.185,
                            color:  Color(0xff8282da),
                          ),
                        ),
                        TextSpan(
                          text:  'h',
                          style:  TextStyle (
                            fontFamily: 'Rubik Bubbles',
                            fontSize:  54,
                            fontWeight:  FontWeight.w400,
                            height:  1.185,
                            color:  Color(0xff6633ff),
                          ),
                        ),
                        TextSpan(
                          text:  'e',
                          style:  TextStyle (
                            fontFamily: 'Rubik Bubbles',
                            fontSize:  54,
                            fontWeight:  FontWeight.w400,
                            height:  1.185,
                            color:  Color(0xffacacf9),
                          ),
                        ),
                        TextSpan(
                          text:  'l',
                          style:  TextStyle (
                            fontFamily: 'Rubik Bubbles',
                            fontSize:  54,
                            fontWeight:  FontWeight.w400,
                            height:  1.185,
                            color:  Color(0xff8282da),
                          ),
                        ),
                        TextSpan(
                          text:  'p',
                          style:  TextStyle (
                            fontFamily: 'Rubik Bubbles',
                            fontSize:  54,
                            fontWeight:  FontWeight.w400,
                            height:  1.185,
                            color:  Color(0xff6633ff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // autogroupgzxfTkq (C9B3TuBH5dvAf65gE4GzXf)
                  margin:  const EdgeInsets.fromLTRB(34.5, 0, 46.5, 0),
                  padding:  const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  width:  double.infinity,
                  height:  70,
                  decoration:  BoxDecoration (
                    color:  const Color(0xff8282da),
                    borderRadius:  BorderRadius.circular(20),
                  ),
                  child:
                  Center(
                    // kzq (73:93)
                    child:
                    Center(
                      child:
                      SizedBox(
                        child:
                        Container(
                          constraints:  const BoxConstraints (
                            maxWidth:  80,
                          ),
                          child:
                          const Text(
                            'НАЧАТЬ',
                            textAlign:  TextAlign.center,
                            style:  TextStyle (
                              fontFamily: 'Inter',
                              fontSize:  20,
                              fontWeight:  FontWeight.w400,
                              height:  1,
                              letterSpacing:  -0.5,
                              color:  Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
