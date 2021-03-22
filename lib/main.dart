import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const _primaryColor = const Color(0xffFEB437);
  static const _accentColor = const Color(0xffFF7200);
  static const _scaffoldBackgroundColor = const Color(0xffFFFFFF);
  static const _textColor = const Color(0xff3A044F);

  // static const _primaryColor = const Color(0xffd3bc86);
  // static const _accentColor = const Color(0xffdeddc8);
  // static const _scaffoldBackgroundColor = const Color(0xff283845);
  // static const _textColor = const Color(0xff283845);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CLAIM',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: _scaffoldBackgroundColor,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 96.0,
            letterSpacing: -1.5,
          ),
          headline4: TextStyle(
            fontSize: 34.0,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25,
          ),
          headline5: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.15,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            letterSpacing: 0.25,
          ),
        ).apply(
          bodyColor: _textColor,
          displayColor: _textColor,
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
        // title: Text(
        //   'Home',
        //   style: TextStyle(color: Colors.white),
        //),
        backgroundColor: const Color(0xff3A044F),
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        physics: NeverScrollableScrollPhysics(),
        children: [
          RedeemablePoints(),
          ShopNow(),
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
          fontSize: 48,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.25,
        ),
      ),
    );
  }
}

class ShopNow extends StatefulWidget {
  @override
  _ShopNowState createState() => _ShopNowState();
}

class _ShopNowState extends State<ShopNow> {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      color: Theme.of(context).accentColor,
      title: 'SHOP NOW!',
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            CommonRow(
              title: 'LAZADA',
              text: 'Item Name Here\nPrice Here',
            ),
            SizedBox(height: 10),
            CommonRow(
              title: 'SHOPEE',
              text: 'Item Name Here\nPrice Here',
            ),
            SizedBox(height: 10),
            CommonRow(
              title: 'ZALORA',
              text: 'Item Name Here\nPrice Here',
            ),
            SizedBox(height: 10),
            CommonRow(
              title: 'GRABFOOD',
              text: 'Item Name Here\nPrice Here',
            ),
          ],
        ),
      ),
    );
  }
}

class CommonRow extends StatelessWidget {
  final String title;
  final String text;

  CommonRow({@required this.title, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
      child: IntrinsicHeight(
        child: InkWell(
          splashColor: Colors.white.withAlpha(30),
          onTap: () {},
          child: Row(
            children: <Widget>[
              Container(
                height: 75,
                width: 75,
                child: Card(
                  elevation: 0,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 6,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        this.title,
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        this.text,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
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
                style: Theme.of(context).textTheme.headline5,
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
