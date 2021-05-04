import 'package:flutter/services.dart';
import 'package:pusher_websocket_flutter/pusher.dart';
import 'dart:async';

class PusherService
{
  Event lastEvent;
  String lastConnectionState;
  Channel channel;

  StreamController<String> _eventData = StreamController<String>();
  Sink get _inEventData => _eventData.sink;
  Stream get eventStream => _eventData.stream;

  Future<void> initPusher() async
  {
    try {
      await Pusher.init("45ab025d233c806ef9e0", PusherOptions(cluster: 'eu'));
    } on PlatformException catch (e)
    {
      print(e.message);
    }

  }
  void connectPusher()
  {
    Pusher.connect(
        onConnectionStateChange: (
            ConnectionStateChange connectionState) async {
          lastConnectionState = connectionState.currentState;
        }, onError: (ConnectionError e) {
      print("Error: ${e.message}");
    });
  }
  void bindEvent(String eventName)
  {
    channel.bind(eventName, (last)
    {
      final String data = last.data;
      _inEventData.add(data);
    });
  }

  Future<void> subscribePusher(String channelName) async
  {
    channel = await Pusher.subscribe(channelName);
  }
  Future<void> firePusher(String channelName, String eventName) async
  {
    await initPusher();
    connectPusher();
    await subscribePusher(channelName);
    bindEvent(eventName);
  }


  void unSubscribePusher(String channelName)
  {
    Pusher.unsubscribe(channelName);
  }

  void unbindEvent(String eventName)
  {
    channel.unbind(eventName);
    _eventData.close();
  }

}











