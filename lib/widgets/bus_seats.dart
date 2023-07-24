import 'package:flutter/material.dart';

class Seats extends StatefulWidget {
  final void Function(int, bool) onSeatSelected;
  const Seats({Key? key, required this.onSeatSelected}) : super(key: key);

  @override
  SeatsState createState() => SeatsState();
}

class SeatsState extends State<Seats> {
  List<bool> seatStates = List.generate(18, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          seatStates[index] = !seatStates[index];
                        });
                        widget.onSeatSelected(index, seatStates[index]);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: seatStates[index]
                            ? const Color.fromARGB(255, 122, 94, 145)
                            : Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(0),
                        minimumSize: const Size(50, 50),
                      ),
                      child: Center(
                        child: Text(
                          '$index',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 50),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: 8,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    final seatIndex = index + 7;
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          seatStates[seatIndex] = !seatStates[seatIndex];
                        });
                        widget.onSeatSelected(seatIndex, seatStates[seatIndex]);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: seatStates[seatIndex]
                            ? const Color.fromARGB(255, 122, 94, 145)
                            : Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(0),
                        minimumSize: const Size(50, 50),
                      ),
                      child: Center(
                        child: Text(
                          '${seatIndex + 1}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildSeatButton('Available', Colors.green, true),
              buildSeatButton(
                  'Selected', const Color.fromARGB(255, 122, 94, 145), true),
              buildSeatButton('Unavailable', Colors.red, true),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Available'),
              Text('Selected'),
              Text('Unavailable'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSeatButton(String text, Color color, bool isChecked) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: isChecked ? Border.all(color: Colors.white, width: 2) : null,
      ),
    );
  }
}
