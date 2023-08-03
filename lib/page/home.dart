import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final argTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("홈화면"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: TextField(
              controller: argTextEditingController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(
                    color: Colors.grey,
                  )
                ),
                hintText: "인수"
              ),
              onChanged: (text) {},
            ),
          ),
          FilledButton(onPressed: () {
            Get.toNamed(
              "/search",
              arguments: User(
                name: argTextEditingController.text,
                age: 28
              )
            );
          }, child: Text("화면 이동"))
        ],
      ),
    );
  }
}
