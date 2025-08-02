import 'package:flutter/material.dart';

class CreateCustomerPage extends StatefulWidget {
  const CreateCustomerPage({super.key});

  @override
  State<CreateCustomerPage> createState() => _CreateCustomerPageState();
}

class _CreateCustomerPageState extends State<CreateCustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Customer")));
  }
}
