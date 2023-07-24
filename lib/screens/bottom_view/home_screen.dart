import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Bus Ticket'),
        backgroundColor: const Color.fromARGB(255, 122, 94, 145),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            buildBusCard('Kathmandu', 'Dharan', '12345'),
            const SizedBox(height: 20),
            buildBusCard('Kathmandu', 'Biratnagar', '4567'),
            const SizedBox(height: 20),
            buildBusCard('Pokhara', 'Mustang', '6789'),
          ],
        ),
      ),
    );
  }

  Widget buildBusCard(String from, String to, String busNo) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/seats');
      },
      child: SizedBox(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: const Color.fromARGB(255, 228, 191, 243),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$from to $to',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Bus no: $busNo',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
