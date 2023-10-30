// bước 1 khai bao import thu vien

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// bước 2: main
class HomeNodeJS extends StatefulWidget {
  const HomeNodeJS({super.key});
  @override
  State<HomeNodeJS> createState() => _HomeNodeJSstate();
}

class _HomeNodeJSstate extends State<HomeNodeJS> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() async {
    var url = Uri.parse('https://www.dungcoder.id.vn/so');
    var response = await http.get(url);
    final json = jsonDecode(response.body);
    setState(() {
      data = json;
    });

    // Xử lý dữ liệu ở đây
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Danh sách các số và tỉ lệ phần  ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                    backgroundColor: Colors.blue,
                    minimumSize: Size(700, 40),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/edit');
                  },
                  child: Text(
                    "Random",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
            ),
            Text(
              "Số random:",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              "Tổng phần trăm:",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              "Tổng số lần xuất hiện:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Expanded(
                child: GridView.builder(
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Số cột bạn muốn hiển thị
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.9,
                        mainAxisSpacing: 5),
                    itemBuilder: (BuildContext context, int index) {
                      final item = data[index];
                      final so = item['so'];
                      final solanxuathien = item['solanxuathien'];
                      final tile = item['tile'];                      
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/edit' , arguments: {
                            'so': so,
                            'solanxuathien': solanxuathien,
                            'tile': tile,
                            'id' : item['_id']
                          });
                        },
                        child: Column(children: [
                          Container(
                            margin: EdgeInsets.all(5),
                            height: 81,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.7,
                              ),
                            ),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Số: ' +so.toString(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Số lần xuất hiên: ' +
                                          solanxuathien.toString(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Tỉ lệ:'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      tile.toString(),
                                    ),
                                  ],
                                )
                              ],
                            )),
                          )
                        ]),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
