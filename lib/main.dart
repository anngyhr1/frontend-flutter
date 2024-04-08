import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:ebooks/config/app_config.dart' as config;
import 'package:ebooks/route_generator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Color(0xFF252525),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF2C2C2C),
        accentColor: config.Colors().mainDarkColor(1),
        hintColor: config.Colors().secondDarkColor(1),
        focusColor: config.Colors().accentDarkColor(1),
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 20.0, color: config.Colors().secondDarkColor(1)),
          headline6: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: config.Colors().secondDarkColor(1)),
          headline5: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: config.Colors().secondDarkColor(1)),
          headline4: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              color: config.Colors().mainDarkColor(1)),
          headline3: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.w300,
              color: config.Colors().secondDarkColor(1)),
          subtitle1: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: config.Colors().secondDarkColor(1)),
          subtitle2: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: config.Colors().mainDarkColor(1)),
          bodyText1: TextStyle(
              fontSize: 12.0, color: config.Colors().secondDarkColor(1)),
          caption: TextStyle(
              fontSize: 12.0, color: config.Colors().secondDarkColor(0.6)),
        ),
      ),
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp(
        // title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        // home: MyHomePage(onChanged: onChanged),
        title: 'E-Book',
        initialRoute: '/OnBoarding',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );

    // MaterialApp(
    //   title: 'E-Book',
    //   initialRoute: '/OnBoarding',
    //   onGenerateRoute: RouteGenerator.generateRoute,
    //   debugShowCheckedModeBanner: false,
    //   //theme: theme,
    // );
    // return DynamicTheme(
    //     defaultBrightness: Brightness.dark,
    //     data: (brightness) {
    //       if (brightness == Brightness.light) {
    //         return ThemeData(
    //           fontFamily: 'Poppins',
    //           primaryColor: Colors.white,
    //           brightness: brightness,
    //           accentColor: config.Colors().mainColor(1),
    //           focusColor: config.Colors().accentColor(1),
    //           hintColor: config.Colors().secondColor(1),
    //           textTheme: TextTheme(
    //             headline: TextStyle(
    //                 fontSize: 20.0, color: config.Colors().secondColor(1)),
    //             display1: TextStyle(
    //                 fontSize: 18.0,
    //                 fontWeight: FontWeight.w600,
    //                 color: config.Colors().secondColor(1)),
    //             display2: TextStyle(
    //                 fontSize: 20.0,
    //                 fontWeight: FontWeight.w600,
    //                 color: config.Colors().secondColor(1)),
    //             display3: TextStyle(
    //                 fontSize: 22.0,
    //                 fontWeight: FontWeight.w700,
    //                 color: config.Colors().mainColor(1)),
    //             display4: TextStyle(
    //                 fontSize: 22.0,
    //                 fontWeight: FontWeight.w300,
    //                 color: config.Colors().secondColor(1)),
    //             subhead: TextStyle(
    //                 fontSize: 15.0,
    //                 fontWeight: FontWeight.w500,
    //                 color: config.Colors().secondColor(1)),
    //             title: TextStyle(
    //                 fontSize: 16.0,
    //                 fontWeight: FontWeight.w600,
    //                 color: config.Colors().mainColor(1)),
    //             subtitle: TextStyle(
    //                 fontSize: 14.0,
    //                 fontWeight: FontWeight.w500,
    //                 color: config.Colors().secondColor(1)),
    //             body1: TextStyle(
    //                 fontSize: 12.0, color: config.Colors().secondColor(1)),
    //             body2: TextStyle(
    //                 fontSize: 14.0, color: config.Colors().secondColor(1)),
    //             caption: TextStyle(
    //                 fontSize: 12.0, color: config.Colors().accentColor(1)),
    //           ),
    //         );
    //       } else {
    //         return ThemeData(
    //           fontFamily: 'Poppins',
    //           primaryColor: Color(0xFF252525),
    //           brightness: Brightness.dark,
    //           scaffoldBackgroundColor: Color(0xFF2C2C2C),
    //           accentColor: config.Colors().mainDarkColor(1),
    //           hintColor: config.Colors().secondDarkColor(1),
    //           focusColor: config.Colors().accentDarkColor(1),
    //           textTheme: TextTheme(
    //             headline: TextStyle(
    //                 fontSize: 20.0, color: config.Colors().secondDarkColor(1)),
    //             display1: TextStyle(
    //                 fontSize: 18.0,
    //                 fontWeight: FontWeight.w600,
    //                 color: config.Colors().secondDarkColor(1)),
    //             display2: TextStyle(
    //                 fontSize: 20.0,
    //                 fontWeight: FontWeight.w600,
    //                 color: config.Colors().secondDarkColor(1)),
    //             display3: TextStyle(
    //                 fontSize: 22.0,
    //                 fontWeight: FontWeight.w700,
    //                 color: config.Colors().mainDarkColor(1)),
    //             display4: TextStyle(
    //                 fontSize: 22.0,
    //                 fontWeight: FontWeight.w300,
    //                 color: config.Colors().secondDarkColor(1)),
    //             subhead: TextStyle(
    //                 fontSize: 15.0,
    //                 fontWeight: FontWeight.w500,
    //                 color: config.Colors().secondDarkColor(1)),
    //             title: TextStyle(
    //                 fontSize: 16.0,
    //                 fontWeight: FontWeight.w600,
    //                 color: config.Colors().mainDarkColor(1)),
    //             subtitle: TextStyle(
    //                 fontSize: 14.0,
    //                 fontWeight: FontWeight.w500,
    //                 color: config.Colors().secondDarkColor(1)),
    //             body1: TextStyle(
    //                 fontSize: 12.0, color: config.Colors().secondDarkColor(1)),
    //             body2: TextStyle(
    //                 fontSize: 14.0, color: config.Colors().secondDarkColor(1)),
    //             caption: TextStyle(
    //                 fontSize: 12.0,
    //                 color: config.Colors().secondDarkColor(0.6)),
    //           ),
    //         );
    //       }
    //     },
    //     themedWidgetBuilder: (context, theme) {
    //       return MaterialApp(
    //         title: 'E-Book',
    //         initialRoute: '/OnBoarding',
    //         onGenerateRoute: RouteGenerator.generateRoute,
    //         debugShowCheckedModeBanner: false,
    //         theme: theme,
    //       );
    //     });
  }
}
