import 'dart:convert';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as http;
import 'package:logindemo/network_utils/api.dart';
import 'package:logindemo/publısh-servıce-bind.dart';

//import 'package:fashion/main.dart';
enum MessageType { sent, received }

class ChatScreen extends StatefulWidget
{
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
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
/*
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
            return Container
              (
              child: Text("hema"+snapshot.data),
            );
          },
        ),
      ),
    );
  }
*/
  final _controler = TextEditingController();
  String enteredmessage = "test";
  bool _showBottom = false;


  Future<List> getmassages() async
  {
    var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTYyMDAxMDcyNCwiZXhwIjoxNjIwMDE0MzI0LCJuYmYiOjE2MjAwMTA3MjQsImp0aSI6IlpYcXkzZnk3Y29TSG4yR2EiLCJzdWIiOjE5OTgsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.nDEwL09L1Gy9K6F43WRUQviFeNWZMfiNP4ZM9CaFQnI";
    var res = await Network().test2(token);
    var body = json.decode(res.body);
    print(body);
    return (body);
  }

   postmassages() async
  {
    var token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTYyMDAxMDcyNCwiZXhwIjoxNjIwMDE0MzI0LCJuYmYiOjE2MjAwMTA3MjQsImp0aSI6IlpYcXkzZnk3Y29TSG4yR2EiLCJzdWIiOjE5OTgsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.nDEwL09L1Gy9K6F43WRUQviFeNWZMfiNP4ZM9CaFQnI";
    var msg = "hello ? ";
    var res = await Network().test3(token,msg);
    var body = json.decode(res.body);
    print(body);
    //return (body);
  }
/*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     postmassages();
  }
*/


  @override
  Widget build(BuildContext context)
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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200.0),
                child: Image.asset(
                  'asset/images/flutter-logo.png',
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width * .075,
                  height: MediaQuery.of(context).size.height * .075,
                ),
              ),
            ),
            SizedBox(width: 15),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "mostafa",
                  style: Theme.of(context).textTheme.subhead,
                  overflow: TextOverflow.clip,
                ),
                Text(
                  "Online",
                  style: Theme.of(context).textTheme.subtitle.apply(
                        color: Colors.blue,
                      ),
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.phone),
            onPressed: () { postmassages();},
          ),
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),


      body: Stack(


        children: <Widget>[
          Positioned.fill(

           child: Column(
              children: <Widget>[
                Expanded(
                  ////////////// test //////////////
                    child: StreamBuilder(
                      stream: pusherService.eventStream,


                        builder: (BuildContext ctx, AsyncSnapshot snapshot)
                          {
                           /* if (!snapshot.hasData)
                            {
                              print("is");
                              print(snapshot.data);

                              return CircularProgressIndicator();

                            }*/
                            return Container
                              (  child: Text('${snapshot.data}') );


                          return ListView.builder(
                          padding: const EdgeInsets.all(10),

                          itemCount: 10,
                          itemBuilder: (ctx,itemCount)=> Container(
                          child: Text('${snapshot.data}'), //${docs[itemCount]['message']}


                          ),
                          );

                          /*
                      builder: (BuildContext context, AsyncSnapshot snapshot)
                      {
                        if (!snapshot.hasData)
                        {
                          return CircularProgressIndicator();

                        }

                            return Container
                              (
                                child: Text('${snapshot.data}') );
                      //  child: Text('${docs[itemCount]['message']}'),

*/
                    ////////////// test //////////////
/*
                    child: StreamBuilder(

                  stream: getmassages().asStream(),

                  builder: (BuildContext ctx, AsyncSnapshot snapshot)
                  {
                    var docs = snapshot.data;

                    return ListView.builder(
                      padding: const EdgeInsets.all(10),

                      itemCount: 10,
                      itemBuilder: (ctx,itemCount)=> Container(
                        child: Text('${docs[itemCount]['message']}'), //${docs[itemCount]['message']}


       ),
                   );*/
                 },
                  )
                ),


                Container(
                  margin: EdgeInsets.all(15.0),
                  height: 61,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(35.0),
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0, 3),
                                  blurRadius: 5,
                                  color: Colors.grey)
                            ],
                          ),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(Icons.face), onPressed: () {}),
                              Expanded(
                                child: TextField(
                                  controller: _controler,
                                  decoration: InputDecoration(
                                      hintText: "Type Something...",
                                      border: InputBorder.none),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.photo_camera),
                                onPressed: () { postmassages();  },
                              ),
                              IconButton(
                                icon: Icon(Icons.attach_file),
                                onPressed: () {
                                  setState(() {
                                    _showBottom = true;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        decoration: BoxDecoration
                          (
                            color: Colors.red, shape: BoxShape.circle),
                         child: IconButton(

                          icon: Icon(
                            Icons.send,
                            color: Colors.white,

                          ),
                          color: Colors.blue,
                             onPressed:() {postmassages();}

                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _showBottom = false;
                });
              },
            ),
          ),
          _showBottom
              ? Positioned(
                  bottom: 90,
                  left: 25,
                  right: 25,
                  child: Container(
                    padding: EdgeInsets.all(25.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 15.0,
                            color: Colors.grey)
                      ],
                    ),
                    child: GridView.count(
                      mainAxisSpacing: 21.0,
                      crossAxisSpacing: 21.0,
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      children: List.generate(
                        icons.length,
                        (i) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.green, width: 2),
                            ),
                            child: IconButton(
                              icon: Icon(
                                icons[i],
                                color: Colors.green,
                              ),
                              onPressed: () {},
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

List<IconData> icons = [
  Icons.image,
  Icons.camera,
  Icons.file_upload,
  Icons.folder,
  Icons.gif
];

List<Map<String, dynamic>> messages =
[

];

List<Map<String, dynamic>> friendsList =
[

];


class MyCircleAvatar extends StatelessWidget {
  final String imgUrl;
  const MyCircleAvatar({
    Key key,
    @required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(.3),
              offset: Offset(0, 2),
              blurRadius: 5)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200.0),
        child: Image.asset(
          'assets/images/ph.jpg',
          fit: BoxFit.fill,
          width: 60.0,
          height: 60.0,
        ),
      ),
    );
  }
}

//_-_-_-_-_-_-_-_-_-_-_-####################
//_-_-_-_-_-_-_-_-_-_-_-####################

class ReceivedMessagesWidget extends StatelessWidget
{
  final int i;
  const ReceivedMessagesWidget({
    Key key,
    @required this.i,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: <Widget>[
          MyCircleAvatar(
            imgUrl: messages[i]['contactImgUrl'],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "${messages[i]['contactName']}",
                style: Theme.of(context).textTheme.caption,
              ),
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * .5),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xfff9f9f9),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Text(
                  "${messages[i]['message']}",
                  style: Theme.of(context).textTheme.body1.apply(
                        color: Colors.black87,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Text(
            "${messages[i]['time']}",
            style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class SentMessageWidget extends StatelessWidget
{
  final int i;
  const SentMessageWidget({
    Key key,
    this.i,
  }) : super(key: key);


  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            "${messages[i]['time']}",
            style: Theme.of(context).textTheme.body2.apply(color: Colors.grey),
          ),
          SizedBox(width: 15),
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .6),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            child: Text(
              "${messages[i]['message']}",
              style: Theme.of(context).textTheme.body2.apply(
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
