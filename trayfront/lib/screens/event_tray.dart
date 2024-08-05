import 'package:flutter/material.dart';
import '../models/event.dart';
import '../services/api_service.dart';

class EventTray extends StatefulWidget {
  @override
  _EventTrayState createState() => _EventTrayState();
}

class _EventTrayState extends State<EventTray> {
  List<Event> _events = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  void _loadEvents() async {
    setState(() {
      _isLoading = true;
    });
    _events = await ApiService().fetchEvents();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Event Info')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _events.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_events[index].name),
                  subtitle:
                      Text('${_events[index].venue} - ${_events[index].date}'),
                );
              },
            ),
    );
  }
}
