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
              child: StreamBuilder(
                  stream: donor.snapshots(),
                  builder: (context, AsyncSnapshot snapshots) {
                    if (snapshots.hasData) {
                      return ListView.builder(
                          itemCount: snapshots.data.docs.length,
                          itemBuilder: (context, index) {
                            final DocumentSnapshot documentSnapshot =
                                snapshots.data.docs[index];
                            return Column(children: [
                              Text("số: " + documentSnapshot['so'].toString()),
                              Text("Tỉ lệ: " +
                                  documentSnapshot['tile'].toString()),
                              Text("Số lần xuất hiện: " +
                                  documentSnapshot['solanxuathien'].toString())
                            ]);
                          });
                    }
                    return Container();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
