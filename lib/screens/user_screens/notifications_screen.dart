import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/util/notifications.dart';
import 'package:flutter_travel_concept/screens/user_screens/ava_med_ph_screen.dart';

class NotificationsApp extends StatefulWidget {
  const NotificationsApp();

  @override
  State<NotificationsApp> createState() => _Notificationsstate();
}

class _Notificationsstate extends State<NotificationsApp> {
  //final List<String> notifications = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    print(notifications[1][4]['med_name']);
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Notifications'),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(notifications[index][4]['med_name']),
            subtitle: const Text('its available in 3 pharamacies'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // Implement notification deletion logic
                print(
                  notifications[index][4]['med_name'] + " " + 'deleted',
                );
              },
            ),
            onTap: () {
              print(notifications[index][4]['med_name']);
               Navigator.of(context).pushNamed(AvaMedPharScreen.routeName);
            },
          );
        },
      ),
    );
  }
}
