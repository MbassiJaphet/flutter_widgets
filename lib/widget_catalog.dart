import 'package:flutter/material.dart';

class CatalogWidget{
  final String name;
  final String image;
  final String description;
  final List<WidgetCategory> categories;
  final MaterialPageRoute  route;
  const CatalogWidget({@required this.name,@required this.description, this.image = 'assets/flutter_logo.png', @required this.categories, this.route});
}

enum WidgetCategory {
  Accessibility,
  Animation_and_Motion,
  Assets_Images_and_Icons,
  Assert,
  Basics,
  Cupertino,
  Inputs,
  Interaction_Models,
  Layouts,
  Material_Components,
  Painting_and_Effects,
  Scrolling,
  Styling,
  Text,
}

var categories_icons_map = {
  WidgetCategory.Accessibility : Icons.accessibility,
  WidgetCategory.Animation_and_Motion : Icons.touch_app,
  WidgetCategory.Assets_Images_and_Icons : Icons.image,
  WidgetCategory.Assert : Icons.developer_mode,
  WidgetCategory.Basics : Icons.launch,
  WidgetCategory.Cupertino : Icons.desktop_mac,
  WidgetCategory.Inputs : Icons.input,
  WidgetCategory.Interaction_Models : Icons.burst_mode,
  WidgetCategory.Layouts : Icons.view_module,
  WidgetCategory.Material_Components : Icons.format_shapes,
  WidgetCategory.Painting_and_Effects : Icons.format_paint,
  WidgetCategory.Scrolling : Icons.compare_arrows,
  WidgetCategory.Styling : Icons.style,
  WidgetCategory.Text : Icons.text_fields
};

var descriptions_categories_map = {
  WidgetCategory.Accessibility : 'Make your app accessible.',
  WidgetCategory.Animation_and_Motion : 'Bring animations to your app.',
  WidgetCategory.Assets_Images_and_Icons : 'Manage assets, display images, and show icons.',
  WidgetCategory.Assert : 'Assync pattern to your flutter application.',
  WidgetCategory.Basics : 'Widgets you absolutely need to know before building your first Flutter app.',
  WidgetCategory.Cupertino : 'Beautiful and high-fidelity widgets for current iOS design language.',
  WidgetCategory.Inputs : 'Take user input in addition to input widgets in Material Components and Cupertino.',
  WidgetCategory.Interaction_Models : 'Respond to touch events and route users to different views.',
  WidgetCategory.Layouts : 'Arrange other widgets columns, rows, grids, and many other layouts.',
  WidgetCategory.Material_Components : 'Visual, behavioral, and motion-rich widgets implementing the Material Design guidelines.',
  WidgetCategory.Painting_and_Effects : 'These widgets apply visual effects to the children without changing their layout, size, or position.',
  WidgetCategory.Scrolling : 'Scroll multiple widgets as children of a parent.',
  WidgetCategory.Styling : 'Manage the theme of your app, makes your app responsive to screen sizes, or add padding.',
  WidgetCategory.Text : 'Display text and style'
};

