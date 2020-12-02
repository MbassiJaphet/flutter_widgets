import 'package:flutter/material.dart';
import 'drawer.dart';
import 'package:flutter_widgets/routes/home/home.dart';

void main() => runApp(CatalogApp());

class CatalogApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  CatalogAppState createState() => CatalogAppState();
}

class CatalogAppState extends State<CatalogApp> {
  static final home_page_widget = HomePage();
  final home_page = (settings) => MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => home_page_widget,
      fullscreenDialog: true,
    );
  @override
  Widget build(BuildContext context) {
    BottomNavigationDrawer.build(drawer_items);
    return MaterialApp(
      title: 'Widget Catalog',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _getRoute,
    );
  }
  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name == '/settings') {
      return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => Text('Settings'),
      fullscreenDialog: true,
      );
    }

    return home_page(settings);
  }

}

var drawer_items = <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0),
                        ),
                        color: Color(0xFFe1f5fe).withOpacity(0.5)
                      ),
                      child: Center(
                        heightFactor: 2,
                        child: Row(children: <Widget>[Spacer(),FlutterLogo(),Text('Widget Catalog',style: TextStyle(fontSize: 26)),Spacer()])
                      ),
                    ),
                        Divider(),
                        DrawerItem(name: 'Widget Catalog',icon: Icons.home,selected: true, route: '/home'),
                        DrawerItem(name: 'Shrine App',icon: Icons.shopping_cart, route: null, trailing: null),
                        DrawerItem(name: 'Notifications',icon: Icons.notifications,  route: null, trailing: '46'),
                        Divider(indent: 80),
                        DrawerItem(name: 'Settings',icon: Icons.settings, route: '/settings', trailing: null),
                        Divider(indent: 80),
                        DrawerItem(name: 'Help',icon: Icons.help,  route: null, trailing: null),
                        DrawerItem(name: 'About us',icon: Icons.info, route: null, trailing: null),
                        DrawerItem(name: 'Share',icon: Icons.share, route: null, trailing: null),
                        SizedBox(height: 24,)
                        ];
