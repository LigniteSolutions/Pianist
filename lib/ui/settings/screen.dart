import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import '../../plugins/url_launcher/url_launcher.dart';

const app_id = 'ca-app-pub-4736121929543291~2827766405';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void dispose() {
    // myad?.dispose();
    myInterstitial.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
    return Scaffold(
      appBar: AppBar(
        title: Text('General'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Developers'),
              subtitle: Text('Developers Info'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SettingsSubView(
                          title: 'About',
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.web),
                              title: Text('Website'),
                              subtitle: Text('lignitesolutions.com'),
                              onTap: () => UrlUtils.open(
                                  'http://lignitesolutions.com',
                                  name: 'Website'),
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.twitter),
                              title: Text('Twitter'),
                              subtitle: Text('@LigniteOfficial'),
                              onTap: () => UrlUtils.open(
                                  'https://twitter.com/LigniteOfficial',
                                  name: 'Twitter'),
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.instagram),
                              title: Text('Instagram'),
                              subtitle: Text('@ligniteofficial'),
                              onTap: () => UrlUtils.open(
                                  'https://www.instagram.com/ligniteofficial',
                                  name: 'Instagram'),
                            ),
                            ListTile(
                              leading: Icon(FontAwesomeIcons.facebook),
                              title: Text('Facebook'),
                              subtitle: Text('@LigniteOfficial'),
                              onTap: () => UrlUtils.open(
                                  'https://www.facebook.com/LigniteOfficial',
                                  name: 'Facebook'),
                            ),
                          ],
                        )));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// BannerAd myad = BannerAd(
//   adUnitId: "ca-app-pub-4736121929543291/2077791517",
//   size: AdSize.smartBanner,
//   targetingInfo: targetingInfo,
//   listener: (MobileAdEvent event) {},
// );
InterstitialAd myInterstitial = InterstitialAd(
  adUnitId: "ca-app-pub-4736121929543291/7040976605",
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {},
);

class SettingsSubView extends StatefulWidget {
  SettingsSubView({
    @required this.children,
    this.title = 'Settings',
  });
  final String title;
  final List<Widget> children;

  @override
  _SettingsSubViewState createState() => _SettingsSubViewState();
}

class _SettingsSubViewState extends State<SettingsSubView> {
  // @override
  // void initState() {
  //   super.initState();
  //   myad
  //     ..load().then((loaded) {
  //       if (loaded && this.mounted) {
  //         myad..show();
  //       }
  //     });
  // }

  @override
  void dispose() {
    // myad?.dispose();
    int2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int2
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
    // myad
    // typically this happens well before the ad is shown
    // ..load()
    // ..show(
    // Positions the banner ad 60 pixels from the bottom of the screen
    // anchorOffset: 60.0,
    // Positions the banner ad 10 pixels from the center of the screen to the right
    // horizontalCenterOffset: 10.0,
    // Banner Position
    // anchorType: AnchorType.bottom,
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(children: widget.children),
      ),
    );
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['apps', 'games'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male,
  testDevices: <String>[],
);
InterstitialAd int2 = InterstitialAd(
  adUnitId: "ca-app-pub-4736121929543291/5428797449",
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("InterstitialAd event is $event");
  },
);
