// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;


const double kSectionIndicatorWidth = 32.0;

const Color _kAppBackgroundColor = Color(0xFF353662);
const Duration _kScrollDuration = Duration(milliseconds: 400);
const Curve _kScrollCurve = Curves.fastOutSlowIn;

// This app's contents start out at _kHeadingMaxHeight and they function like
// an appbar. Initially the appbar occupies most of the screen and its section
// headings are laid out in a column. By the time its height has been
// reduced to _kAppBarMidHeight, its layout is horizontal, only one section
// heading is visible, and the section's list of details is visible below the
// heading. The appbar's height can be reduced to no more than _kAppBarMinHeight.
const double _kAppBarMinHeight = 90.0;
const double _kAppBarMidHeight = 256.0;

class Section {
  final String title;
  final TextStyle sectionTitleStyle;
  final TextStyle sectionTitleShadowStyle;
  final SectionCard card;
  final Widget icon;
  final Widget content;
  final Function onSelected;

  const Section({@required this.title,@required this.card, this.icon, @required this.content,
                  this.sectionTitleStyle, this.sectionTitleShadowStyle, this.onSelected
  })
  : assert((card != null) && (content != null) && (title != null));
}

// The card for a single section. Displays the section's gradient and background image.
class SectionCard extends StatelessWidget {
      final String title;
      final Gradient gradientColor;
      final Image backgroundImage;
      //final List<Color> colors;
      final String backgroundAsset;
  const SectionCard({ 
    Key key, 
    @required this.title, 
    this.backgroundImage, 
    this.gradientColor = defaultGradientColor, 
    this.backgroundAsset
    })
    : assert(title != null),
      assert((backgroundImage != null) || (backgroundAsset != null)),
      super(key: key);

  static const defaultGradientColor = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
      //Color(0xFFFAFAFA),
      //Color(0xFFEEEEEE),
      //Color(0xFFF5F5F5),
              //Color(0xFFe0f2f1),
              //Color(0xFFe0f2f1),
              Colors.blue,
              Colors.blue,
              //Color(0xFF303f9f),
      ],
    );

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: title,
      button: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradientColor,
        ),
        child: (backgroundImage == null) ? Image.asset(
          backgroundAsset,
          color: const Color.fromRGBO(255, 255, 255, 0.075),
          colorBlendMode: BlendMode.modulate,
          fit: BoxFit.fitWidth,
        ) : backgroundImage,
      ),
    );
  }
}

// The title is rendered with two overlapping text widgets that are vertically
// offset a little. It's supposed to look sort-of 3D.
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.title,
    @required this.scale,
    @required this.opacity,
    this.sectionTitleStyle = defaultSectionTitleStyle,
    this.sectionTitleShadowStyle = defaultSectionTitleShadowStyle
  }) : assert(title != null),
       assert(scale != null),
       assert(opacity != null && opacity >= 0.0 && opacity <= 1.0),
       super(key: key);

  final String title;
  final double scale;
  final double opacity;
  final TextStyle sectionTitleStyle;
  final TextStyle sectionTitleShadowStyle;

  static const TextStyle defaultSectionTitleStyle = TextStyle(
    fontFamily: 'Roboto',
    inherit: false,
    fontSize: 26.0,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    textBaseline: TextBaseline.alphabetic,
  );

  static const TextStyle defaultSectionTitleShadowStyle = TextStyle(
    fontFamily: 'Roboto',
    inherit: false,
    fontSize: 26.0,
    fontWeight: FontWeight.w400,
    color : Color(0x19000000),
    textBaseline: TextBaseline.alphabetic,
  );

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Opacity(
        opacity: opacity,
        child: Transform(
          transform: Matrix4.identity()..scale(scale),
          alignment: Alignment.center,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 4.0,
                child: Text(title, style: defaultSectionTitleShadowStyle),
              ),
              Text(title, style: defaultSectionTitleStyle),
            ],
          ),
        ),
      ),
    );
  }
}

// Icon that indicates the selected section.
class SectionIndicator extends StatelessWidget {
  const SectionIndicator({ Key key, this.opacity = 1.0, this.icon, this.width , this.height }) : super(key: key);

