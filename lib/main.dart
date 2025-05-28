import 'package:imthon3/utils/main_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await initializeNotifications();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('uz'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthLocalDatasorce();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangePhotoViewmodel()),
        ChangeNotifierProvider(create: (context) => BottomViewmodel()),
        ChangeNotifierProvider(
          create: (context) => AuthViewmodel(authRepository: authRepository),
        ),
        ChangeNotifierProvider(create: (context) => ProfileViewmode()),
      ],
      child: AdaptiveTheme(
        initial: AdaptiveThemeMode.system,
        light: ThemeData(brightness: Brightness.light),
        dark: ThemeData(brightness: Brightness.dark),
        builder: (light, dark) {
          return MaterialApp(
            theme: light,
            darkTheme: dark,
            debugShowCheckedModeBanner: false,
            home: Splash(),
            locale: context.locale,
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
          );
        },
      ),
    );
  }
}
