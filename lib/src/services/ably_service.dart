import 'dart:async';
import 'dart:developer';

import 'package:ably_flutter/ably_flutter.dart';

import '../domain/order/enums/status_enum.dart';

class AblyService {
  static const _ablyKey = "LI0M6g.pCKuHQ:m0gtA-K6ibSwZTKQsCjTyi3Fc9A9DolUCuqQEqpI2gk";
  static const _channelName = 'order-tracker';
  static const _eventName = 'order-status';
  static final clientOptions = ClientOptions(key: _ablyKey);

  Realtime realtime = Realtime(options: clientOptions);
  RealtimeChannel? channel;

  StreamController<StatusEnum> orderSC = StreamController<StatusEnum>.broadcast();

  void initListeners() {
    realtime.connection
        .on(ConnectionEvent.connected)
        .listen((ConnectionStateChange stateChange) async {
      switch (stateChange.current) {
        case ConnectionState.connected:
          log('Connected to Ably!');
          break;
        case ConnectionState.failed:
          log('The connection to Ably failed.');
          // Failed connection
          break;
        default:
          log("Other status $stateChange");
      }

      // Create a channel called 'get-started' and register a listener to subscribe to all messages with the name 'first'
      channel = realtime.channels.get(_channelName);
      channel?.subscribe().listen((message) {
        if (message.name == _eventName) {
          log('Message received: ${message.data}');
          log('Message received: ${message.clientId}');
          if (message.data == null) return;
          if (message.data is! String) return;
          final status = StatusEnum.fromValue(message.data as String);
          orderSC.sink.add(status);
        }
      });
    });
  }

  void dispose() async {
    await channel?.detach();
    await realtime.connection.close();
    orderSC.close();
  }
}
