import 'package:flutter/material.dart';

class NotificationIcon extends StatefulWidget {
  const NotificationIcon({Key? key}) : super(key: key);

  @override
  State<NotificationIcon> createState() => _NotificationIconState();
}

class _NotificationIconState extends State<NotificationIcon> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.notifications),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            Future.delayed(
              const Duration(seconds: 0),
              () => showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text("Error"),
                      content: Text('Prueba de la notificacion'),
                      contentPadding: const EdgeInsets.all(20),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('Close'))
                      ],
                    );
                  }),
            );
          },
          child: const Text(
              'Notificacion para ver que tan grande puede ser el texto dentro del boton'),
        )
      ],
    );
  }
}
