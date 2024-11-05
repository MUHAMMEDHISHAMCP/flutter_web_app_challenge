import 'package:flutter/material.dart';
import '../models/event.dart';
import '../widgets/event_card.dart';

class EventListingScreen extends StatelessWidget {
  final List<Event> events = Event.getSampleEvents();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: const Text(
          "Events",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount;
            double childAspectRatio;

            if (constraints.maxWidth > 1200) {
              crossAxisCount = 4;
              childAspectRatio = 1.2;
            } else if (constraints.maxWidth > 800) {
              crossAxisCount = 3;
              childAspectRatio = 1;
            } else if (constraints.maxWidth > 600) {
              crossAxisCount = 2;
              childAspectRatio = 1.5;
            } else {
              crossAxisCount = 1;
              childAspectRatio = 2.2;
            }

            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16.0,
                childAspectRatio: childAspectRatio,
              ),
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventCard(event: events[index]);
              },
            );
          },
        ),
      ),
    );
  }
}