  final double opacity;
  final double width;
  final double height;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return (icon == null) ? IgnorePointer(
      child: Container(
        width: kSectionIndicatorWidth,
        height: 3.0,
        color: Colors.white.withOpacity(opacity),
      ),
    ) : IgnorePointer(
          child: Opacity(opacity:opacity,child:Stack(alignment: AlignmentDirectional.center, children: <Widget>[SizedBox(child: icon, height: this.height, width: this.width)]))
        );
  }
}

// The AppBar's max height depends on the screen, see _AnimationDemoHomeState._buildBody()

// Initially occupies the same space as the status bar and gets smaller as
// the primary scrollable scrolls upwards.
// TODO(hansmuller): it would be worth adding something like this to the framework.
class _RenderStatusBarPaddingSliver extends RenderSliver {
  _RenderStatusBarPaddingSliver({
    @required double maxHeight,
    @required double scrollFactor,
  }) : assert(maxHeight != null && maxHeight >= 0.0),
       assert(scrollFactor != null && scrollFactor >= 1.0),
       _maxHeight = maxHeight,
       _scrollFactor = scrollFactor;

  // The height of the status bar
  double get maxHeight => _maxHeight;
  double _maxHeight;
  set maxHeight(double value) {
    assert(maxHeight != null && maxHeight >= 0.0);
    if (_maxHeight == value)
      return;
    _maxHeight = value;
    markNeedsLayout();
  }

  // That rate at which this renderer's height shrinks when the scroll
  // offset changes.
  double get scrollFactor => _scrollFactor;
  double _scrollFactor;
  set scrollFactor(double value) {
    assert(scrollFactor != null && scrollFactor >= 1.0);
    if (_scrollFactor == value)
      return;
    _scrollFactor = value;
    markNeedsLayout();
  }

  @override
  void performLayout() {
    final double height = (maxHeight - constraints.scrollOffset / scrollFactor).clamp(0.0, maxHeight);
    geometry = SliverGeometry(
      paintExtent: math.min(height, constraints.remainingPaintExtent),
      scrollExtent: maxHeight,
      maxPaintExtent: maxHeight,
    );
  }
}

class _StatusBarPaddingSliver extends SingleChildRenderObjectWidget {
  const _StatusBarPaddingSliver({
    Key key,
    @required this.maxHeight,
    this.scrollFactor = 5.0,
  }) : assert(maxHeight != null && maxHeight >= 0.0),
       assert(scrollFactor != null && scrollFactor >= 1.0),
       super(key: key);

  final double maxHeight;
  final double scrollFactor;

  @override
  _RenderStatusBarPaddingSliver createRenderObject(BuildContext context) {
    return _RenderStatusBarPaddingSliver(
      maxHeight: maxHeight,
      scrollFactor: scrollFactor,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderStatusBarPaddingSliver renderObject) {
    renderObject
      ..maxHeight = maxHeight
      ..scrollFactor = scrollFactor;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder description) {
    super.debugFillProperties(description);
    description.add(DoubleProperty('maxHeight', maxHeight));
    description.add(DoubleProperty('scrollFactor', scrollFactor));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override double get minExtent => minHeight;
  @override double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(elevation: 2, child:SizedBox.expand(child: child));
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight
        || minHeight != oldDelegate.minHeight
        || child != oldDelegate.child;
  }

  @override
  String toString() => '_SliverAppBarDelegate';
}

// Arrange the section titles, indicators, and cards. The cards are only included when
// the layout is transitioning between vertical and horizontal. Once the layout is
// horizontal the cards are laid out by a PageView.
//
// The layout of the section cards, titles, and indicators is defined by the
// two 0.0-1.0 "t" parameters, both of which are based on the layout's height:
// - tColumnToRow
//   0.0 when height is maxHeight and the layout is a column
//   1.0 when the height is midHeight and the layout is a row
// - tCollapsed
//   0.0 when height is midHeight and the layout is a row
//   1.0 when height is minHeight and the layout is a (still) row
//
// minHeight < midHeight < maxHeight
//
// The general approach here is to compute the column layout and row size
// and position of each element and then interpolate between them using
// tColumnToRow. Once tColumnToRow reaches 1.0, the layout changes are
// defined by tCollapsed. As tCollapsed increases the titles spread out
// until only one title is visible and the indicators cluster together
// until they're all visible.
class _AllSectionsLayout extends MultiChildLayoutDelegate {
  _AllSectionsLayout({
    this.sectionView,
    @required this.context,
    this.translation,
    this.tColumnToRow,
    this.tCollapsed,
    this.cardCount,
    this.selectedIndex,
    @required this.secionCardXPaddingFraction,
    @required this.secionTitleXPaddingFraction,
    this.sectionTitleRowYTranslate,
    this.sectionTitleColumnYTranslate,
    @required this.iconColumnXLayoutRatio,
    @required this.iconColumnYLayoutRatio,
    this.iconRowYTranslate
  }) :
    assert((secionCardXPaddingFraction >= 0.0) && (secionCardXPaddingFraction <= 1.0)),
    assert((secionTitleXPaddingFraction >= 0.0) && (secionTitleXPaddingFraction <= 1.0)),
    assert((iconColumnXLayoutRatio >= 0.0) && (iconColumnXLayoutRatio <= 1.0)),
    assert((iconColumnYLayoutRatio >= 0.0) && (iconColumnYLayoutRatio <= 1.0));

