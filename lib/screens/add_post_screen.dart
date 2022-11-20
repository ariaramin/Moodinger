import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moodinger/constants/constants.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: _getAppBar(context),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          _getScrollViewSection(context),
          _getBottomSection(context),
        ],
      ),
    );
  }

  Container _getBottomSection(BuildContext context) {
    return Container(
      height: 72,
      width: double.infinity,
      decoration: BoxDecoration(
        color: blackLightColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 12,
          right: 14,
          left: 14,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Draft',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'Gallery',
              style: TextStyle(
                color: primaryColor,
                fontSize: 16,
                fontFamily: 'GB',
              ),
            ),
            Text(
              'Take',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getScrollViewSection(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'images/item0.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return index == 0
                    ? DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(14),
                        padding: EdgeInsets.all(4),
                        color: primaryColor,
                        dashPattern: [12, 6],
                        strokeWidth: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.asset(
                              'images/item$index.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'images/item$index.png',
                          fit: BoxFit.cover,
                        ),
                      );
              },
              childCount: 9,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(bottom: 82),
        ),
      ],
    );
  }

  AppBar _getAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: blackColor,
      elevation: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Post',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            width: 8,
          ),
          Icon(Iconsax.arrow_down_1),
          Spacer(),
          Text(
            'Next',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            width: 5,
          ),
          Icon(Iconsax.arrow_right)
        ],
      ),
    );
  }
}
