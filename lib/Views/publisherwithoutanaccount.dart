import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class publisherwithoutacc extends StatefulWidget {
  const publisherwithoutacc({super.key});

  @override
  State<publisherwithoutacc> createState() => _publisherwithoutaccState();
}

class _publisherwithoutaccState extends State<publisherwithoutacc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        brightness: Brightness.dark,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40)),
            gradient: LinearGradient(
                colors: [Colors.pink, Color.fromARGB(255, 87, 146, 205)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
        ),
        title: const Text(
          'Start Publishing',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const Text('Start publishing and make money'),
    );
  }
}
