import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class CommonRow extends StatelessWidget {
  final String title;
  final String text;

  CommonRow({@required this.title, @required this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white.withAlpha(30),
      onTap: () {},
      child: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                    SizedBox(height: 6),
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

class CommonCard extends StatelessWidget {
  final String title;
  final Widget child;
  final Color color;

  CommonCard(
      {@required this.title, @required this.child, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4,
        color: this.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(8, 8, 8, 15),
          child: Column(
            children: [
              Text(
                this.title,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.center,
              ),
              const Divider(
                endIndent: 0.0,
                height: 20,
                thickness: 5,
              ),
              this.child,
            ],
          ),
        ),
      ),
    );
  }
}

class CommonGridViewCell extends StatelessWidget {
  final String title;
  CommonGridViewCell({@required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white.withAlpha(30),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Column(
          children: <Widget>[
            Container(
              height: 75,
              width: 75,
              child: Card(
                elevation: 0,
              ),
            ),
            SizedBox(width: 10),
            Text(
              this.title,
            ),
          ],
        ),
      ),
    );
  }
}

class TextList extends StatelessWidget {
  final String title;
  final List<String> children;
  TextList({@required this.title, @required this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              this.title,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(height: 6),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: children.length,
            itemBuilder: (context, i) {
              return Text(children[i]);
            },
          ),
        ],
      ),
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const _primaryColor = const Color(0xffFEB437);
  static const _accentColor = const Color(0xffFF7200);
  static const _scaffoldBackgroundColor = const Color(0xffFFFFFF);
  static const _textColor = const Color(0xff3A044F);

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
      home: SelectorScreen(),
    );
  }
}

class SelectorScreen extends StatefulWidget {
  @override
  _SelectorScreenState createState() => _SelectorScreenState();
}

class _SelectorScreenState extends State<SelectorScreen> {
  int _currentIndex = 2;

  List<Widget> _screenList = <Widget>[
    RecycleScreen(key: UniqueKey()),
    NewsScreen(key: UniqueKey()),
    HomeScreen(key: UniqueKey()),
    RedeemScreen(key: UniqueKey()),
    QuestScreen(key: UniqueKey()),
  ];

  void _pushProfile() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return ProfileScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CLAIM',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff3A044F),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.white,
            onPressed: _pushProfile,
          ),
        ],
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      body: PageTransitionSwitcher(
        child: _screenList[_currentIndex],
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff3A044F),
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Recycle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Redeem',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Quests',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30),
      children: [
        RedeemablePoints(),
        ShopNow(),
      ],
    );
  }
}

class RedeemablePoints extends StatelessWidget {
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

class ShopNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      color: Theme.of(context).accentColor,
      title: 'HOT DEALS',
      child: Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CommonRow(
              title: 'LAZADA',
              text: 'Item Name Here\nPrice Here',
            ),
            CommonRow(
              title: 'SHOPEE',
              text: 'Item Name Here\nPrice Here',
            ),
            CommonRow(
              title: 'ZALORA',
              text: 'Item Name Here\nPrice Here',
            ),
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

class RecycleScreen extends StatefulWidget {
  RecycleScreen({Key key}) : super(key: key);

  @override
  _RecycleScreenState createState() => _RecycleScreenState();
}

class _RecycleScreenState extends State<RecycleScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30),
      children: [
        GoogleMap(),
        WasteTrack(),
        WasteHistory(),
        QRScan(),
      ],
    );
  }
}

class GoogleMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'MAP',
      color: Theme.of(context).primaryColor,
      child: Container(
        height: 40,
      ),
    );
  }
}

class WasteTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'TRACK',
      color: Theme.of(context).accentColor,
      child: TextList(
        title: 'SATURDAY, MARCH 13, 2021',
        children: [
          'Waste claimed: March 13 (Sat)',
          'Arrived in brgy. warehouse: March 14 (Sun)',
          'Arrived in main warehouse: March 15 (Mon)',
        ],
      ),
    );
  }
}

class WasteHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'HISTORY',
      color: Theme.of(context).primaryColor,
      child: TextList(
        title: 'PAST COLLECTIONS',
        children: [
          'February 20 - 9kg collected',
          'February 27 - 8kg collected',
          'March 6 - 13kg collected',
        ],
      ),
    );
  }
}

class QRScan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'SCAN',
      color: Theme.of(context).accentColor,
      child: Container(
        height: 40,
      ),
    );
  }
}

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30),
      children: [
        ClaimedWastes(),
        Turnovers(),
        ProductFeature(),
      ],
    );
  }
}

class ClaimedWastes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'CLAIMED WASTES',
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '372273',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'KGS\nSINCE LAUNCH',
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    '2879',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'KGS\nTHIS WEEK',
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Turnovers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      color: Theme.of(context).accentColor,
      title: 'TURNOVERS',
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CommonRow(title: 'WINDER', text: '6150 KGS\nas of March 6, 2021'),
          CommonRow(title: 'ECOBRICK', text: '8500 KGS\nas of March 1, 2021'),
        ],
      ),
    );
  }
}

class ProductFeature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'Product Feature',
      color: Theme.of(context).primaryColor,
      child: CommonRow(
        title: 'ECOBRICK PH',
        text:
            'ECOBRICK PH manufactures bricks made from used plastic bottles, wrappers...',
      ),
    );
  }
}

class RedeemScreen extends StatefulWidget {
  RedeemScreen({Key key}) : super(key: key);
  @override
  _RedeemScreenState createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30),
      children: [
        RedeemablePoints(),
        ShopWithUs(),
      ],
    );
  }
}

class ShopWithUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'SHOP WITH US',
      color: Theme.of(context).accentColor,
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        children: [
          CommonGridViewCell(title: 'SHOPEE'),
          CommonGridViewCell(title: 'ZALORA'),
          CommonGridViewCell(title: 'LAZADA'),
          CommonGridViewCell(title: 'GRAB'),
          CommonGridViewCell(title: 'FOODPANDA'),
          CommonGridViewCell(title: 'SHEIN'),
          CommonGridViewCell(title: 'WATSONS'),
          CommonGridViewCell(title: 'NIKE'),
          CommonGridViewCell(title: 'ADIDAS'),
        ],
      ),
    );
  }
}

class QuestScreen extends StatefulWidget {
  QuestScreen({Key key}) : super(key: key);
  @override
  _QuestScreenState createState() => _QuestScreenState();
}

class _QuestScreenState extends State<QuestScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(30),
      children: [
        ReferFriend(),
        WatchAd(),
        ComingSoon(),
      ],
    );
  }
}

class ReferFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'REFER TO A FRIEND',
      color: Theme.of(context).primaryColor,
      child: CommonRow(
        title: 'EARN 2 POINTS',
        text: 'Refer a friend using your QR code or the link unique to you.',
      ),
    );
  }
}

class WatchAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'REFER TO A FRIEND',
      color: Theme.of(context).primaryColor,
      child: CommonRow(
        title: 'EARN 1 POINT',
        text:
            'Tap on the play button to watch an ad prepared by one of our sponsors!',
      ),
    );
  }
}

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'COMING SOON...',
      color: Theme.of(context).accentColor,
      child: InkWell(
        splashColor: Colors.white.withAlpha(30),
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
          child: Text(
            'We will notify you when a new opportunity arises! For now, you can TAP HERE, to see what you can redeem with your points!',
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('f'),
        ),
        body: ListView(
          padding: EdgeInsets.all(30),
          children: [
            YourAccount(),
            // FrequentlyAsked(),
            ContactUs(),
          ],
        ));
  }
}

class YourAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'YOUR ACCOUNT',
      color: Theme.of(context).primaryColor,
      child: CommonRow(
        title: 'ACCOUNT DETAILS',
        text: 'Juan Dela Cruz\n09771843927\njuanitodc@email.com',
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'CONTACT US',
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
        child: Text(
          'For any questions or concerns, please email us at claim@sales.com',
        ),
      ),
    );
  }
}
