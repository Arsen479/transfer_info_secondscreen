import 'package:flutter/material.dart';

class Secondscreen extends StatelessWidget {
  const Secondscreen(
      {super.key,
      required this.name,
      required this.adress,
      required this.age,
      required this.gender});
  final String name;
  final String adress;
  final int age;
  final String gender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Column(
        children: [
          Text('Имя: $name'),
          Text('Адрес: $adress'),
          Text('Возраст: $age'),
          Text('Пол: $gender'),
        ],
      ),
    );
  }
}
