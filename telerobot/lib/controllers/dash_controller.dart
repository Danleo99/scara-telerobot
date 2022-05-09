import 'dart:convert';
import 'dart:math';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sdp_transform/sdp_transform.dart';
import 'package:socket_io_client/socket_io_client.dart' as socket;
import 'package:telerobot/constants/data_store.dart';
import 'package:file_picker/file_picker.dart';

class ChartData {
  ChartData(this.x, this.y, this.selected);
  final int x;
  final int y;
  bool selected;
}

class DashboardContoller extends GetxController {
  // Controla que pantalla del dash esta activa
  var active = 0.obs;
  // Trae el usuario del almacenamiento
  final box = GetStorage();
  // Variable del nombre del usuario
  var name = ''.obs;
  // Lista de puntos seleccionados
  List selected = [].obs;
  List pointsToSend = [];
  List selectedByDegree = [].obs;
  // Lista de posiciones x,y
  List<ChartData> cSpace = [
    for (var r = 245; r <= 450; r += 10)
      for (var th = 0; th <= 180; th += 2)
        ChartData((r * cos(th * (pi / 180))).round(),
            (r * sin(th * (pi / 180))).round(), false)
  ];
  // Sliders
  RxDouble fisrtDegree = 0.0.obs,
      secondDegree = 0.0.obs,
      xMove = 0.0.obs,
      yMove = 0.0.obs;
  List<String> speeds = ['100', '250', '500', '750', '1000'];
  int speedSelected = 100;

  RTCPeerConnection? peerConnection;
  bool _offer = false;
  // Frame a mostrar
  var frameActual = ''.obs;
  final cardControllers = [
    FlipCardController(),
    FlipCardController(),
    FlipCardController()
  ];

  socket.Socket client = socket.io(
    'http://18.230.53.24:80',
    <String, dynamic>{
      'transports': ['websocket']
    },
  );

  @override
  void onInit() {
    listenerSocket();
    // getUser();
    super.onInit();
  }

  @override
  void onClose() {
    client.disconnect();
    super.onClose();
  }

  void listenerSocket() {
    // ignore: avoid_print
    client.onConnect((_) => {print('Connected to server')});

    client.on('startVideo', (session) {
      setRemoteDescription(session);
    });

    client.on('candidate', (can) {
      setCandidate(can);
    });

    client.on('sliderChange1', (positions) {
      fisrtDegree.value = positions['first'];
      secondDegree.value = positions['second'];
    });

    client.on('sliderChange2', (positions) {
      xMove.value = positions['xMove'];
      yMove.value = positions['yMove'];
    });
  }

  void degreeChange() {
    Map degrees = {
      "first": fisrtDegree.value.round(),
      "second": secondDegree.value.round(),
      "speed": speedSelected
    };
    client.emit('degreeChange', degrees);
  }

  void changeTCI() {
    Map degrees = {
      "xMove": xMove.value.round(),
      "yMove": yMove.value.round(),
      "speed": speedSelected
    };
    client.emit('changeTCI', degrees);
  }

  void sendRoutine() {
    Map message = {
      "speed": speedSelected,
      "routine": pointsToSend,
    };
    client.emit('runRutine', message);
  }

  void home() {
    fisrtDegree.value = 0;
    secondDegree.value = 0;
    client.emitWithAck('home', 'run', ack: (ack) {});
  }

  void reset() {
    client.emit('reset', 'run');
  }

  void sendCandidate(candidate) {
    client.emit('candidate', candidate);
  }

  void createOffer() async {
    RTCSessionDescription description =
        await peerConnection!.createOffer({'offerToReceiveVideo': 1});
    var session = parse(description.sdp.toString());
    var offer = jsonEncode(session);
    _offer = true;

    await peerConnection!.setLocalDescription(description);
    client.emit('startVideo', offer);
  }

  void createAnswer() async {
    RTCSessionDescription description =
        await peerConnection!.createAnswer({'offerToReceiveVideo': 1});
    var session = parse(description.sdp.toString());
    var answer = json.encode(session);

    peerConnection!.setLocalDescription(description);

    client.emit('startVideo', answer);
  }

  void setRemoteDescription(sessionDesc) async {
    var jsonString = sessionDesc;
    dynamic session = await jsonDecode('$jsonString');

    String sdp = write(session, null);

    RTCSessionDescription description =
        RTCSessionDescription(sdp, _offer ? 'answer' : 'offer');

    await peerConnection!.setRemoteDescription(description);
  }

  void setCandidate(candidates) async {
    String jsonString = candidates;
    dynamic session = await jsonDecode(jsonString);
    // ignore: avoid_print
    print(session['candidate']);
    dynamic candidate = RTCIceCandidate(
        session['candidate'], session['sdpMid'], session['sdpMLineIndex']);

    await peerConnection!.addCandidate(candidate);
  }

  void logout() {
    try {
      box.remove('user');
      Get.offAllNamed('/');
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void getUser() {
    final userData = box.read('user');
    final _user = User.fromJson(userData);
    name.value = _user.name + ' ' + _user.lastname;
  }

  void uploadFile() async {
    final path = await FilePicker.platform.pickFiles(
      allowedExtensions: ['txt'],
      type: FileType.custom,
    );
    if (path?.files.first.bytes != null) {
      final data = String.fromCharCodes(path?.files.first.bytes ?? []);
      client.emit('gcode', data);
    }
  }

  void updatePoint(args) {
    final punto = cSpace[int.parse(args.pointIndex.toString())];
    final onList = selected.indexWhere((element) =>
        element ==
        'Punto (' + (punto.x).toString() + ',' + (punto.y).toString() + ')');
    if (onList == -1) {
      selected.add(
          'Punto (' + (punto.x).toString() + ',' + (punto.y).toString() + ')');
      pointsToSend.add('(${(punto.x).toString()},${(punto.y).toString()})');
    } else {
      selected.removeAt(onList);
      pointsToSend.removeAt(onList);
    }
    punto.selected = !punto.selected;
  }
}
