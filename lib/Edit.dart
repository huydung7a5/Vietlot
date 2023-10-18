// bước 1 khai bao import thu vien

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// bước 2: main
class Editnumber extends StatefulWidget {
  const Editnumber({super.key});
  @override
  State<Editnumber> createState() => _EditnumberState();
}

class _EditnumberState extends State<Editnumber> {
  final tilegroups = [
    0.4761904761904762,
    0.9523809523809524,
    1.428571428571429,
    1.904761904761905,
    2.380952380952381,
    2.857142857142857,
    3.333333333333333,
    3.80952380952381,
    4.285714285714286,
  ];
  String? selectedgroup;
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('Power6.55');

  TextEditingController so = TextEditingController();
  TextEditingController solanxuathien = TextEditingController();

  void addnumber() {
    final data = {'so': so.text, 'solanxuathien': solanxuathien.text, 'tile': selectedgroup};
    donor.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: so,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nhập số',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: solanxuathien,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nhập số lần xuất hiện',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      label: Text("Tỉ lệ phần trăm"),
                    ),
                    items: tilegroups
                        .map((e) => DropdownMenuItem(
                              child: Text(e.toString()),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (val) {
                      selectedgroup = val.toString();
                    }),
              ),
              ElevatedButton(
                onPressed: () {
                  addnumber();
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(Size(double.infinity, 50)),
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: Text("Lưu", style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ));
  }
}
