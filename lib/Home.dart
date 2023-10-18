// bước 1 khai bao import thu vien

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// bước 2: main
class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Homestate();
}

class _Homestate extends State<Home> {
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('Power6.55');
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
                  child: Text(
                    "Danh sách các số và tỉ lệ phần ",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            ElevatedButton(
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
              child: OverflowBox(
                maxWidth: MediaQuery.of(context).size.width,
                child: StreamBuilder(
                    stream: donor.snapshots(),
                    builder: (context, AsyncSnapshot snapshots) {
                      if (snapshots.hasData) {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        2, // Số cột bạn muốn hiển thị
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 20,
                                    childAspectRatio: 2.1),
                            itemCount: snapshots
                                .data.docs.length, // chia listview thành 2 cột
                            itemBuilder: (context, index) {
                              final DocumentSnapshot documentSnapshot =
                                  snapshots.data.docs[index];
                              return Column(children: [
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
                                            'Số: ' +
                                                documentSnapshot['so']
                                                    .toString(),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Số lần xuất hiên: ' +
                                                documentSnapshot[
                                                        'solanxuathien']
                                                    .toString(),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Tỉ lệ:'
                                          ),
                                        ],
                                      ),
                                       Row(
                                        children: [
                                          Text(                                          
                                                documentSnapshot['tile']
                                                    .toString(),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                                )
                              ]);
                            });
                      }
                      return Container();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
