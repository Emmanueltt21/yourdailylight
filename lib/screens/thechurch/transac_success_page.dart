import 'package:flutter/material.dart';


class ThankYouForOrderScreen extends StatelessWidget {
   ThankYouForOrderScreen({super.key, required this.paymentStatus });
  String? paymentStatus;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Status '),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Text('Your Transaction has been successfully  $paymentStatus')
            ],
          ),
        ),
      ),
    );
  }
}