var CATALOG_WIDGETS = [
 CatalogWidget(
   name: 'Container',
   image: 'assets/container.jpg',
   categories: [WidgetCategory.Basics,WidgetCategory.Layouts],
   route: null,
   description: 'A convenience widget that combines common painting, positioning, and sizing widgets.'
 ),
 CatalogWidget(
   name: 'Row',
   image: 'assets/row.jpg',
   categories: [WidgetCategory.Basics,WidgetCategory.Layouts],
   route: null,
   description: 'Layout a list of child widgets in the horizontal direction.'
 ),
 CatalogWidget(
   name: 'Column',
   image: 'assets/column.jpg',
   categories: [WidgetCategory.Basics,WidgetCategory.Layouts],
   route: null,
   description: 'Layout a list of child widgets in the vertical direction.'
 ),
 CatalogWidget(
   name: 'Image',
   image: 'assets/image.jpg',
   categories: [WidgetCategory.Basics,WidgetCategory.Assets_Images_and_Icons],
   route: null,
   description: 'A widget that displays an image.'
 ),
 CatalogWidget(
   name: 'Text',
   image: 'assets/text.jpg',
   categories: [WidgetCategory.Basics],
   route: null,
   description: 'A run of text with a single style.'
 ),
 CatalogWidget(
   name: 'Icon',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Basics],
   route: null,
   description: 'A Material Design icon.'
 ),
 CatalogWidget(
   name: 'FlutterLogo',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Basics],
   route: null,
   description: 'The Flutter logo, in widget form. This widget respects the IconTheme.'
 ),
 CatalogWidget(
   name: 'PlaceHolder',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Basics],
   route: null,
   description: 'A widget that draws a box that represents where other widgets will one day be added.'
 ),
 CatalogWidget(
   name: 'CupertinoActivityIndicator',
   image: 'assets/cupertino_activity_indicator.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style modal bottom action sheet to choose an option among many.'
 ),
 CatalogWidget(
   name: 'CupertinoAlertDialog',
   image: 'assets/cupertino_alert_dialog.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style alert dialog.'
 ),
 CatalogWidget(
   name: 'CupertinoButton',
   image: 'assets/cupertino_button.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style button.'
 ),
 CatalogWidget(
   name: 'CupertinoDatePicker',
   image: 'assets/cupertino_date_picker.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style date or date and time picker.'
 ),
 CatalogWidget(
   name: 'CupertinoDialog',
   image: 'assets/cupertino_dialog.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style dialog.'
 ),
 CatalogWidget(
   name: 'CupertinoDialogAction',
   image: 'assets/cupertino_dialog_action.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'A button typically used in a CupertinoAlertDialog.'
 ),
 CatalogWidget(
   name: 'CupertinoFullScreenDialogTransition',
   image: 'assets/cupertino_fullscreen_dialog_transition.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style transition used for summoning fullscreen dialogs.'
 ),
 CatalogWidget(
   name: 'CupertinoPageScaffold',
   image: 'assets/cupertino_page_scaffold.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'Basic iOS style page layout structure. Positions a navigation bar and content on a background.'
 ),
 CatalogWidget(
   name: 'CupertinoPageTransition',
   image: 'assets/cupertino_page_transition.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'Provides an iOS-style page transition animation.'
 ),
 CatalogWidget(
   name: 'CupertinoSegmentedControl',
   image: 'assets/cupertino_segmented_control.jpg',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style segmented control. Used to select mutually exclusive options in a horizontal list.'
 ),
 CatalogWidget(
   name: 'CupertinoSlider',
   image: 'assets/cupertino_slider.jpg',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'Used to select from a range of values.'
 ),
 CatalogWidget(
   name: 'CupertinoSwitch',
   image: 'assets/cupertino-switch.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style switch. Used to toggle the on/off state of a single setting.'
 ),
 CatalogWidget(
   name: 'CupertinoNavigationBar',
   image: 'assets/cupertino_navigation_bar.jpg',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style top navigation bar. Typically used with CupertinoPageScaffold.'
 ),
 CatalogWidget(
   name: 'CupertinoTabBar',
   image: 'assets/cupertino_tabbar.jpg',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style bottom tab bar. Typically used with CupertinoTabScaffold.'
 ),
 CatalogWidget(
   name: 'CupertinoTextField',
   image: 'assets/cupertino_textfield.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style text field.'
 ),
 CatalogWidget(
   name: 'CupertinoTimerPicker',
   image: 'assets/cupertino_timer_picker.png',
   categories: [WidgetCategory.Cupertino],
   route: null,
   description: 'An iOS-style countdown timer picker.'
 ),
 CatalogWidget(
   name: 'Drawer',
   image: 'assets/navigation_drawer.png',
   categories: [WidgetCategory.Material_Components],
   route: null,
   description: 'A Material Design panel that slides in horizontally from the edge of a Scaffold to show navigation links in an application.'
 ),
 CatalogWidget(
   name: 'Padding',
   image: 'assets/padding.jpg',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that insets its child by the given padding.'
 ),
 CatalogWidget(
   name: 'Center',
   image: 'assets/center.jpg',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that centers its child within itself.'
 ),
 CatalogWidget(
   name: 'Align',
   image: 'assets/align.jpg',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that aligns its child within itself and optionally sizes itself based on the child\'s size.'
 ),
 CatalogWidget(
   name: 'FittedBox',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'Scales and positions its child within itself according to fit.'
 ),
 CatalogWidget(
   name: 'AspectRatio',
   image: 'assets/aspect_ratio.jpg',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that attempts to size the child to a specific aspect ratio.'
 ),
 CatalogWidget(
   name: 'ConstrainedBox',
   image: 'assets/constrained_box.jpg',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that imposes additional constraints on its child.'
 ),
 CatalogWidget(
   name: 'Baseline',
   image: 'assets/baseline.jpg',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that positions its child according to the child\'s baseline.'
 ),
 CatalogWidget(
   name: 'FractionallySizedBox',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that sizes its child to a fraction of the total available space. For more details about the layout algorithm, see RenderFractionallySizedOverflowBox.'
 ),
 CatalogWidget(
   name: 'LimitedBox',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A box that limits its size only when it\'s unconstrained.'
 ),
 CatalogWidget(
   name: 'OffStage',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that lays the child out as if it was in the tree, but without painting anything, without making the child available for hit testing, and without taking any room in the parent.'
 ),
 CatalogWidget(
   name: 'OverlowBox',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that imposes different constraints on its child than it gets from its parent, possibly allowing the child to overflow the parent.'
 ),
 CatalogWidget(
   name: 'SizedBox',
   image: 'assets/sized_box.jpg',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A box with a specified size. If given a child, this widget forces its child to have a specific width and/or height (assuming values are permitted by this widget\'s parent). If either the width or height is null, this widget will size itself to match the child\'s size in that dimension.'
 ),
 CatalogWidget(
   name: 'SizedOverflowBox',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that is a specific size but passes its original constraints through to its child, which will probably overflow.'
 ),
 CatalogWidget(
   name: 'Transform',
   image: 'assets/transform.jpg',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that applies a transformation before painting its child.'
 ),
 CatalogWidget(
   name: 'CustomSingleChildLayout',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that defers the layout of its single child to a delegate.'
 ),
 CatalogWidget(
   name: 'Stack',
   image: 'assets/stack.jpg',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'This class is useful if you want to overlap several children in a simple way, for example having some text and an image, overlaid with a gradient and a button attached to the bottom.'
 ),
 CatalogWidget(
   name: 'IndexedStack',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A Stack that shows a single child from a list of children.'
 ),
 CatalogWidget(
   name: 'GridView',
   image: 'assets/gridview.png',
   categories: [WidgetCategory.Material_Components,WidgetCategory.Layouts,WidgetCategory.Scrolling],
   route: null,
   description: 'A grid list consists of a repeated pattern of cells arrayed in a vertical and horizontal layout. The GridView widget implements this component.'
 ),
 CatalogWidget(
   name: 'Flow',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that implements the flow layout algorithm.'
 ),
 CatalogWidget(
   name: 'Table',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that uses the table layout algorithm for its children.'
 ),
 CatalogWidget(
   name: 'Wrap',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that displays its children in multiple horizontal or vertical runs.'
 ),
 CatalogWidget(
   name: 'ListBody',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that arranges its children sequentially along a given axis, forcing them to the dimension of the parent in the other axis.'
 ),
 CatalogWidget(
   name: 'CustomMultiChidLayout',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that uses a delegate to size and position multiple children.'
 ),
 CatalogWidget(
   name: 'LayoutBuilder',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'Builds a widget tree that can depend on the parent widget\'s size.'
 ),
 CatalogWidget(
   name: 'ListView',
   image: 'assets/listview.jpg',
   categories: [WidgetCategory.Layouts,WidgetCategory.Scrolling],
   route: null,
   description: 'A scrollable, linear list of widgets. ListView is the most commonly used scrolling widget. It displays its children one after another in the scroll direction. In the cross axis, the children are required to fill the ListView.'
 ),
 CatalogWidget(
   name: 'Expanded',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Layouts],
   route: null,
   description: 'A widget that expands a child of a Row, Column, or Flex.'
 ),
 CatalogWidget(
   name: 'RawImage',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Assets_Images_and_Icons],
   route: null,
   description: 'A widget that displays a dart:ui.Image directly.'
 ),
 CatalogWidget(
   name: 'AssetBundle',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Assets_Images_and_Icons],
   route: null,
   description: 'Asset bundles contain resources, such as images and strings, that can be used by an application. Access to these resources is asynchronous so that they can be transparently loaded over a network (e.g., from a NetworkAssetBundle) or from the local file system without blocking the application\'s user interface.'
 ),
 CatalogWidget(
   name: 'SingleChildScrollView',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Scrolling],
   route: null,
   description: 'A box in which a single widget can be scrolled. This widget is useful when you have a single box that will normally be entirely visible, for example a clock face in a time picker, but you need to make sure it can be scrolled if the container gets too small in one axis (the scroll direction).'
 ),
 CatalogWidget(
   name: 'Scrollable',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Scrolling],
   route: null,
   description: 'Scrollable implements the interaction model for a scrollable widget, including gesture recognition, but does not have an opinion about how the viewport, which actually displays the children, is constructed.'
 ),
 CatalogWidget(
   name: 'ScrollBar',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Scrolling],
   route: null,
   description: 'A Material Design scrollbar. A scrollbar indicates which portion of a Scrollable widget is actually visible.'
 ),
 CatalogWidget(
   name: 'CustomScrollview',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Scrolling],
   route: null,
   description: 'A ScrollView that creates custom scroll effects using slivers.'
 ),
 CatalogWidget(
   name: 'NotificationListener',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Scrolling],
   route: null,
   description: 'A widget that listens for Notifications bubbling up the tree.'
 ),
 CatalogWidget(
   name: 'ScrollConfiguration',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Scrolling],
   route: null,
   description: 'Controls how Scrollable widgets behave in a subtree.'
 ),
 CatalogWidget(
   name: 'PageView',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Scrolling],
   route: null,
   description: 'A scrollable list that works page by page.'
 ),
 CatalogWidget(
   name: 'Form',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Inputs],
   route: null,
   description: 'An optional container for grouping together multiple form field widgets (e.g. TextField widgets).'
 ),
 CatalogWidget(
   name: 'FormField',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Inputs],
   route: null,
   description: 'A single form field. This widget maintains the current state of the form field, so that updates and validation errors are visually reflected in the UI.'
 ),
 CatalogWidget(
   name: 'RawKeyboardListener',
   image: 'assets/flutter_logo.png',
   categories: [WidgetCategory.Inputs],
   route: null,
   description: 'A widget that calls a callback whenever the user presses or releases a key on a keyboard.'
 ),
 CatalogWidget(
   name: "AlertDialog",
   image: "assets/alert_dialog.png",
   categories: [WidgetCategory.Material_Components],
   description: 'Alerts are urgent interruptions requiring acknowledgement that inform the user about a situation. The AlertDialog widget implements this component.',
   route: null
 ),
 CatalogWidget(
   name: "AppBar",
   image: "assets/appbar.png",
   categories: [WidgetCategory.Basics,WidgetCategory.Material_Components],
   description: 'A Material Design app bar. An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar.',
   route: null
 ),
 CatalogWidget(
   name: "BottomNavigationBar",
   image: "assets/bottom_navigation.png",
   categories: [WidgetCategory.Material_Components],
   description: 'Bottom navigation bars make it easy to explore and switch between top-level views in a single tap. The BottomNavigationBar widget implements this component.',
   route: null
 ),
 CatalogWidget(
   name: "Card",
   image: "assets/card.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A Material Design card. A card has slightly rounded corners and a shadow.',
   route: null
 ),
 CatalogWidget(
   name: "CheckBox",
   image: "assets/checkbox.png",
   categories: [WidgetCategory.Material_Components,WidgetCategory.Inputs],
   description: 'Checkboxes allow the user to select multiple options from a set. The Checkbox widget implements this component.',
   route: null
 ),
 CatalogWidget(
   name: "Chip",
   image: "assets/chip.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A Material Design chip. Chips represent complex entities in small blocks, such as a contact.',
   route: null
 ),
 CatalogWidget(
   name: "CupertinoActionSheet",
   image: "assets/cupertino_action_sheet.png",
   categories: [WidgetCategory.Cupertino],
   description: 'An iOS-style modal bottom action sheet to choose an option among many.',
   route: null
 ),
 CatalogWidget(
   name: "DataTable",
   image: "assets/data_table.png",
   categories: [WidgetCategory.Material_Components],
   description: 'Data tables display sets of raw data. They usually appear in desktop enterprise products. The DataTable widget implements this component.',
   route: null
 ),
 CatalogWidget(
   name: "Divider",
   image: "assets/divider.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A one logical pixel thick horizontal line, with padding on either side.',
   route: null
 ),
 CatalogWidget(
   name: "ExpansionPanel",
   image: "assets/expansion_panel.png",
   categories: [WidgetCategory.Material_Components],
   description: 'Expansion panels contain creation flows and allow lightweight editing of an element. The ExpansionPanel widget implements this component.',
   route: null
 ),
 CatalogWidget(
   name: "FloatingActionButton",
   image: "assets/fab.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A floating action button is a circular icon button that hovers over content to promote a primary action in the application. Floating action buttons are most commonly used in the Scaffold.floatingActionButton field.',
   route: null
 ),
 CatalogWidget(
   name: "FlatButton",
   image: "assets/flat_button.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A flat button is a section printed on a Material Components widget that reacts to touches by filling with color.',
   route: null
 ),
 CatalogWidget(
   name: "NestedScrollView",
   categories: [WidgetCategory.Layouts,WidgetCategory.Scrolling],
   description: 'A scrolling view inside of which can be nested other scrolling views, with their scroll positions being intrinsically linked.',
   route: null
 ),
 CatalogWidget(
   name: "IconButton",
   image: "assets/icon_button.png",
   categories: [WidgetCategory.Material_Components],
   description: 'An icon button is a picture printed on a Material widget that reacts to touches by filling with color (ink).',
   route: null
 ),
 CatalogWidget(
   name: "LinearProgressIndicator",
   image: "assets/linear_progress_indicator.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A material design linear progress indicator, also known as a progress bar.',
   route: null
 ),
 CatalogWidget(
   name: "ListTile",
   image: "assets/list_tile.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A one logical pixel thick horizontal line, with padding on either side.',
   route: null
 ),
 CatalogWidget(
   name: "MaterialApp",
   image: "assets/material_app.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A convenience widget that wraps a number of widgets that are commonly required for applications implementing Material Design.',
   route: null
 ),
 CatalogWidget(
   name: "Date & Time Pickers",
   image: "assets/pickers.png",
   categories: [WidgetCategory.Material_Components,WidgetCategory.Inputs],
   description: 'Date pickers use a dialog window to select a single date on mobile. Time pickers use a dialog to select a single time (in the hours:minutes format) on mobile.',
   route: null
 ),
 CatalogWidget(
   name: "PopupMenuButton",
   image: "assets/popup_menu_button.png",
   categories: [WidgetCategory.Material_Components],
   description: 'Displays a menu when pressed and calls onSelected when the menu is dismissed because an item was selected.',
   route: null
 ),
 CatalogWidget(
   name: "Radio",
   image: "assets/radio_button.png",
   categories: [WidgetCategory.Material_Components,WidgetCategory.Inputs],
   description: 'Radio buttons allow the user to select one option from a set. Use radio buttons for exclusive selection if you think that the user needs to see all available options side-by-side.',
   route: null
 ),
 CatalogWidget(
   name: "RaisedButton",
   image: "assets/raised_button.png",
   categories: [WidgetCategory.Basics,WidgetCategory.Material_Components],
   description: 'A Material Design raised button. A raised button consists of a rectangular piece of material that hovers over the interface.',
   route: null
 ),
 CatalogWidget(
   name: "RefreshIndicator",
   image: "assets/refresh_indicator.jpg",
   categories: [WidgetCategory.Scrolling],
   description: 'A Material Design pull-to-refresh wrapper for scrollables.',
   route: null
 ),
 CatalogWidget(
   name: "Scaffold",
   image: "assets/scaffold.png",
   categories: [WidgetCategory.Basics,WidgetCategory.Material_Components],
   description: 'Implements the basic Material Design visual layout structure. This class provides APIs for showing drawers, snack bars, and bottom sheets.',
   route: null
 ),
 CatalogWidget(
   name: "BottomSheet",
   image: "assets/bottom_sheet.png",
   categories: [WidgetCategory.Material_Components],
   description: 'Bottom sheets slide up from the bottom of the screen to reveal more content. You can call showBottomSheet() to implement a persistent bottom sheet or showModalBottomSheet() to implement a modal bottom sheet.',
   route: null
 ),
 CatalogWidget(
   name: "SliverAppBar",
   image: "assets/silver_appbar.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A material design app bar that integrates with a CustomScrollView.',
   route: null
 ),
 CatalogWidget(
   name: "SimpleDialog",
   image: "assets/simple_dialog.png",
   categories: [WidgetCategory.Material_Components],
   description: 'Simple dialogs can provide additional details or actions about a list item. For example they can display avatars icons clarifying subtext or orthogonal actions (such as adding an account).',
   route: null
 ),
 CatalogWidget(
   name: "Slider",
   image: "assets/slider.png",
   categories: [WidgetCategory.Material_Components,WidgetCategory.Inputs],
   description: 'Sliders let users select from a range of values by moving the slider thumb.',
   route: null
 ),
 CatalogWidget(
   name: "SnackaBar",
   image: "assets/snackbar.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A lightweight message with an optional action which briefly displays at the bottom of the screen.',
   route: null
 ),
 CatalogWidget(
   name: "Stepper",
   image: "assets/stepper.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A Material Design stepper widget that displays progress through a sequence of steps.',
   route: null
 ),
 CatalogWidget(
   name: "Switch",
   image: "assets/switch.png",
   categories: [WidgetCategory.Material_Components,WidgetCategory.Inputs],
   description: 'On/off switches toggle the state of a single settings option. The Switch widget implements this component.',
   route: null
 ),
 CatalogWidget(
   name: "TabBar",
   image: "assets/tabbar.png",
   categories: [WidgetCategory.Material_Components],
   description: 'A Material Design widget that displays a horizontal row of tabs.',
   route: null
 ),
 CatalogWidget(
   name: "TextField",
   image: "assets/textfield.png",
   categories: [WidgetCategory.Material_Components,WidgetCategory.Inputs],
   description: 'Touching a text field places the cursor and displays the keyboard. The TextField widget implements this component.',
   route: null
 ),
 CatalogWidget(
   name: "ToolTip",
   image: "assets/tooltip.png",
   categories: [WidgetCategory.Material_Components],
   description: 'Tooltips provide text labels that help explain the function of a button or other user interface action. Wrap the button in a Tooltip widget to show a label when the widget long pressed (or when the user takes some other appropriate action).',
   route: null
 ),
];

