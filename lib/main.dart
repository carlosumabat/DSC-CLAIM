import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

class CommonRow extends StatelessWidget {
  final String title;
  final String text;
  final Image image;

  CommonRow({@required this.title, @required this.text, @required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color(0x1eb39b30),
      onTap: () {},
      child: IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Row(
            children: <Widget>[
              Container(
                height: 75,
                width: 75,
                child: this.image,
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
  final int colorNumber;

  CommonCard(
      {@required this.title, @required this.child, @required this.colorNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 4,
        color: (this.colorNumber == 0)
            ? const Color(0xfffce6a4)
            : const Color(0xffefdaa9),
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
  final Image image;
  CommonGridViewCell({@required this.title, @required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color(0x1eb39b30),
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(top: 5),
        child: Column(
          children: <Widget>[
            Container(
              height: 75,
              width: 75,
              child: this.image,
            ),
            SizedBox(width: 10),
            Text(
              this.title,
              style: TextStyle(fontWeight: FontWeight.bold),
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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const _primaryColor = const Color(0xfff6c143);
  static const _accentColor = const Color(0xffFF7200);
  static const _scaffoldBackgroundColor = const Color(0xffFFFFFF);
  static const _textColor = const Color(0xff2b3844);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CLAIM',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: _scaffoldBackgroundColor,
        fontFamily: 'Nunito',
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
            fontFamily: 'Montserrat',
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
        centerTitle: true,
        title: Text(
          'CLAIM',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Montserrat',
            fontSize: 34,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            color: Colors.white,
            iconSize: 34,
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
        backgroundColor: const Color(0xffb7b091),
        selectedItemColor: const Color(0xffffffff),
        unselectedItemColor: const Color(0xff2b3844),
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
      colorNumber: 0,
      title: 'REDEEMABLE POINTS',
      child: Text(
        '129.00',
        style: TextStyle(
          fontFamily: 'Montserrat',
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
      colorNumber: 1,
      title: 'HOT DEALS',
      child: Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            CommonRow(
              title: 'LAZADA',
              text: 'Item Name Here\nPrice Here',
              image: Image.asset('assets/images/lazada-logo.png'),
            ),
            CommonRow(
              title: 'SHOPEE',
              text: 'Item Name Here\nPrice Here',
              image: Image.asset('assets/images/shopee-logo.png'),
            ),
            CommonRow(
              title: 'ZALORA',
              text: 'Item Name Here\nPrice Here',
              image: Image.asset('assets/images/zalora-logo.png'),
            ),
            CommonRow(
              title: 'GRABFOOD',
              text: 'Item Name Here\nPrice Here',
              image: Image.asset('assets/images/grabfood-logo.png'),
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
      colorNumber: 0,
      child: Container(
        height: 40,
        child: Center(
          child: Text('Coming soon...'),
        ),
      ),
    );
  }
}

class WasteTrack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'TRACK',
      colorNumber: 1,
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
      colorNumber: 0,
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
      colorNumber: 1,
      child: Center(
        child: Image.asset(
          'assets/images/qr_code.png',
          scale: 1,
        ),
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
      colorNumber: 0,
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
                      fontFamily: 'Montserrat',
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
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
                      fontFamily: 'Montserrat',
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
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
      colorNumber: 1,
      title: 'TURNOVERS',
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          CommonRow(
            title: 'WINDER',
            text: '6150 KGS\nas of March 6, 2021',
            image: Image.asset('assets/images/winder-logo.png'),
          ),
          CommonRow(
            title: 'ECOBRICK',
            text: '8500 KGS\nas of March 1, 2021',
            image: Image.asset('assets/images/ecobrick-logo.png'),
          ),
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
      colorNumber: 0,
      child: CommonRow(
        title: 'ECOBRICK PH',
        text:
            'ECOBRICK PH manufactures bricks made from used plastic bottles, wrappers...',
        image: Image.asset('assets/images/ecobrick-logo.png'),
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
      colorNumber: 1,
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        children: [
          CommonGridViewCell(
            title: 'SHOPEE',
            image: Image.asset('assets/images/shopee-logo.png'),
          ),
          CommonGridViewCell(
            title: 'ZALORA',
            image: Image.asset(
              'assets/images/zalora-logo.png',
            ),
          ),
          CommonGridViewCell(
            title: 'LAZADA',
            image: Image.asset(
              'assets/images/lazada-logo.png',
            ),
          ),
          CommonGridViewCell(
            title: 'GRAB',
            image: Image.asset(
              'assets/images/grab-logo.png',
            ),
          ),
          CommonGridViewCell(
            title: 'FOODPANDA',
            image: Image.asset(
              'assets/images/foodpanda-logo.png',
            ),
          ),
          CommonGridViewCell(
            title: 'SHEIN',
            image: Image.asset(
              'assets/images/shein-logo.png',
            ),
          ),
          CommonGridViewCell(
            title: 'WATSONS',
            image: Image.asset(
              'assets/images/watsons-logo.png',
            ),
          ),
          CommonGridViewCell(
            title: 'NIKE',
            image: Image.asset(
              'assets/images/nike-logo.png',
            ),
          ),
          CommonGridViewCell(
            title: 'ADIDAS',
            image: Image.asset('assets/images/adidas-logo.png'),
          ),
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
      colorNumber: 0,
      child: CommonRow(
        title: 'EARN 2 POINTS',
        text: 'Refer a friend using your QR code or the link unique to you.',
        image: Image.asset('assets/images/qr-code-mini.png'),
      ),
    );
  }
}

class WatchAd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'REFER TO A FRIEND',
      colorNumber: 1,
      child: CommonRow(
        title: 'EARN 1 POINT',
        text:
            'Tap on the play button to watch an ad prepared by one of our sponsors!',
        image: Image.asset('assets/images/play-button.png'),
      ),
    );
  }
}

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'COMING SOON...',
      colorNumber: 0,
      child: InkWell(
        splashColor: const Color(0x1eb39b30),
        onTap: () {},
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
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.white),
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
      colorNumber: 0,
      child: CommonRow(
        title: 'ACCOUNT DETAILS',
        text: 'Juan Dela Cruz\n09771843927\njuanitodc@email.com',
        image: Image.asset('assets/images/profile-pic.png'),
      ),
    );
  }
}

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonCard(
      title: 'CONTACT US',
      colorNumber: 1,
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
        child: Text(
          'For any questions or concerns, please email us at claim@sales.com',
        ),
      ),
    );
  }
}
