import 'package:flutter/rendering.dart';

class RealtimeKitActiveParticipantGridDelegate extends SliverGridDelegate {
  final int activeParticipantCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;

  late final int crossAxisCount;
  late final int mainAxisCount;

  RealtimeKitActiveParticipantGridDelegate({
    required this.activeParticipantCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
  }) {
    assert(activeParticipantCount > 0,
        'Active Participants must be greater than 0');

    switch (activeParticipantCount) {
      case 1:
        // Setting crossAxisCount and mainAxisCount to 1 will make the grid
        // render a single grid item taking the full size of the viewport.
        crossAxisCount = mainAxisCount = 1;
        break;
      case 2:
        // Setting crossAxisCount to 1 and mainAxisCount to 2 will make the grid
        // render two grid items taking the half height of the viewport.
        mainAxisCount = 2;
        crossAxisCount = 1;
        break;
      case 3:
      case 4:
        // Setting crossAxisCount to 2 and mainAxisCount to 2 will make the grid
        // arrange the grid items in a 2x2 grid but except it will be the same for
        // 3 items also.
        mainAxisCount = crossAxisCount = 2;
        break;
      default:
        mainAxisCount = 3;
        crossAxisCount = 2;
    }
  }

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    // usableCrossAxisSpacing is the spacing between the grid items in the cross axis
    // that is actually usable. This is because the spacing between the grid items in the
    // cross axis is added to the grid as space between the grid items, and the last grid
    // item in the cross axis does not need spacing after it.
    final usableCrossAxisSpacing =
        constraints.crossAxisExtent - crossAxisSpacing * (crossAxisCount - 1);

    final usableMainAxisSpacing = constraints.viewportMainAxisExtent -
        mainAxisSpacing * (mainAxisCount - 1);

    // mainAxisExtent is the height of the grid item, and crossAxisExtent is the width
    // of the grid item. mainAxisSpacing is the spacing between the grid items in the main
    // axis, and crossAxisSpacing is the spacing between the grid items in the cross axis.
    // The mainAxisExtent and crossAxisExtent are calculated by dividing the viewport
    // main axis extent and cross axis extent by the number of grid items in the main axis
    // and cross axis respectively, and then subtracting the spacing between the grid items
    // in the main axis and cross axis respectively.
    // We subtract spacing from the viewport extent because the spacing is added to the
    // grid as space between the grid items.
    // TODO: test this and remove.
    // double mainAxisExtent =
    //     (constraints.viewportMainAxisExtent / mainAxisCount) - mainAxisSpacing;
    final mainAxisExtent = usableMainAxisSpacing / mainAxisCount;
    final crossAxisExtent = usableCrossAxisSpacing / crossAxisCount;

    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: mainAxisExtent + mainAxisSpacing,
      crossAxisStride: crossAxisExtent + crossAxisSpacing,
      childMainAxisExtent: mainAxisExtent,
      childCrossAxisExtent: crossAxisExtent,
      reverseCrossAxis: false,
    );
  }

  @override
  bool shouldRelayout(covariant RealtimeKitActiveParticipantGridDelegate oldDelegate) {
    return oldDelegate.activeParticipantCount != activeParticipantCount ||
        oldDelegate.crossAxisSpacing != crossAxisSpacing ||
        oldDelegate.mainAxisSpacing != mainAxisSpacing ||
        oldDelegate.crossAxisCount != crossAxisCount ||
        oldDelegate.mainAxisCount != mainAxisCount;
  }
}
