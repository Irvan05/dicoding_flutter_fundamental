import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental_dicoding/cupertino_home.dart';
import 'package:flutter_fundamental_dicoding/dicoding_news_app/article_detail_page.dart';
import 'package:flutter_fundamental_dicoding/dicoding_news_app/article_list_page.dart';
import 'package:flutter_fundamental_dicoding/internet_things/internet_things.dart';
import 'package:flutter_fundamental_dicoding/localization/example_page.dart';
import 'package:flutter_fundamental_dicoding/models/article.dart';
import 'package:flutter_fundamental_dicoding/scheduling/scheduling_page.dart';
import 'package:flutter_fundamental_dicoding/ui_design/calculator.dart';
import 'package:flutter_fundamental_dicoding/ui_design/cupertino_adaptive.dart';
import 'package:flutter_fundamental_dicoding/ui_design/explicit_animation.dart';
import 'package:flutter_fundamental_dicoding/ui_design/gesture_detector.dart';
import 'package:flutter_fundamental_dicoding/ui_design/implicit_animation.dart';
import 'package:flutter_fundamental_dicoding/typography/lorem_ipsum_app.dart';
import 'package:flutter_fundamental_dicoding/typography/text_theme.dart';
import 'package:flutter_fundamental_dicoding/ui_design/learning_path.dart';
import 'package:flutter_fundamental_dicoding/ui_design/pixel_page.dart';
import 'dicoding_news_app/article_detail_offline.dart';
import 'dicoding_news_app/article_web.dart';
import 'models/articleOffline.dart';
import 'dicoding_news_app/news_list.dart';
import 'navigation_and_routing/another_screen.dart';
import 'navigation_and_routing/first_screen.dart';
import 'navigation_and_routing/return_data_screen.dart';
import 'navigation_and_routing/second_screen.dart';
import 'navigation_and_routing/second_screen_with_data.dart';

import 'navigation_and_routing/replacement_screen.dart';
import 'common/styles.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  bool isIosHome = false;

  @override
  Widget build(BuildContext context) {
    return isIosHome
        ? CupertinoApp(
            theme: const CupertinoThemeData(
              primaryColor: CupertinoColors.systemOrange,
            ),
            home: HomePage(),
          )
        : MaterialApp(
            // title: 'Flutter Demo',
            // localizationsDelegates: const [
            //   AppLocalizations.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            // supportedLocales: const [
            //   Locale('id', ''),
            //   Locale('en', ''),
            // ],
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: myTextTheme2,
              appBarTheme: AppBarTheme(elevation: 0),
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: primaryColor,
                    onPrimary: Colors.black,
                    secondary: secondaryColor,
                  ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryColor,
                    foregroundColor: Colors.white,
                    textStyle: const TextStyle(),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                    )),
              ),
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => MyHomePage(),
              //
              '/navigation_and_routing/first_screen': (context) =>
                  const FirstScreen(),
              '/navigation_and_routing/second_screen': (context) =>
                  const SecondScreen(),
              '/navigation_and_routing/second_screen_with_data': (context) =>
                  SecondScreenWithData(
                      ModalRoute.of(context)?.settings.arguments as String),
              '/navigation_and_routing/return_data_screen': (context) =>
                  ReturnDataScreen(),
              '/navigation_and_routing/replacement_screen': (context) =>
                  ReplacementScreen(),
              '/navigation_and_routing/another_screen': (context) =>
                  AnotherScreen(),
              //
              NewsListPage.routeName: (context) => const NewsListPage(),
              ArticleDetailOfflinePage.routeName: (context) =>
                  ArticleDetailOfflinePage(
                      article: ModalRoute.of(context)?.settings.arguments
                          as ArticleOffline),
              ArticleWebView.routeName: (context) => ArticleWebView(
                  url: ModalRoute.of(context)?.settings.arguments as String),
              LoremIpsumApp.routeName: (context) => LoremIpsumApp(),
              GestureDetectorPage.routeName: (context) => GestureDetectorPage(),
              CalculatorPage.routeName: (context) => CalculatorPage(),
              AnimationPage.routeName: (context) => AnimationPage(),
              ExplicitAnimationPage.routeName: (context) =>
                  ExplicitAnimationPage(),
              PixelPage.routeName: (context) => const PixelPage(),
              LearningPathPage.routeName: (context) => const LearningPathPage(),
              AdaptivePage.routeName: (context) => AdaptivePage(),
              ExamplePage.routeName: (context) => ExamplePage(),
              InternetThingsPage.routeName: (context) => InternetThingsPage(),
              ArticleDetailPage.routeName: (context) => ArticleDetailPage(
                    article:
                        ModalRoute.of(context)?.settings.arguments as Article,
                  ),
              ArticleListPage.routeName: (context) => ArticleListPage(),
              SchedulingPage.routeName: (context) => SchedulingPage(),
            },
          );
  }
}

class MyHomePage extends StatelessWidget {
  // var title;

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleApp),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SchedulingPage.routeName);
                  },
                  child: Text('SchedulingPage')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, InternetThingsPage.routeName);
                  },
                  child: Text('Internet things')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ExamplePage.routeName);
                  },
                  child: Text('Localization')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, '/navigation_and_routing/first_screen');
                  },
                  child: Text('Navigation and Routing')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, NewsListPage.routeName);
                  },
                  child: Text('Latihan News App')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoremIpsumApp.routeName);
                  },
                  child: Text('Lorem Ipsum App')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, GestureDetectorPage.routeName);
                  },
                  child: Text('GestureDetectorPage')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CalculatorPage.routeName);
                  },
                  child: Text('Calculator')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AnimationPage.routeName);
                  },
                  child: Text('implicit animation')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ExplicitAnimationPage.routeName);
                  },
                  child: Text('explicit animation')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PixelPage.routeName);
                  },
                  child: Text('sliver')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LearningPathPage.routeName);
                  },
                  child: Text('latihan sliver list')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AdaptivePage.routeName);
                  },
                  child: Text('adaptive cupertino')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
