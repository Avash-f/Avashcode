import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    final List<int> selectedSeats = args['selectedSeats'];
    final int total = args['total'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Page'),
        backgroundColor: const Color.fromARGB(255, 122, 94, 145),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 230, 199, 255),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bus no: 4567',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Selected Seats: ${selectedSeats.join(', ')}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Total: $total',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          // const Text(
          //   'Select Payment Method',
          //   style: TextStyle(
          //     fontSize: 24,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          CupertinoButton(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
            child: Container(
              alignment: Alignment.center,
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 122, 94, 145),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            onPressed: () {
              // Navigate to the payment page
              Navigator.popAndPushNamed(
                context,
                '/payment',
                arguments: {
                  'selectedSeats': selectedSeats,
                  'total': selectedSeats.length * 100,
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
