import 'package:flutter/material.dart';
import '../../models/event.dart';
import 'package:rpg/screens/event/event_profile.dart';
import '../../shared/styled_text.dart';
import '../../shared/styled_button.dart'; // import your styled button
import '../create/EventCreateScreen.dart';


class EventListScreen extends StatefulWidget {
  final List<Event> events;

  const EventListScreen({super.key, required this.events});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  late List<Event> _events;

  @override
  void initState() {
    super.initState();
    _events = List.from(widget.events); // make a mutable copy
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Events"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: _events.length + 1,
          separatorBuilder: (_, __) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            if (index == _events.length) {
              // Create Event button
              return StyledButton(
                child: StyledHeading("Create Event"),
                onPressed: () async {
                  final newEvent = await Navigator.push<Event>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EventCreateScreen(),
                    ),
                  );

                  if (newEvent != null) {
                    setState(() => _events.add(newEvent));
                  }
                },
              );
            }

            final event = _events[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EventProfileScreen(event: event),
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledHeading(event.title),
                      const SizedBox(height: 6),
                      Text(
                        event.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

