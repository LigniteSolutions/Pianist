import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'data/blocs/blocs.dart';
import 'generated/i18n.dart';
import 'plugins/desktop/desktop.dart';
import 'ui/home/screen.dart';
import 'ui/theme.dart';

const app_id = 'ca-app-pub-4736121929543291~2827766405';
void main() {
  setTargetPlatformForDesktop();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _settingsBloc = SettingsBloc();

  @override
  void initState() {
    _settingsBloc.dispatch(CheckSettings());
    super.initState();
  }

  @override
  void dispose() {
    _settingsBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: app_id);
    myBanner = BannerAd(
        adUnitId: 'ca-app-pub-4736121929543291/5697472323',
        size: AdSize.smartBanner,
        targetingInfo: targetingInfo,
        listener: (event) {
          if (event == MobileAdEvent.loaded) {
            myBanner.show(anchorOffset: 0.0, anchorType: AnchorType.top);
          }
        })
      ..load();
    final i18n = I18n.delegate;
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(builder: (_) => _settingsBloc),
      ],
      child: BlocListener<SettingsBloc, SettingsState>(
        listener: (context, state) {
          if (state is SettingsReady) {
            I18n.locale = state.settings.locale;
          }
        },
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, settingState) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:
                settingState is SettingsReady && settingState.settings.darkMode
                    ? ThemeUtils.dark
                    : ThemeUtils.light,
            darkTheme: settingState is SettingsReady &&
                    settingState.settings.useSystemSetting
                ? ThemeUtils.dark
                : null,
            home: HomeScreen(),
            onGenerateTitle: (context) => I18n.of(context).title,
            locale: settingState is SettingsReady
                ? settingState.settings.locale
                : Locale("en", "US"),
            localizationsDelegates: [
              i18n,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: i18n.supportedLocales,
            localeResolutionCallback: i18n.resolution(
              fallback: settingState is SettingsReady
                  ? settingState.settings.locale
                  : Locale("en", "US"),
            ),
          ),
        ),
      ),
    );
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male,
  testDevices: <String>[],
);
BannerAd myBanner = BannerAd(
  adUnitId: 'ca-app-pub-4736121929543291/5697472323',
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {},
);
