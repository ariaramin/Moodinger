import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moodinger/constants/constants.dart';
import 'package:moodinger/widgets/post_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: _getAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            _getStoryList(),
            PostWidget(),
          ],
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 98,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return index == 0
              ? _addStoryContainer(context)
              : _getStoryContainer(context);
        },
      ),
    );
  }

  Widget _getStoryContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(18),
            padding: EdgeInsets.all(4),
            color: primaryColor,
            dashPattern: [12, 6],
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              child: Container(
                height: 58,
                width: 58,
                child: Image(
                  image: AssetImage("images/profile.png"),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Ariaramin',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _addStoryContainer(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Icon(
                  Iconsax.add,
                  color: primaryColor,
                  size: 32,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Add Story',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: blackColor,
      elevation: 0,
      title: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage("images/moodinger_logo.png"),
            width: 128,
          ),
          Icon(
            Iconsax.direct,
          ),
        ],
      ),
    );
  }
}