  final SectionView sectionView;
  final BuildContext context;
  final Alignment translation;
  final double tColumnToRow;
  final double tCollapsed;
  final int cardCount;
  final double selectedIndex;
  final double secionCardXPaddingFraction;
  final double secionTitleXPaddingFraction;
  final double sectionTitleRowYTranslate;
  final double sectionTitleColumnYTranslate;
  final double iconColumnXLayoutRatio;
  final double iconColumnYLayoutRatio;
  final double iconRowYTranslate;

  Rect _interpolateRect(Rect begin, Rect end) {
    return Rect.lerp(begin, end, tColumnToRow);
  }

  Offset _interpolatePoint(Offset begin, Offset end) {
    return Offset.lerp(begin, end, tColumnToRow);
  }

  @override
  void performLayout(Size size) {
    final double columnCardX = size.width * secionCardXPaddingFraction;
    final double columnCardWidth = size.width - columnCardX;
    final double columnCardHeight = size.height / cardCount;
    final double rowCardWidth = size.width;
    final Offset offset = translation.alongSize(size);
    double columnCardY = 0.0;
    double rowCardX = -(selectedIndex * rowCardWidth);

    // When tCollapsed > 0 the titles spread apart
    //final double columnTitleX = size.width / 10.0;
    final double columnTitleX = size.width * secionTitleXPaddingFraction;
    final double rowTitleWidth = size.width * ((1 + tCollapsed) / 2.25);
    double rowTitleX = (size.width - rowTitleWidth) / 2.0 - selectedIndex * rowTitleWidth;

    // When tCollapsed > 0, the indicators move closer together
    //final double rowIndicatorWidth = 48.0 + (1.0 - tCollapsed) * (rowTitleWidth - 48.0);
    const double paddedSectionIndicatorWidth = kSectionIndicatorWidth + 8.0;
    final double rowIndicatorWidth = paddedSectionIndicatorWidth +
      (1.0 - tCollapsed) * (rowTitleWidth - paddedSectionIndicatorWidth);
    double rowIndicatorX = (size.width - rowIndicatorWidth) / 2.0 - selectedIndex * rowIndicatorWidth;

    // Compute the size and origin of each card, title, and indicator for the maxHeight
    // "column" layout, and the midHeight "row" layout. The actual layout is just the
    // interpolated value between the column and row layouts for t.
    for (int index = 0; index < cardCount; index++) {

      // Layout the card for index.
      final Rect columnCardRect = Rect.fromLTWH(columnCardX, columnCardY, columnCardWidth, columnCardHeight);
      final Rect rowCardRect = Rect.fromLTWH(rowCardX, 0.0, rowCardWidth, size.height);
      final Rect cardRect = _interpolateRect(columnCardRect, rowCardRect).shift(offset);
      final String cardId = 'card$index';
      if (hasChild(cardId)) {
        layoutChild(cardId, BoxConstraints.tight(cardRect.size));
        positionChild(cardId, cardRect.topLeft);
      }

      // Layout the title for index.
      final Size titleSize = layoutChild('title$index', BoxConstraints.loose(cardRect.size));
      final double columnTitleY = columnCardRect.centerLeft.dy - titleSize.height / 2.0 + sectionTitleColumnYTranslate;
      final double rowTitleY = rowCardRect.centerLeft.dy - titleSize.height / 2.0 + sectionTitleRowYTranslate;
      final double centeredRowTitleX = rowTitleX + (rowTitleWidth - titleSize.width) / 2.0;
      final Offset columnTitleOrigin = Offset(columnTitleX, columnTitleY);
      final Offset rowTitleOrigin = Offset(centeredRowTitleX, rowTitleY);
      final Offset titleOrigin = _interpolatePoint(columnTitleOrigin, rowTitleOrigin);
      positionChild('title$index', titleOrigin + offset);

      // Layout the selection indicator for index.
      final Size indicatorSize = layoutChild('indicator$index', BoxConstraints.loose(cardRect.size));
      //#final double columnIndicatorX = cardRect.centerRight.dx - indicatorSize.width - 16.0;
      final double columnIndicatorX = cardRect.centerRight.dx * iconColumnXLayoutRatio - indicatorSize.width;
      //#final double columnIndicatorY = cardRect.bottomRight.dy - indicatorSize.height - 16.0;
      final double columnIndicatorY = cardRect.size.height * iconColumnYLayoutRatio + (index * cardRect.size.height) - indicatorSize.height/2;
      final Offset columnIndicatorOrigin = Offset(columnIndicatorX, columnIndicatorY);
      final Rect titleRect = Rect.fromPoints(titleOrigin, titleSize.bottomRight(titleOrigin));
      final double centeredRowIndicatorX = rowIndicatorX + (rowIndicatorWidth - indicatorSize.width) / 2.0;
      final double rowIndicatorY = titleRect.bottomCenter.dy + iconRowYTranslate;
      final Offset rowIndicatorOrigin = Offset(centeredRowIndicatorX, rowIndicatorY);
      final Offset indicatorOrigin = _interpolatePoint(columnIndicatorOrigin, rowIndicatorOrigin);
      positionChild('indicator$index', indicatorOrigin + offset);

      columnCardY += columnCardHeight;
      rowCardX += rowCardWidth;
      rowTitleX += rowTitleWidth;
      rowIndicatorX += rowIndicatorWidth;
    }
    if(size.height <= _kAppBarMinHeight+25){
      sectionView.onAppBarCollapsed();
      sectionView.appBarIsCollapsed = true;
      sectionView.appBarIsExpanded = false;
    }
    if((_kAppBarMidHeight-25/2 <= size.height) && (size.height <= _kAppBarMidHeight+25/2)){
      print('Mid Scroll Offset\n');
    }
    if(size.height >= MediaQuery.of(context).removePadding(removeTop: true).size.height-25){
      sectionView.onAppBarExpanded();
      sectionView.appBarIsCollapsed = false;
      sectionView.appBarIsExpanded = true;
    }
    if((selectedIndex % 1) == 0){
      //sectionView.sections.elementAt(selectedIndex.toInt()).onSelected();
    }

  }
  @override
  bool shouldRelayout(_AllSectionsLayout oldDelegate) {
    return tColumnToRow != oldDelegate.tColumnToRow
      || cardCount != oldDelegate.cardCount
      || selectedIndex != oldDelegate.selectedIndex;
  }
}

class _AllSectionsView extends AnimatedWidget {
  _AllSectionsView({
    Key key,
    this.sectionIndex,
    @required this.sections,
    @required this.sectionView,
    @required this.selectedIndex,
    this.minHeight,
    this.midHeight,
    this.maxHeight,
    @required this.iconOpacity,
    @required this.titleOpacity,
    @required this.secionCardXPaddingFraction,
    @required this.secionTitleXPaddingFraction,
    this.iconRowYTranslate,
    this.sectionTitleRowYTranslate,
    this.sectionTitleColumnYTranslate,
    this.sectionTitleStyle,
    this.sectionTitleShadowStyle,
    this.iconColumnXLayoutRatio,
    this.iconColumnYLayoutRatio,
    this.sectionCards = const <Widget>[],
  }) : assert(sections != null),
       assert(sectionCards != null),
       assert(sectionCards.length == sections.length),
       assert((iconOpacity != null) && (titleOpacity != null)),
       assert(sectionIndex >= 0 && sectionIndex < sections.length),
       assert(selectedIndex != null),
       assert(selectedIndex.value >= 0.0 && selectedIndex.value < sections.length.toDouble()),
       assert((secionCardXPaddingFraction >= 0.0) && (secionCardXPaddingFraction <= 1.0)),
       assert((secionTitleXPaddingFraction >= 0.0) && (secionTitleXPaddingFraction <= 1.0)),
       assert((iconColumnXLayoutRatio >= 0.0) && (iconColumnXLayoutRatio <= 1.0)),
       assert((iconColumnYLayoutRatio >= 0.0) && (iconColumnYLayoutRatio <= 1.0)),
       super(key: key, listenable: selectedIndex);

