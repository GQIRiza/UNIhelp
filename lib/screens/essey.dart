import 'package:flutter/material.dart';

class EsseyPage extends StatefulWidget {

  const EsseyPage({Key? key}) : super(key: key);

  @override
  _EsseyPageState createState() => _EsseyPageState();
}

class _EsseyPageState extends State<EsseyPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        title: const Text(
          'Рефераты',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 26,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {

          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            types(),
          ],
        ),
      ),
    );
  }
  Widget types(){
    return Center(
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              width: 370,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.indigo[100],
                  borderRadius: BorderRadius.circular(20)),
              child:
              Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children:  [
                  Container(
                    margin:  EdgeInsets.fromLTRB(0, 0, 56, 8),
                    width:  double.infinity,
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          // h7K (165:409)
                          margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child:
                          Text(
                            'Реферат на тему: ',
                            style:  TextStyle (
                              fontFamily: 'Inter',
                              fontSize:  13,
                              fontWeight:  FontWeight.w400,
                              color:  Color(0xff000000),
                            ),
                          ),
                        ),
                        Text(
                          'Русь и варяги',
                          style:  TextStyle (
                            fontFamily: 'Inter',
                            fontSize:  13,
                            fontWeight:  FontWeight.w800,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.fromLTRB(4, 0, 143, 6),
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          margin:  EdgeInsets.fromLTRB(0, 0, 7, 0),
                          child:
                          RichText(
                            text:
                            TextSpan(
                              style:  TextStyle (
                                fontFamily: 'Inter',
                                fontSize:  13,
                                fontWeight:  FontWeight.w400,
                                color:  Color(0xff000000),
                              ),
                              children:  [
                                TextSpan(
                                  text:  'Предмет:',
                                  style:  TextStyle (
                                    fontFamily: 'Inter',
                                    fontSize:  13,
                                    fontWeight:  FontWeight.w600,
                                    color:  Color(0xff000000),
                                  ),
                                ),
                                TextSpan(
                                  text:  '',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'История',
                          style:  TextStyle (
                            fontFamily: 'Inter',
                            fontSize:  13,
                            fontWeight:  FontWeight.w400,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.fromLTRB(0, 0, 196, 0),
                    width:  double.infinity,
                    child:
                    Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            margin:  EdgeInsets.fromLTRB(0, 0, 19, 0),
                            child:
                            Text(
                              '🕗',
                              style:  TextStyle (
                                fontFamily: 'Inter',
                                fontSize:  20,
                                fontWeight:  FontWeight.w800,
                                color:  Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(
                            '23.02.2024',
                            style:  TextStyle (
                              fontFamily: 'Inter',
                              fontSize:  15,
                              fontWeight:  FontWeight.w400,
                              color:  Color(0xff000000),
                            ),
                          ),
                        ]
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              width: 370,
              height: 100,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.indigo[100],
                  borderRadius: BorderRadius.circular(20)),
              child:
              Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children:  [
                  Container(
                    margin:  EdgeInsets.fromLTRB(0, 0, 56, 8),
                    width:  double.infinity,
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          // h7K (165:409)
                          margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child:
                          Text(
                            'Реферат на тему: ',
                            style:  TextStyle (
                              fontFamily: 'Inter',
                              fontSize:  13,
                              fontWeight:  FontWeight.w400,
                              color:  Color(0xff000000),
                            ),
                          ),
                        ),
                        Text(
                          'Философия нигилизма',
                          style:  TextStyle (
                            fontFamily: 'Inter',
                            fontSize:  13,
                            fontWeight:  FontWeight.w800,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.fromLTRB(4, 0, 143, 6),
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          margin:  EdgeInsets.fromLTRB(0, 0, 7, 0),
                          child:
                          RichText(
                            text:
                            TextSpan(
                              style:  TextStyle (
                                fontFamily: 'Inter',
                                fontSize:  13,
                                fontWeight:  FontWeight.w400,
                                color:  Color(0xff000000),
                              ),
                              children:  [
                                TextSpan(
                                  text:  'Предмет:',
                                  style:  TextStyle (
                                    fontFamily: 'Inter',
                                    fontSize:  13,
                                    fontWeight:  FontWeight.w600,
                                    color:  Color(0xff000000),
                                  ),
                                ),
                                TextSpan(
                                  text:  '',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          // ayj (165:418)
                          'Философия',
                          style:  TextStyle (
                            fontFamily: 'Inter',
                            fontSize:  13,
                            fontWeight:  FontWeight.w400,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.fromLTRB(0, 0, 196, 0),
                    width:  double.infinity,
                    child:
                    Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            margin:  EdgeInsets.fromLTRB(0, 0, 19, 0),
                            child:
                            Text(
                              '🕗',
                              style:  TextStyle (
                                fontFamily: 'Inter',
                                fontSize:  20,
                                fontWeight:  FontWeight.w800,
                                color:  Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(
                            '02.02.2024',
                            style:  TextStyle (
                              fontFamily: 'Inter',
                              fontSize:  15,
                              fontWeight:  FontWeight.w400,
                              color:  Color(0xff000000),
                            ),
                          ),
                        ]
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              width: 370,
              height: 100,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                  color: Colors.indigo[100],
                  borderRadius: BorderRadius.circular(20)),
              child:
              Column(
                crossAxisAlignment:  CrossAxisAlignment.start,
                children:  [
                  Container(
                    margin:  EdgeInsets.fromLTRB(0, 0, 56, 8),
                    width:  double.infinity,
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          margin:  EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child:
                          Text(
                            'Реферат на тему: ',
                            style:  TextStyle (
                              fontFamily: 'Inter',
                              fontSize:  13,
                              fontWeight:  FontWeight.w400,
                              color:  Color(0xff000000),
                            ),
                          ),
                        ),
                        Text(
                          'Малый бизнес',
                          style:  TextStyle (
                            fontFamily: 'Inter',
                            fontSize:  13,
                            fontWeight:  FontWeight.w800,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.fromLTRB(4, 0, 143, 6),
                    child:
                    Row(
                      crossAxisAlignment:  CrossAxisAlignment.center,
                      children:  [
                        Container(
                          margin:  EdgeInsets.fromLTRB(0, 0, 7, 0),
                          child:
                          RichText(
                            text:
                            TextSpan(
                              style:  TextStyle (
                                fontFamily: 'Inter',
                                fontSize:  13,
                                fontWeight:  FontWeight.w400,
                                color:  Color(0xff000000),
                              ),
                              children:  [
                                TextSpan(
                                  text:  'Предмет:',
                                  style:  TextStyle (
                                    fontFamily: 'Inter',
                                    fontSize:  13,
                                    fontWeight:  FontWeight.w600,
                                    color:  Color(0xff000000),
                                  ),
                                ),
                                TextSpan(
                                  text:  '',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          'Экономика',
                          style:  TextStyle (
                            fontFamily: 'Inter',
                            fontSize:  13,
                            fontWeight:  FontWeight.w400,
                            color:  Color(0xff000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.fromLTRB(0, 0, 196, 0),
                    width:  double.infinity,
                    child:
                    Row(
                        crossAxisAlignment:  CrossAxisAlignment.center,
                        children:  [
                          Container(
                            margin:  EdgeInsets.fromLTRB(0, 0, 19, 0),
                            child:
                            Text(
                              '🕗',
                              style:  TextStyle (
                                fontFamily: 'Inter',
                                fontSize:  20,
                                fontWeight:  FontWeight.w800,
                                color:  Color(0xff000000),
                              ),
                            ),
                          ),
                          Text(
                            '23.03.2024',
                            style:  TextStyle (
                              fontFamily: 'Inter',
                              fontSize:  15,
                              fontWeight:  FontWeight.w400,
                              color:  Color(0xff000000),
                            ),
                          ),
                        ]
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}