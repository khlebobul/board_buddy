import 'library.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PreferencesService.getLanguageCode(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container();
        } else {
          return MaterialApp(
            routes: {
              '/about': (context) => const AboutScreen(),
              '/games': (context) => const GamesScreen(),
              '/rules': (context) => const RulesScreen(),
              '/settings': (context) => const SettingsScreen(),
            },
            debugShowCheckedModeBanner: false,
            theme: UIThemes.lightTheme(),
            //home: const MyHomePage(title: 'Board Buddy'),
            home: const SplashScreen(),
            locale: Locale(snapshot.data ?? 'en'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('ru', ''),
            ],
          );
        }
      },
    );
  }
}