  final int sectionIndex;
  final SectionView sectionView;
  final List<Section> sections;
  final ValueNotifier<double> selectedIndex;
  final double minHeight;
  final double midHeight;
  final double maxHeight;
  final double iconOpacity;
  final double titleOpacity;
  final double iconRowYTranslate;
  final double secionCardXPaddingFraction;
  final double secionTitleXPaddingFraction;
  final double sectionTitleRowYTranslate;
  final double sectionTitleColumnYTranslate;
  final TextStyle sectionTitleStyle;
  final TextStyle sectionTitleShadowStyle;
  final double iconColumnXLayoutRatio;
  final double iconColumnYLayoutRatio;
  final List<Widget> sectionCards;

  double _selectedIndexDelta(int index) {
    return (index.toDouble() - selectedIndex.value).abs().clamp(0.0, 1.0);
  }

  Widget _build(BuildContext context, BoxConstraints constraints) {
    final Size size = constraints.biggest;

    // The layout's progress from from a column to a row. Its value is
    // 0.0 when size.height equals the maxHeight, 1.0 when the size.height
    // equals the midHeight.
    final double tColumnToRow =
      1.0 - ((size.height - midHeight) /
             (maxHeight - midHeight)).clamp(0.0, 1.0);


    // The layout's progress from from the midHeight row layout to
    // a minHeight row layout. Its value is 0.0 when size.height equals
    // midHeight and 1.0 when size.height equals minHeight.
    final double tCollapsed =
      1.0 - ((size.height - minHeight) /
             (midHeight - minHeight)).clamp(0.0, 1.0);

    double _indicatorOpacity(int index) {
      return 1.0 - _selectedIndexDelta(index) * (1 - iconOpacity);
    }

    double _titleOpacity(int index) {
      return 1.0 - _selectedIndexDelta(index) * tColumnToRow * (1 - titleOpacity);
    }

    double _titleScale(int index) {
      return 1.0 - _selectedIndexDelta(index) * tColumnToRow * 0.15;
    }

    final List<Widget> children = List<Widget>.from(sectionCards);

    for (int index = 0; index < sections.length; index++) {
      final Section section = sections[index];
      children.add(LayoutId(
        id: 'title$index',
        child: SectionTitle(
          title: section.title,
          scale: _titleScale(index),
          opacity: _titleOpacity(index),
          sectionTitleStyle: sectionTitleStyle,
          sectionTitleShadowStyle: sectionTitleShadowStyle,
        ),
      ));
    }

    for (int index = 0; index < sections.length; index++) {
      final Section section = sections[index];
      children.add(LayoutId(
        id: 'indicator$index',
        child: SectionIndicator(
          icon: section.icon,
          opacity: _indicatorOpacity(index),
        ),
      ));
    }

    return CustomMultiChildLayout(
      delegate: _AllSectionsLayout(
        context: context,
        sectionView: sectionView,
        translation: Alignment((selectedIndex.value - sectionIndex) * 2.0 - 1.0, -1.0),
        tColumnToRow: tColumnToRow,
        tCollapsed: tCollapsed,
        cardCount: sections.length,
        selectedIndex: selectedIndex.value,
        secionCardXPaddingFraction: secionCardXPaddingFraction,
        secionTitleXPaddingFraction: secionTitleXPaddingFraction,
        sectionTitleRowYTranslate: sectionTitleRowYTranslate,
        sectionTitleColumnYTranslate: sectionTitleColumnYTranslate,
        iconColumnXLayoutRatio: iconColumnXLayoutRatio,
        iconColumnYLayoutRatio: iconColumnYLayoutRatio,
        iconRowYTranslate: iconRowYTranslate
      ),
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: _build);
  }
}

// Support snapping scrolls to the midScrollOffset: the point at which the
// app bar's height is _kAppBarMidHeight and only one section heading is
// visible.
class _SnappingScrollPhysics extends ClampingScrollPhysics {
  const _SnappingScrollPhysics({
    ScrollPhysics parent,
    @required this.midScrollOffset,
  }) : assert(midScrollOffset != null),
       super(parent: parent);