var _CATALOG_WIDGETS = [
 CatalogWidget(
   name: "AlertDialogs",
   image: "assets/coby/0-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "AppBar",
   image: "assets/coby/1-0.jpg",
   categories: [WidgetCategory.Basics,WidgetCategory.Material_Components],
   description: 'A Material Design app bar. An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar.',
   route: null
 ),
 CatalogWidget(
   name: "BottomNavigationBar",
   image: "assets/coby/2-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "Card",
   image: "assets/coby/3-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "CheckBox",
   image: "assets/coby/4-0.jpg",
   categories: [WidgetCategory.Material_Components,WidgetCategory.Inputs],
   description: 'Checkboxes allow the user to select multiple options from a set. The Checkbox widget implements this component.',
   route: null
 ),
 CatalogWidget(
   name: "Chip",
   image: "assets/coby/5-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "CupertinoActionSheet",
   image: "assets/coby/6-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "DataTable",
   image: "assets/coby/7-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "Divider",
   image: "assets/coby/37-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "ExpansionPanel",
   image: "assets/coby/8-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "FloationgActionButton",
   image: "assets/coby/9-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "FlatButton",
   image: "assets/coby/10-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "GridView",
   image: "assets/coby/11-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "IconButton",
   image: "assets/coby/12-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "LinearProgressIndicator",
   image: "assets/coby/13-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "ListTile",
   image: "assets/coby/14-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "MaterialApp",
   image: "assets/coby/15-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "NavigationDrawer",
   image: "assets/coby/16-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "Pickers",
   image: "assets/coby/17-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "PopupMenuButton",
   image: "assets/coby/18-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "RadioButton",
   image: "assets/coby/19-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "RaisedButton",
   image: "assets/coby/20-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "RefreshIndicator",
   image: "assets/coby/21-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "Scaffold",
   image: "assets/coby/22-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "BottomSheet",
   image: "assets/coby/23-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "SilverAppBar",
   image: "assets/coby/24-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "SimpleDialog",
   image: "assets/coby/25-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "Slider",
   image: "assets/coby/26-0.jpg",
   categories: [WidgetCategory.Material_Components,WidgetCategory.Inputs],
   description: 'Sliders let users select from a range of values by moving the slider thumb.',
   route: null
 ),
 CatalogWidget(
   name: "SnackaBar",
   image: "assets/coby/27-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "Stepper",
   image: "assets/coby/28-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "Switch",
   image: "assets/coby/29-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "TabBar",
   image: "assets/coby/30-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "TextField",
   image: "assets/coby/32-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "ToolTip",
   image: "assets/coby/33-0.jpg",
   categories: [],
   route: null
 ),
 CatalogWidget(
   name: "ToolTip",
   image: "assets/coby/34-0.jpg",
   categories: [],
   route: null
 ),
];
