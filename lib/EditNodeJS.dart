// bước 1 khai bao import thu vien

import 'package:flutter/material.dart';

// bước 2: main
class EditNodeJS extends StatefulWidget {
  const EditNodeJS({super.key});

  @override
  State<EditNodeJS> createState() => _EditNodeJSState();
}

class _EditNodeJSState extends State<EditNodeJS> {
  @override
  void initState() {
    super.initState();
  }

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
  TextEditingController so = TextEditingController();
  TextEditingController solanxuathien = TextEditingController();
  void addnumber() {
    final data = {
      'so': so.text,
      'solanxuathien': solanxuathien.text,
      'tile': selectedgroup
    };
  }

  @override
  Widget build(BuildContext context) {
    final value = ModalRoute.of(context)!.settings.arguments;
    final data = value as Map;
    so = TextEditingController(text: data['so'].toString());
    solanxuathien =
        TextEditingController(text: data['solanxuathien'].toString());
    selectedgroup = data['tile'].toString();
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
                child: Text(
                  value['tile'].toString(),
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
