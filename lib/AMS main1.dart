import 'package:flutter/material.dart';


void main()
{
  runApp(BottomAppBarDemo());
}

class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo();

  @override
  State createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {
  var _showFab = true;
  var _showNotch = true;
  var _fabLocation = FloatingActionButtonLocation.endDocked;



  void _onFabLocationChanged(dynamic value) {
    setState(() {
      _fabLocation = value;
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Add user to AMS"),
          backgroundColor: Colors.deepOrange,
        ),
        body: ListView(
          padding: const EdgeInsets.only(bottom: 88),
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text("Choose User Type"),
            ),
            RadioListTile<FloatingActionButtonLocation>(
              title: Text(
                "Student",
              ),
              value: FloatingActionButtonLocation.endDocked,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged,
            ),
            RadioListTile<FloatingActionButtonLocation>(
              title: Text(
                "Advisor",
              ),
              value: FloatingActionButtonLocation.centerDocked,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged,
            ),
            RadioListTile<FloatingActionButtonLocation>(
              title: Text(
                "Adminstrator",
              ),
              value: FloatingActionButtonLocation.endFloat,
              groupValue: _fabLocation,
              onChanged: _onFabLocationChanged,
            ),
          ],
        ),
        floatingActionButton: _showFab
            ? FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
                backgroundColor: Colors.deepOrange,
                tooltip: "Create",
              )
            : null,
        floatingActionButtonLocation: _fabLocation,
        bottomNavigationBar: _DemoBottomAppBar(
          fabLocation: _fabLocation,
          shape: _showNotch ? const CircularNotchedRectangle() : null,
        ),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {

  
  const _DemoBottomAppBar({
    
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });


  final FloatingActionButtonLocation fabLocation;
  final dynamic shape;



  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.deepOrangeAccent,
      child: IconTheme(
        data: IconThemeData(color: Colors.deepOrangeAccent),
        child: Row(
          children: [
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
