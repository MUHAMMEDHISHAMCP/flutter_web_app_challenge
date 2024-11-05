//

import 'package:flutter/material.dart';
import 'package:flutter_web_app_task/screens/event_details_screen.dart';
import 'package:flutter_web_app_task/utils/format_date.dart';
import 'package:flutter_web_app_task/utils/page_transition.dart';
import 'package:flutter_web_app_task/widgets/app_button.dart';
import '../models/event.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        FadePageRoute(page: EventDetailScreen(event: event)),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag:
                    'eventTitle_${event.title}', // Unique tag for Hero animation
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    event.title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                  DateFormater.formateDate(
                    event.date,
                  ),
                  style: const TextStyle(color: Colors.black87),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 8),
              Text(event.description,
                  maxLines: 2, overflow: TextOverflow.ellipsis),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: SubmitRsvpButton(
                  isLoading: false,
                  onPressed: () => Navigator.push(
                    context,
                    FadePageRoute(page: EventDetailScreen(event: event)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
