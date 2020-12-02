import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_widgets/routes/home/home.dart';
import 'package:flutter_widgets/supplemental/sectionview.dart';
import 'package:flutter_widgets/widget_catalog.dart';

var sections = <Section>[
  Section(
    title: 'BASICvS',
    icon: Icon(Icons.open_in_new,size: 20),
    card: SectionCard(
      title: 'Basics',
      backgroundAsset: 'assets/sections/basics.png',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: GridView.extent(
            key: PageStorageKey('basics'),
            //mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            maxCrossAxisExtent: 50,
            childAspectRatio: 7.0 / 9.0,
            children: getWidgetsCards(category: WidgetCategory.Basics),
          ),
    ),
    onSelected: ()=>{print('Basics\n')}
  ),
  Section(
    title: 'CUPERTINO',
    icon: Padding(padding: EdgeInsets.only(top: 1),child: Icon(Icons.desktop_mac,size: 20,)),
    card: SectionCard(
      title: 'Cupertino',
      backgroundAsset: 'assets/sections/logo-apple.jpg',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: GridView.extent(
            key: PageStorageKey('cupertino'),
            //mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            maxCrossAxisExtent: 50,
            childAspectRatio: 7.0 / 9.0,
            children: getWidgetsCards(category: WidgetCategory.Cupertino),
          ),
    ),
    onSelected: ()=>{print('Cupertino\n')}
  ),
  Section(
    title: 'MATERIAL',
    icon: Padding(padding: EdgeInsets.only(top: 3),child: Icon(Icons.android,size: 17)),
    card: SectionCard(
      title: 'Material',
      backgroundAsset: 'assets/sections/mio-design.png',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: GridView.extent(
            key: PageStorageKey('material'),
            //mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            maxCrossAxisExtent: 50,
            childAspectRatio: 7.0 / 9.0,
            children: getWidgetsCards(category: WidgetCategory.Material_Components),
          ),
    ),
    onSelected: ()=>{print('Material\n')}

  ),
  Section(
    title: 'LAYOUT',
    icon: Padding(padding: EdgeInsets.only(bottom: 10),child: Icon(Icons.view_module, size: 21,)),
    card: SectionCard(
      title: 'Layout',
      backgroundAsset: 'assets/sections/layout.png',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: GridView.extent(
            key: PageStorageKey('layout'),
            //mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            maxCrossAxisExtent: 50,
            childAspectRatio: 7.0 / 9.0,
            children: getWidgetsCards(category: WidgetCategory.Layouts),
          ),
    ),
    onSelected: ()=>{print('Layout\n')}

  ),
  Section(
    title: 'ASSETS',
    icon: Icon(Icons.image,size: 19),
    card: SectionCard(
      title: 'Assets',
      backgroundAsset: 'assets/sections/DAM.jpg',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: GridView.extent(
            key: PageStorageKey('assets'),
            //mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            maxCrossAxisExtent: 50,
            childAspectRatio: 7.0 / 9.0,
            children: getWidgetsCards(category: WidgetCategory.Assets_Images_and_Icons),
          ),
    ),
    onSelected: ()=>{print('Assets\n')}

  ),
  Section(
    title: 'SCROLLING',
    icon: Icon(Icons.unfold_more,size: 20,),
    card: SectionCard(
      title: 'Scrolling',
      backgroundAsset: 'assets/sections/scrolling.jpeg',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: GridView.extent(
            key: PageStorageKey('scrolling'),
            //mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            maxCrossAxisExtent: 50,
            childAspectRatio: 7.0 / 9.0,
            children: getWidgetsCards(category: WidgetCategory.Scrolling),
          ),
    ),
    onSelected: ()=>{print('Scolling\n')}

  ),
  Section(
    title: 'INPUTS',
    icon: Icon(Icons.input,size: 20),
    card: SectionCard(
      title: 'Inputs',
      backgroundAsset: 'assets/sections/inputs.png',
    ),
    content: Container(
          color: Color(0xFFFFFFFF),
          child: GridView.extent(
            key: PageStorageKey('inputs'),
            //mainAxisSpacing: 12,
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            maxCrossAxisExtent: 50,
            childAspectRatio: 7.0 / 9.0,
            children: getWidgetsCards(category: WidgetCategory.Inputs),
          ),
    ),
    onSelected: ()=>{print('Inputs\n')}

  ),
  /*
  Section(
    title: '',
    icon: Icon(Icons.),
    card: SectionCard(
      title: '',
      backgroundAsset: '',
    ),
    content: Container(
      color: Color(0xFFFFFFFF),
      child: ListView(
        children: <Widget>[],
      )
    )
  )  */
];