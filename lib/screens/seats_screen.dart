import 'package:book_tickets/widgets/bus_seats.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatsScreen extends StatefulWidget {
  const SeatsScreen({super.key});

  @override
  State<SeatsScreen> createState() => _SeatsScreenState();
}

class _SeatsScreenState extends State<SeatsScreen> {
  List<int> selectedSeats = [];

  bool get canBookSeats => selectedSeats.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Seats'),
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 122, 94, 145),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select Seats',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Seats(
                onSeatSelected: (index, isSelected) {
                  setState(() {
                    if (isSelected) {
                      selectedSeats.add(index);
                    } else {
                      selectedSeats.remove(index);
                    }
                  });
                },
              ),
              const SizedBox(height: 10),
              Text(
                'Selected Seats: ${selectedSeats.join(', ')}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Total: ${selectedSeats.length * 100}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 10.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 122, 94, 145),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to the home page
                      Navigator.popAndPushNamed(context, '/dashboard');
                    },
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 10.0),
                    onPressed: canBookSeats
                        ? () {
                            // Navigate to the payment page
                            Navigator.popAndPushNamed(
                              context,
                              '/payment',
                              arguments: {
                                'selectedSeats': selectedSeats,
                                'total': selectedSeats.length * 100,
                              },
                            );
                          }
                        : null,
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: canBookSeats
                            ? const Color.fromARGB(255, 122, 94, 145)
                            : Colors
                                .grey, // Disable button if no seats are selected
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Book",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ), // Disable button if no seats are selected
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