  final double midScrollOffset;

  @override
  _SnappingScrollPhysics applyTo(ScrollPhysics ancestor) {
    return _SnappingScrollPhysics(parent: buildParent(ancestor), midScrollOffset: midScrollOffset);
  }

  Simulation _toMidScrollOffsetSimulation(double offset, double dragVelocity) {
    final double velocity = math.max(dragVelocity, minFlingVelocity);
    return ScrollSpringSimulation(spring, offset, midScrollOffset, velocity, tolerance: tolerance);
  }

  Simulation _toZeroScrollOffsetSimulation(double offset, double dragVelocity) {
    final double velocity = math.max(dragVelocity, minFlingVelocity);
    return ScrollSpringSimulation(spring, offset, 0.0, velocity, tolerance: tolerance);
  }

  @override
  Simulation createBallisticSimulation(ScrollMetrics position, double dragVelocity) {
    final Simulation simulation = super.createBallisticSimulation(position, dragVelocity);
    final double offset = position.pixels;

    if (simulation != null) {
      // The drag ended with sufficient velocity to trigger creating a simulation.
      // If the simulation is headed up towards midScrollOffset but will not reach it,
      // then snap it there. Similarly if the simulation is headed down past
      // midScrollOffset but will not reach zero, then snap it to zero.
      final double simulationEnd = simulation.x(double.infinity);
      if (simulationEnd >= midScrollOffset)
        return simulation;
      if (dragVelocity > 0.0){
        return _toMidScrollOffsetSimulation(offset, dragVelocity);
      }
      if (dragVelocity < 0.0){
        return _toZeroScrollOffsetSimulation(offset, dragVelocity);
      }
    } else {
      // The user ended the drag with little or no velocity. If they
      // didn't leave the offset above midScrollOffset, then
      // snap to midScrollOffset if they're more than halfway there,
      // otherwise snap to zero.
      final double snapThreshold = midScrollOffset / 2.0;
      if (offset >= snapThreshold && offset < midScrollOffset){
        return _toMidScrollOffsetSimulation(offset, dragVelocity);
      }
      if (offset > 0.0 && offset < snapThreshold){
        return _toZeroScrollOffsetSimulation(offset, dragVelocity);
      }
    }
    return simulation;
  }
}

class SectionView extends StatefulWidget {
  SectionView({
    Key key,
    @required this.sections,
    this.iconOpacity = 0.3,
    this.titleOpacity = 0.3,
    this.appBarElevation = 0,
    this.backgroundColor = _kAppBackgroundColor,
    this.secionCardXPaddingFraction = 0.2,
    this.secionTitleXPaddingFraction = 0.1,
    this.sectionTitleRowYTranslate = 0,
    this.sectionTitleColumnYTranslate = 0,
    this.iconColumnXLayoutRatio = 0.95,
    this.iconColumnYLayoutRatio = 0.5,
    this.iconRowYTranslate = 0,
    this.appBarIsCollapsed = false,
    this.appBarIsExpanded = true,
    this.onAppBarCollapsed,
    this.onAppBarExpanded
  })
  : assert(sections != null),
    assert((secionCardXPaddingFraction >= 0.0) && (secionCardXPaddingFraction <= 1.0)),
    assert((secionTitleXPaddingFraction >= 0.0) && (secionTitleXPaddingFraction <= 1.0)),
    assert((iconColumnXLayoutRatio >= 0.0) && (iconColumnXLayoutRatio <= 1.0)),
    assert((iconColumnYLayoutRatio >= 0.0) && (iconColumnYLayoutRatio <= 1.0)),
     super(key: key);
  final List<Section> sections;
  final double appBarElevation;
  final Color backgroundColor;
  final double iconOpacity;
  final double titleOpacity;
  final double secionCardXPaddingFraction;
  final double secionTitleXPaddingFraction;
  final double sectionTitleRowYTranslate;
  final double sectionTitleColumnYTranslate;
  final double iconColumnXLayoutRatio;
  final double iconColumnYLayoutRatio;
  final double iconRowYTranslate;
  final Function onAppBarCollapsed;
  final Function onAppBarExpanded;
  bool appBarIsCollapsed;
  bool appBarIsExpanded;

