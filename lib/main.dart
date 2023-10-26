import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Layout/SplashScreen.dart';
import 'Layout/homescreen.dart';
import 'Shared/styles/myThemeData.dart';
import 'preference_helper.dart';
import 'providers/my_provider.dart';
import 'tabs/News_Article_Item.dart';
import 'tabs/settings/Settings_Tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PrefsHelper.prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      create: (context) =>
      MyProvider()
        ..init(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) =>
          MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(pro.languageCode),
            debugShowCheckedModeBanner: false,
            initialRoute: HomeLayout.routeName,
            routes: {
              SplashScreen.routeName: (context) => const SplashScreen(),
              HomeLayout.routeName: (context) => const HomeLayout(),
              SettingsTab.routeName: (context) => const SettingsTab(),
              NewsArticleItem.routeName: (context) => const NewsArticleItem(),
            },
            theme: MyThemeData.lightTheme,
            themeMode: ThemeMode.light,
          ),
    );
  }
}
