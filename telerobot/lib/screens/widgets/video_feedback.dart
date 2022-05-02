import 'package:flutter/material.dart';

class VideoFeedback extends StatelessWidget {
  const VideoFeedback({Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: HtmlElementView(viewType: 'iframe'),
      ),
    );
  }
}
