import 'package:logindemo/publısh-servıce-bind.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget
{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>
{
  PusherService pusherService = PusherService();
  @override
  void initState()
  {
    pusherService = PusherService();
    pusherService.firePusher('chat', 'create');
    super.initState();
  }

  @override
  void dispose() {
    pusherService.unbindEvent('create');
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: StreamBuilder(
          stream: pusherService.eventStream,
          builder: (BuildContext context, AsyncSnapshot snapshot)
          {
            if (!snapshot.hasData)
            {
              return CircularProgressIndicator();
            }
            return Container(
              child: Text("hema"+snapshot.data),
            );
          },
        ),
      ),
    );
  }
}

