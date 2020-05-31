import 'package:E_Soor/helpers/logic/constants.dart';
import 'package:E_Soor/helpers/sharedPrefs.dart';
import 'package:E_Soor/models/selection.dart';
import 'package:E_Soor/services/facebook.auth.dart';
import 'package:E_Soor/services/firebase.auth.dart';
import 'package:E_Soor/services/google.auth.dart';
import 'package:E_Soor/ui/screens/splash_screen/splash_screen.dart';
import 'package:E_Soor/ui/widgets/hiddenDrawer.dart';
import 'package:E_Soor/ui/widgets/mainBody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:E_Soor/models/theme.dart';
import 'package:provider/single_child_widget.dart';

//flutter build ios && tar -zcf build/app.ipa build/ios/iphoneos/Runner.app && ls -lh build/app.ipa

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefsUtils.init();
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  var isDarkTheme = prefs.getBool(SharedPreferencesKeys.isDarkTheme);
  final SharedPrefsUtils _sharedPrefs = SharedPrefsUtils.getInstance();
  var isDarkTheme = _sharedPrefs.getData(SharedPreferencesKeys.isDarkTheme);
  ThemeData theme;
  if (isDarkTheme != null) {
    theme = isDarkTheme ? Constants.kDarkTheme : Constants.kLightTheme;
  } else {
    theme = Constants.kDarkTheme;
  }

  //You can add your providers as a list
  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ThemeNotifier>(
          create: (_) => ThemeNotifier(theme),
        ),
        ChangeNotifierProvider<SelectionNotifier>(
          create: (_) => SelectionNotifier(),
        ),
        Provider<FirebaseAuthService>(
          create: (_) => FirebaseAuthService(),
        ),
        Provider<GoogleAuthService>(
          create: (_) => GoogleAuthService(),
        ),
        Provider<FacebookAuthService>(
          create: (_) => FacebookAuthService(),
        ),
      ],
      child: Constants(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Soor',
      theme: themeData(context),
      home: MySplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        theme: themeData(context),
        title: "E-Soor",
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: HiddenDrawer(
            child: MainBody(),
          ),
        ),
      ),
    );
  }
}

ThemeData themeData(context) {
  final themeNotifier = Provider.of<ThemeNotifier>(context);
  return themeNotifier.getTheme();
}
