import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLAIM',
      theme: ThemeData(
        primaryColor: const Color(0xffd3bc86),
        accentColor: const Color(0xffdeddc8),
        scaffoldBackgroundColor: const Color(0xff283845),
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 96.0, letterSpacing: -1.5),
          headline4: TextStyle(
              fontSize: 34.0,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.25),
          headline5: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, letterSpacing: 0.15),
          bodyText2: TextStyle(fontSize: 14.0, letterSpacing: 0.25),
        ).apply(
          bodyColor: const Color(0xff283845),
          displayColor: const Color(0xff283845),
        ),
      ),
      home: Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        physics: NeverScrollableScrollPhysics(),
        children: [
          RedeemablePoints(),
          Card(
            color: Colors.blue,
            child: Container(
              child: Text(
                'f',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RedeemablePoints extends StatefulWidget {
  @override
  _RedeemablePointsState createState() => _RedeemablePointsState();
}

class _RedeemablePointsState extends State<RedeemablePoints> {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      color: Theme.of(context).primaryColor,
      title: 'REDEEMABLE POINTS',
      child: Text(
        '129.00',
        style: TextStyle(
            fontSize: 48, fontWeight: FontWeight.bold, letterSpacing: -0.25),
      ),
    );
  }
}

class CommonCard extends StatefulWidget {
  final String title;
  final Widget child;
  final Color color;

  CommonCard(
      {Key key,
      @required this.title,
      @required this.child,
      @required this.color})
      : super(key: key);

  @override
  _CommonCardState createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4,
        color: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 15),
          child: Column(
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const Divider(
                endIndent: 0.0,
                height: 20,
                thickness: 5,
              ),
              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}
