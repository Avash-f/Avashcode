import 'package:flutter/material.dart';

class BusTickets extends StatefulWidget {
  const BusTickets({super.key});

  @override
  State<BusTickets> createState() => _BusTicketsState();
}

class _BusTicketsState extends State<BusTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bus Tickets'),
      ),
    );
  }
}
