import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';

class RegistPage extends StatefulWidget {
  static String routeName = "/regist_page";
  @override
  _RegistPageState createState() => _RegistPageState();
}

//_-_-_-_-_-_-_-_-_-_-_-####################
//_-_-_-_-_-_-_-_-_-_-_-####################

class _RegistPageState extends State<RegistPage> {
  List<TextEditingController> codelist =
  List.generate(10, (index) => TextEditingController());
  List<TextEditingController> namelist =
  List.generate(10, (index) => TextEditingController());
  List<TextEditingController> chlist =
  List.generate(10, (index) => TextEditingController());
  List<TextEditingController> reqlist =
  List.generate(10, (index) => TextEditingController());
  List<TextEditingController> infolist =
  List.generate(12, (index) => TextEditingController());

  int totalch=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(
                    'نمودج حدف واضافه',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  trow.row('المستوى', 'الاسم باللغه العربيه', infolist[0],
                      infolist[1]),
                  trow.row(
                      'التخصص', 'الاسم بالانجليزيه', infolist[2], infolist[3]),
                  trow.row(
                      'المعدل التراكمى', 'الجنسيه', infolist[4], infolist[5]),
                  trow.row('المرشد الاكاديمى', 'الرقم القومى', infolist[6],
                      infolist[7]),
                  trow.row('الهاتف الارضى', 'الرقم الاكاديمي', infolist[8],
                      infolist[9]),
                  trow.row(' ', 'رقم الموبايل', infolist[10], infolist[11]),
                  SizedBox(
                    height: 40,
                  ),
                  Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        Center(
                          child: Text(
                            'المقررات المراد اضافتها',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        )
                      ])
                    ],
                  ),
                  Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        Center(
                          child: Text(
                            'عدد الوحدات',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Text(
                            'متطلب سابق',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Text(
                            'اسم المقرر',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Text(
                            'كود المقرر',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        )
                      ])
                    ],
                  ),
                  trow.f(chlist[0], reqlist[0], namelist[0], codelist[0]),
                  trow.f(chlist[1], reqlist[1], namelist[1], codelist[1]),
                  trow.f(chlist[2], reqlist[2], namelist[2], codelist[2]),
                  trow.f(chlist[3], reqlist[3], namelist[3], codelist[3]),
                  trow.f(chlist[4], reqlist[4], namelist[4], codelist[4]),
                  trow.f(chlist[5], reqlist[5], namelist[5], codelist[5]),
                  trow.f(chlist[6], reqlist[6], namelist[6], codelist[6]),
                  trow.f(chlist[7], reqlist[7], namelist[7], codelist[7]),
                  trow.f(chlist[8], reqlist[8], namelist[8], codelist[8]),
                  trow.f(chlist[9], reqlist[9], namelist[9], codelist[9]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Form(
                          child: Container(
                              width: 70,
                              child: TextFormField(
                                initialValue: totalch.toString(),
                                decoration: InputDecoration(

                                  hintText: 'مجموع الوحدات',
                                  hintStyle: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                    child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        color: kPrimaryColor,
                        elevation: 0.0,
                        child: MaterialButton(
                          onPressed: () {
                            for(int i=0;i<10;i++)
                            {
                              print("code:");
                              print(codelist[i].value.text);
                            }

                          },
                          minWidth: MediaQuery.of(context).size.width,
                          child: DefaultButton(
                            text: "Register",

                          ),
                        )),
                  ),

                ],
              ),
            )
        )
    );

  }
}

//_-_-_-_-_-_-_-_-_-_-_-####################
//_-_-_-_-_-_-_-_-_-_-_-####################

class trow extends StatelessWidget {
  TextEditingController code, name, ch, req, input1, input2;

  static Widget f(ch, req, name, code) {
    return Table(border: TableBorder.all(color: Colors.black), children: [
      TableRow(children: [
        Container(
          height: 30,
          child: Material(
            borderRadius: BorderRadius.circular(0.0),
            color: Colors.white.withOpacity(0.4),
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: TextFormField(
                controller: ch,
                decoration: InputDecoration(),
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          child: Material(
            borderRadius: BorderRadius.circular(0.0),
            color: Colors.white.withOpacity(0.4),
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: TextFormField(
                controller: req,
                decoration: InputDecoration(),
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          child: Material(
            borderRadius: BorderRadius.circular(0.0),
            color: Colors.white.withOpacity(0.4),
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: TextFormField(
                controller: name,
                decoration: InputDecoration(),
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          width: 50,
          child: Container(
            child: Material(
              borderRadius: BorderRadius.circular(0.0),
              color: Colors.white.withOpacity(0.4),
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: TextFormField(
                  controller: code,
                  decoration: InputDecoration(),
                ),
              ),
            ),
          ),
        ),
      ]),
    ]);
  }

  String hint1, hint2;

  static Widget row(hint1, hint2, input1, input2) {
    return Table(border: TableBorder.all(color: Colors.black), children: [
      TableRow(children: [
        Container(
          height: 30,
          child: Material(
            borderRadius: BorderRadius.circular(0.0),
            color: Colors.white.withOpacity(0.4),
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: TextFormField(
                controller: input1,
                decoration: InputDecoration(
                  hintText: hint1,
                  hintStyle:
                  TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          child: Material(
            borderRadius: BorderRadius.circular(0.0),
            color: Colors.white.withOpacity(0.4),
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: TextFormField(
                controller: input2,
                decoration: InputDecoration(
                  hintText: hint2,
                  hintStyle:
                  TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ]),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}