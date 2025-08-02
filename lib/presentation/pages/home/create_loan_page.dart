import 'package:flutter/material.dart';

class CreateLoanPage extends StatefulWidget {
  const CreateLoanPage({super.key});

  @override
  State<CreateLoanPage> createState() => _CreateLoanPageState();
}

class _CreateLoanPageState extends State<CreateLoanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Loan")));
  }
}
