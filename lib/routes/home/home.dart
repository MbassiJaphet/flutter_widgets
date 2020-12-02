import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widgets/drawer.dart';
import 'package:flutter_widgets/supplemental/sectionview.dart';
import 'package:flutter_widgets/widget_catalog.dart';

import '../../widget_catalog.dart' as WidgetCatalog;
import '../../widget_card.dart';


ScrollController _hideButtonController = new ScrollController();


class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  static final TextStyle title_style = TextStyle(color: Colors.grey, fontSize: 18,);
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
    Color appbar_icon_color = Color(0xFF757575);
    SectionView sectionView;
    bool _isVisible = true;

  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xFF353662),
      body: sectionView,
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: _isVisible ? 56.0 : 0.0,
        child: getBottomAppBar()
      ),
    );
    //return AnimationDemoHome();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Color(0xFFffffff),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: _isVisible ? 56.0 : 0.0,
        child: getBottomAppBar()
      ),
      floatingActionButton: _isVisible
          ? FloatingActionButton(child: Icon(Icons.add,size: 36,),backgroundColor: Colors.white,foregroundColor: Color(0xFFd81b60), onPressed: ()=>{})
          :null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }

  @override
  void initState() {
    super.initState();
    sectionView = SectionView(
        secionCardXPaddingFraction: 0.2,
        sectionTitleRowYTranslate: -5,
        iconRowYTranslate: 5,
        sections: sections,
        iconOpacity: 0.5,
        onAppBarCollapsed: ()=>{print('Collapsed\n')},
        onAppBarExpanded: (){print('Expanded\n');},
      );
    _isVisible = true && !sectionView.appBarIsExpanded;
    //_hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
        });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true && !sectionView.appBarIsExpanded;
        });
      }
    });

  }

  _hideBottomAppBar(){
    print('fuck\n');
  }


Container getAppBar(){
  return Container(
    padding: EdgeInsets.fromLTRB(3.5, 32, 3.5, 0),
    child: Material(
      elevation: 1,
      borderRadius: BorderRadius.all(Radius.circular(5)),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.search), color: Colors.grey, onPressed: ()=>{}),
          SizedBox(width: 10),
          Text('"Search Widgets"',style: TextStyle(color: Colors.grey, fontSize: 16)),
          Spacer(),
          CircleAvatar(
            radius: 18,
            child: InkWell(
              onTap: ()=>{},
              child: Icon(Icons.person,color: Color(0xFFbbdefb)),
            ),
            backgroundColor: Color(0xFF003c8f),
          ),
          SizedBox(width: 10),
        ],
      ),
    ),
  );
}

Padding getBody(){
  return Padding(
    padding: EdgeInsets.only(left: 8, right: 8),
    child: CustomScrollView(
    controller: _hideButtonController,
    slivers: <Widget>[
      SliverAppBar(
        snap: true,
        expandedHeight: 56,
        elevation: 0,
        floating: true,
        backgroundColor: Color(0x00000000),
        primary: true,
        flexibleSpace: getAppBar(),
      ),
      getWidgetCatalog()
    ],
  ),
  );
}

