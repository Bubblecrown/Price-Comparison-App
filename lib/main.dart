// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: Text("Calculator App")),
        body: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ตำแหน่งเก็บข้อมูลที่ผู้ใช้กรอกเข้ามา
  TextEditingController quantity = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController quantityB = TextEditingController();
  TextEditingController priceB = TextEditingController();
  TextEditingController result = TextEditingController();

  @override
  void initState() {
    super.initState();
    result.text = "Which one is the cheapest !";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/cloudy.png"),
                fit: BoxFit.cover,
              ),
            ),
          child: Center(
      child: ListView(
          shrinkWrap: true,
          children: [
            Column(children: [
                Center(
                  child: Container(
                      padding: EdgeInsets.all(30),
                      margin: EdgeInsets.all(20),
                      height: 520,
                      width: 400,
                      decoration: BoxDecoration(
                          color: Color(0xffF7F7F7),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Compare deals',
                            style: TextStyle(
                                fontFamily: 'sora',
                                fontSize: 28,
                                color: Color(0xff43658B),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Image.asset(
                            'assets/milk-box.png',
                            scale: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('A'),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextField(
                                  style: TextStyle(height: 0.7),
                                  controller: quantity,
                                  decoration: InputDecoration(
                                      labelText: 'Amount',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextField(
                                  style: TextStyle(height: 0.7),
                                  controller: price,
                                  decoration: InputDecoration(
                                      labelText: 'Price',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('B'),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextField(
                                  style: TextStyle(height: 0.7),
                                  controller: quantityB,
                                  decoration: InputDecoration(
                                      labelText: 'Amount',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: TextField(
                                  style: TextStyle(height: 0.7),
                                  controller: priceB,
                                  decoration: InputDecoration(
                                      labelText: 'Price',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              var resultCalA = double.parse(quantity.text) /
                                  double.parse(price.text);
                              var resultCalB = double.parse(quantityB.text) /
                                  double.parse(priceB.text);

                              setState(() {
                                result.text = (resultCalA > resultCalB)
                                    ? "A is cheaper !"
                                    : "B is cheaper !";
                              });
                            },
                            child: Text('Check them'),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Color(0xff4E89AE)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.fromLTRB(50, 15, 50, 15)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)))),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            result.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xff43658B),
                                fontSize: 18,
                                fontFamily: 'sora'),
                          )
                        ],
                      )),
                ),
              
            ]),
          ],
      ),
    ),
        ));
  }
}