  @override
  _SectionViewState createState() => _SectionViewState(
    sectionView: this,
    sections: sections,
    appBarElevation: appBarElevation,
    backgroundColor: backgroundColor,
    iconOpacity: iconOpacity,
    titleOpacity: titleOpacity,
    secionCardXPaddingFraction: secionCardXPaddingFraction,
    secionTitleXPaddingFraction: secionTitleXPaddingFraction,
    sectionTitleRowYTranslate: sectionTitleRowYTranslate,
    sectionTitleColumnYTranslate: sectionTitleColumnYTranslate,
    iconColumnXLayoutRatio: iconColumnXLayoutRatio,
    iconColumnYLayoutRatio: iconColumnYLayoutRatio,
    iconRowYTranslate: iconRowYTranslate
    );
}

class _SectionViewState extends State<SectionView> {
  final SectionView sectionView;
  final List<Section> sections;
  final double appBarElevation;
  final Color backgroundColor;
  final double iconOpacity;
  final double titleOpacity;
  final double secionCardXPaddingFraction;
  final double secionTitleXPaddingFraction;
  final double sectionTitleRowYTranslate;
  final double sectionTitleColumnYTranslate;
  final double iconColumnXLayoutRatio;
  final double iconColumnYLayoutRatio;
  final double iconRowYTranslate;
  final ScrollController _scrollController = ScrollController();
  final PageController _headingPageController = PageController();
  final PageController _contentsPageController = PageController();
  PageView sectionHeadingsPage;
  ScrollPhysics _headingScrollPhysics = const NeverScrollableScrollPhysics();
  ValueNotifier<double> selectedIndex = ValueNotifier<double>(0.0);

