import 'package:flutter/material.dart';

class AmountPage extends StatefulWidget {
  const AmountPage({super.key});

  @override
  State<AmountPage> createState() => _AmountPageState();
}

class _AmountPageState extends State<AmountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Amount")));
  }
}
