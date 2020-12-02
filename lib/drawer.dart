import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget{
  Text name; 
  Icon icon;
  String route;
  Text trailing;
  TextStyle selected_style = TextStyle(
    color: Colors.blue.shade700,
    fontWeight: FontWeight.bold,
    fontSize: 15
  );
  TextStyle unselected_style = TextStyle(
    color: Color(0xFF616161),
    fontWeight: FontWeight.bold,
    fontSize: 15
  );
  bool selected;

  DrawerItem({@required String name, @required IconData icon, String trailing, @required String route, this.selected = false}){

    this.name = Text(name,style: selected ? selected_style : unselected_style,);
    this.icon = Icon(icon,size: 20,color: selected ? Colors.blue.shade700 : Color(0xFF828282));
    this.trailing = Text((trailing == null)? '' : trailing);
    this.route = route;
  }
  
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.only(right: 12, left: 10),
      decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.0),
              bottomRight: Radius.circular(24.0),
            ),
            color: selected ? Color(0xFFe1f5fe).withOpacity(0.3) :Color(0x00000000),
          ),
      child: InkWell(
        onTap: () =>{(route == null)? {Navigator.pop(context)} : Navigator.popAndPushNamed(context, route)},
        borderRadius: BorderRadius.only(
              topRight: Radius.circular(24.0),
              bottomRight: Radius.circular(24.0),
        ),
        child: Align(
          heightFactor: 2.33,
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 14),
              icon,
              SizedBox(width: 32),
              name,
              Spacer(),
              trailing,
              SizedBox(width: 8),
            ],
          ),
        ),
      )
    );
  }
}

class BottomNavigationDrawer extends PopupRoute{
  static BottomNavigationDrawer bottom_navidation_drawer = BottomNavigationDrawer();
  static List<Widget> DRAWER_iTEMS;
  BottomNavigationDrawer({
    this.builder,
    this.theme,
    this.barrierLabel,
    RouteSettings settings,
  }) : super(settings: settings);

  final WidgetBuilder builder;
  final ThemeData theme;

  @override
  Duration get transitionDuration =>  Duration(milliseconds: 200);

  @override
  bool get barrierDismissible => true;

  @override
  final String barrierLabel;

  @override
  Color get barrierColor => Colors.black54;

  AnimationController _animationController;

  @override
  AnimationController createAnimationController() {
    assert(_animationController == null);
    _animationController = BottomSheet.createAnimationController(navigator.overlay);
    return _animationController;
  }

  static void build(List<Widget> items){
    DRAWER_iTEMS = items;
  }

  static void open(context){
    //Navigator.push(context, bottom_navidation_drawer);
    Navigator.push(context, BottomNavigationDrawer());
  }

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    Widget bottomSheet = Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: <Widget>[
          Expanded(
            child: AnimatedContainer(
              duration: Duration(microseconds: 200),
              height: 400.0,
              child: Material(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate(
                        DRAWER_iTEMS
                      )
                    )
                  ]
                ),
              ),
            ),
          )
        ]
      ),
    );

    if (theme != null)
      bottomSheet = Theme(data: theme, child: bottomSheet);
    return bottomSheet;
  }
}
