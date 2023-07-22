import 'package:flutter/material.dart';

class HomeModel extends StatefulWidget {
  final String uuid;
  final double valor;

  HomeModel(
    this.uuid,
    this.valor, {
    Key? key,
  }) : super(key: key);

  @override
  State<HomeModel> createState() => _HomeModel();
}

class _HomeModel extends State<HomeModel> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.valor.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ],
    ));
  }
}