  _SectionViewState({
    @required this.sectionView,
    @required this.sections,
    this.appBarElevation,
    this.backgroundColor,
    this.iconOpacity,
    this.titleOpacity,
    this.secionCardXPaddingFraction,
    this.secionTitleXPaddingFraction,
    this.sectionTitleRowYTranslate,
    this.sectionTitleColumnYTranslate,
    this.iconColumnXLayoutRatio,
    this.iconColumnYLayoutRatio,
    this.iconRowYTranslate
    });

  @override
  Widget build(BuildContext context) {
    return Builder(
        // Insert an element so that _buildSectionView can find the PrimaryScrollController.
        builder: _buildSectionView,
      );
  }

  // Only enable paging for the heading when the user has scrolled to midScrollOffset.
  // Paging is enabled/disabled by setting the heading's PageView scroll physics.
  bool _handleScrollNotification(ScrollNotification notification, double midScrollOffset) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      final ScrollPhysics physics = _scrollController.position.pixels >= midScrollOffset
       ? const PageScrollPhysics()
       : const NeverScrollableScrollPhysics();
      if (physics != _headingScrollPhysics) {
        setState(() {
          _headingScrollPhysics = physics;
        });
      }
    }
    return false;
  }

  void _maybeScroll(double midScrollOffset, int pageIndex, double xOffset) {
    if (_scrollController.offset < midScrollOffset) {
      // Scroll the overall list to the point where only one section card shows.
      // At the same time scroll the PageViews to the page at pageIndex.
      _headingPageController.animateToPage(pageIndex, curve: _kScrollCurve, duration: _kScrollDuration);
      _scrollController.animateTo(midScrollOffset, curve: _kScrollCurve, duration: _kScrollDuration);
    } else {
      // One one section card is showing: scroll one page forward or back.
      final double centerX = _headingPageController.position.viewportDimension / 2.0;
      final int newPageIndex = xOffset > centerX ? pageIndex + 1 : pageIndex - 1;
      _headingPageController.animateToPage(newPageIndex, curve: _kScrollCurve, duration: _kScrollDuration);
    }
  }

  bool _handlePageNotification(ScrollNotification notification, PageController leader, PageController follower) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      selectedIndex.value = leader.page;
      if (follower.page != leader.page)
        follower.position.jumpToWithoutSettling(leader.position.pixels); // ignore: deprecated_member_use
    }
    return false;
  }

  Iterable<Widget> _allHeadingItems(double maxHeight, double midScrollOffset) {
    final List<Widget> sectionCards = <Widget>[];
    for(int index = 0; index < sections.length; index++) {
      sectionCards.add(LayoutId(
        id: 'card$index',
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: sections[index].card,
          onTapUp: (TapUpDetails details) {
            final double xOffset = details.globalPosition.dx;
            setState(() {
              _maybeScroll(midScrollOffset, index, xOffset);
            });
          }
        )
      ));
    }

    final List<Widget> headings = <Widget>[];
    for(int index = 0; index< sections.length; index++ ) {
      headings.add(Container(
          color: backgroundColor,
          child: ClipRect(

            child: _AllSectionsView(
              sectionView: sectionView,
              sectionIndex: index,
              sections: sections,
              selectedIndex: selectedIndex,
              minHeight: _kAppBarMinHeight,
              midHeight: _kAppBarMidHeight,
              maxHeight: maxHeight,
              iconOpacity: iconOpacity,
              titleOpacity: titleOpacity,
              secionCardXPaddingFraction: secionCardXPaddingFraction,
              secionTitleXPaddingFraction: secionTitleXPaddingFraction,
              sectionTitleRowYTranslate: sectionTitleRowYTranslate,
              sectionTitleColumnYTranslate: sectionTitleColumnYTranslate,
              iconColumnXLayoutRatio: iconColumnXLayoutRatio,
              iconColumnYLayoutRatio: iconColumnYLayoutRatio,
              iconRowYTranslate: iconRowYTranslate,
              sectionCards: sectionCards,
            ),
          ),
        )
      );
    }
    return headings;
  }

  Widget _buildSectionView(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double statusBarHeight = mediaQueryData.padding.top;
    final double bottomHeight = mediaQueryData.padding.bottom;
    final double screenHeight = mediaQueryData.size.height;
    final double appBarMaxHeight = screenHeight - statusBarHeight;

    // The scroll offset that reveals the appBarMidHeight appbar.
    final double appBarMidScrollOffset = statusBarHeight + appBarMaxHeight - _kAppBarMinHeight;


    return 
    SizedBox.expand(
        child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              return _handleScrollNotification(notification, appBarMidScrollOffset);
            },
            child: CustomScrollView(
              semanticChildCount: 50,
              controller: _scrollController,
              physics: _SnappingScrollPhysics(midScrollOffset: appBarMidScrollOffset),
              slivers: <Widget>[
                // Start out below the status bar, gradually move to the top of the screen.
                _StatusBarPaddingSliver(
                  maxHeight: statusBarHeight,
                  scrollFactor: 7.0,
                ),
                // Section Headings
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: _kAppBarMinHeight,
                    maxHeight: appBarMaxHeight,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        return _handlePageNotification(notification, _headingPageController, _contentsPageController);
                      },
                      child: PageView(
                        physics: _headingScrollPhysics,
                        controller: _headingPageController,
                        children: _allHeadingItems(appBarMaxHeight, appBarMidScrollOffset),
                      ),
                    ),
                  ),
                ),
                // Details
                SliverToBoxAdapter(
                  child: SizedBox(
                    //height: MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top-MediaQuery.of(context).padding.top+50,
                    height:screenHeight-_kAppBarMinHeight,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification notification) {
                        return _handlePageNotification(notification, _contentsPageController, _headingPageController);
                      },
                      child: PageView(
                        controller: _contentsPageController,
                        children: sections.map<Widget>((Section section) {
                          return section.content;
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

void _onSectionChanged(List<Section> sections, int selectedIndex) {
}
