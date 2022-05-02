import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart' hide navigator;

import '../../../controllers/dash_controller.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key}) : super(key: key);

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  // ignore: unused_field
  final _localRenderer = RTCVideoRenderer();
  final _remoteRenderer = RTCVideoRenderer();
  final DashboardContoller ctrl = Get.find();

  initRenderers() async {
    await _localRenderer.initialize();
    await _remoteRenderer.initialize();
  }

  _createPeerConnection() async {
    Map<String, dynamic> configuration = {
      'iceServers': [
        {'url': 'stun:stun.l.google.com:19302'},
      ]
    };

    final Map<String, dynamic> offerSdpConstrains = {
      'mandatory': {
        'OfferToReceiveAudio': true,
        'OfferToReceiveVideo': false,
      },
      'optional': [],
    };

    final _localStream = await _getMedia();

    RTCPeerConnection pc =
        await createPeerConnection(configuration, offerSdpConstrains);

    pc.addStream(_localStream!);

    pc.onIceCandidate = (e) {
      if (e.candidate != null) {
        final candidate = json.encode({
          'candidate': e.candidate.toString(),
          'sdpMid': e.sdpMid.toString(),
          'sdpMlineIndex': e.sdpMLineIndex,
        });
        ctrl.sendCandidate(candidate);
      }
    };

    pc.onIceConnectionState = (e) {
      // ignore: avoid_print
      print(e);
    };

    pc.onAddStream = (stream) {
      // ignore: avoid_print
      print('addStream: ' + stream.id);
      _remoteRenderer.srcObject = stream;
    };

    return pc;
  }

  _getMedia() async {
    final Map<String, dynamic> constrains = {
      'audio': false,
      'video': {'facingMode': 'user'}
    };

    try {
      final stream = await navigator.mediaDevices.getUserMedia(constrains);
      _localRenderer.srcObject = stream;
      return stream;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  void initState() {
    initRenderers();
    _createPeerConnection().then((connection) {
      ctrl.peerConnection = connection;
    });
    super.initState();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () => ctrl.createOffer(),
          icon: const Icon(Icons.home),
          label: const Text('Offer'),
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(), primary: Colors.amber),
        ),
        ElevatedButton.icon(
          onPressed: () => ctrl.createAnswer(),
          icon: const Icon(Icons.home),
          label: const Text('Answer'),
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(), primary: Colors.amber),
        ),
        Row(
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: RTCVideoView(_localRenderer),
            ),
            SizedBox(
              height: 200,
              width: 200,
              child: RTCVideoView(_remoteRenderer),
            ),
          ],
        ),
      ],
    );
  }
}
