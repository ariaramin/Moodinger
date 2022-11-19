import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/constants.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      // appBar: _getAppBar(context),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getSearchBox(context),
            ),
            SliverToBoxAdapter(
              child: _getCategoryList(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/item$index.png'),
                      ),
                    );
                  },
                  childCount: 10,
                ),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCategoryList() {
    List<String> categoryList = [
      "All",
      "Sports",
      "Technology",
      "Nature",
      "Art",
      "Cryptocurrency",
    ];
    return Container(
      height: 34,
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: blackLightColor,
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  categoryList[index],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getSearchBox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 12,
        right: 12,
        top: 20,
        bottom: 14,
      ),
      child: Container(
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
          color: blackLightColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(Iconsax.search_normal_1),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
              Icon(Iconsax.scan),
            ],
          ),
        ),
      ),
    );
  }
}