BottomAppBar getBottomAppBar(){
  return 
    BottomAppBar(
          elevation: 5,
          //shape: CircularNotchedRectangle(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            height: 56.0,
          child: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.menu),color: appbar_icon_color, onPressed: ()=>{BottomNavigationDrawer.open(context)}),
              IconButton(icon: Icon(Icons.tune),color: appbar_icon_color, onPressed: ()=>{}),
              IconButton(icon: Icon(Icons.search),color: appbar_icon_color, onPressed: ()=>{}),
              Spacer(),
              IconButton(icon: Icon(Icons.more_vert),color: appbar_icon_color, onPressed: ()=>{})
            ],
          )
          ),
        );
}

}
//----------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------
var sections = <Section>[
  Section(
    title: 'BASICS',
    icon: Icon(Icons.open_in_new,size: 20,color: Colors.white,),
    card: SectionCard(
      title: 'Basics',
      backgroundAsset: 'assets/sections/basics.png',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: Scrollbar(
            child: GridView.extent(
            controller: _hideButtonController,
            key: PageStorageKey('basics'),
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            maxCrossAxisExtent: 180,
            childAspectRatio: 7.0 / 10.0,
            children: getWidgetsCards(category: WidgetCategory.Basics),
          ),
       )
    ),
    onSelected: ()=>{print('Basics\n')}
  ),
  Section(
    title: 'CUPERTINO',
    icon: Padding(padding: EdgeInsets.only(top: 1),child: Icon(Icons.desktop_mac,size: 20,color: Colors.white)),
    card: SectionCard(
      title: 'Cupertino',
      backgroundAsset: 'assets/sections/logo-apple.jpg',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: Scrollbar(
            child: GridView.extent(
            controller: _hideButtonController,
            key: PageStorageKey('cupertino'),
            mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            maxCrossAxisExtent: 180,
            childAspectRatio: 7.0 / 10.0,
            children: getWidgetsCards(category: WidgetCategory.Cupertino),
          ),
          )
    ),
    onSelected: ()=>{print('Cupertino\n')}
  ),
  Section(
    title: 'MATERIAL',
    icon: Padding(padding: EdgeInsets.only(top: 3),child: Icon(Icons.android,size: 17,color: Colors.white)),
    card: SectionCard(
      title: 'Material',
      backgroundAsset: 'assets/sections/mio-design.png',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: Scrollbar(
            child: GridView.extent(
            key: PageStorageKey('material'),
            controller: _hideButtonController,
            mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            maxCrossAxisExtent: 180,
            childAspectRatio: 7.0 / 10.0,
            children: getWidgetsCards(category: WidgetCategory.Material_Components),
          ),
      )
    ),
    onSelected: ()=>{print('Material\n')}

  ),
  Section(
    title: 'LAYOUT',
    icon: Padding(padding: EdgeInsets.only(bottom: 10),child: Icon(Icons.view_module, size: 21,color: Colors.white)),
    card: SectionCard(
      title: 'Layout',
      backgroundAsset: 'assets/sections/layout.png',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: Scrollbar(
            child: GridView.extent(
            key: PageStorageKey('layout'),
            controller: _hideButtonController,
            mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            maxCrossAxisExtent: 180,
            childAspectRatio: 7.0 / 10.0,
            children: getWidgetsCards(category: WidgetCategory.Layouts),
          ),
      )
    ),
    onSelected: ()=>{print('Layout\n')}

  ),
  Section(
    title: 'ASSETS',
    icon: Icon(Icons.image,size: 19,color: Colors.white),
    card: SectionCard(
      title: 'Assets',
      backgroundAsset: 'assets/sections/DAM.jpg',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: Scrollbar(
            child: GridView.extent(
            key: PageStorageKey('assets'),
            controller: _hideButtonController,
            mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            maxCrossAxisExtent: 180,
            childAspectRatio: 7.0 / 10.0,
            children: getWidgetsCards(category: WidgetCategory.Assets_Images_and_Icons),
          ),
      )
    ),
    onSelected: ()=>{print('Assets\n')}

  ),
  Section(
    title: 'SCROLLING',
    icon: Icon(Icons.unfold_more,size: 20,color: Colors.white),
    card: SectionCard(
      title: 'Scrolling',
      backgroundAsset: 'assets/sections/scrolling.jpeg',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: Scrollbar(
            child: GridView.extent(
            key: PageStorageKey('scrolling'),
            controller: _hideButtonController,
            mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            maxCrossAxisExtent: 180,
            childAspectRatio: 7.0 / 10.0,
            children: getWidgetsCards(category: WidgetCategory.Scrolling),
          ),
      )
    ),
    onSelected: ()=>{print('Scolling\n')}

  ),
  Section(
    title: 'INPUTS',
    icon: Icon(Icons.input,size: 20,color: Colors.white),
    card: SectionCard(
      title: 'Inputs',
      backgroundAsset: 'assets/sections/inputs.png',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: Scrollbar(
            child: GridView.extent(
            key: PageStorageKey('inputs'),
            controller: _hideButtonController,
            mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            maxCrossAxisExtent: 180,
            childAspectRatio: 7.0 / 10.0,
            children: getWidgetsCards(category: WidgetCategory.Inputs),
            )
        ),
    ),
    onSelected: ()=>{print('Inputs\n')}

  ),
];
//----------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------


SliverGrid getWidgetCatalog(){
  return SliverGrid.count(
    crossAxisCount: 2,
    childAspectRatio: 8.0 / 9.0,
    children: getWidgetsCards(),
  );
}

List<WidgetCard> getWidgetsCards({WidgetCategory category}){
  var WIDGET_CARDS_LIST = <WidgetCard>[];
  if(category == null){
    WidgetCatalog.CATALOG_WIDGETS.forEach((e) =>{ WIDGET_CARDS_LIST.add(WidgetCard.fromProduct(e))});
    return WIDGET_CARDS_LIST;
  }else{
    WidgetCatalog.CATALOG_WIDGETS.forEach((e) {
      if(e.categories.contains(category)){
        WIDGET_CARDS_LIST.add(WidgetCard.fromProduct(e));
      }
    return WIDGET_CARDS_LIST;
    });
  }
    return WIDGET_CARDS_LIST;
}




























































class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
