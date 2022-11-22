import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moodinger/widgets/share_bottom_sheet.dart';

import '../constants/constants.dart';

class PostWidget extends StatelessWidget {
  int _index;
  PostWidget(this._index, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 14),
      child: Column(
        children: [
          _getPostHeader(context),
          SizedBox(
            height: 16,
          ),
          _getPostContent(context),
        ],
      ),
    );
  }

  Widget _getPostContent(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.12,
      height: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.12,
                height: MediaQuery.of(context).size.width / 1.12,
                child: Image.asset(
                  'images/posts/post${_index + 1}.png',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            child: _getPostBottom(context),
          ),
        ],
      ),
    );
  }

  Widget _getPostBottom(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          width: MediaQuery.of(context).size.width / 1.25,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 255, 255, 0.5),
                Color.fromRGBO(255, 255, 255, 0.2),
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Iconsax.heart5,
                    color: primaryColor,
                    size: 28,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '2.5 K',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Iconsax.message,
                    size: 28,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    '1.5 K',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: ShareBottomSheet(),
                    ),
                  );
                },
                child: Icon(
                  Iconsax.send_2,
                  size: 28,
                ),
              ),
              Icon(
                Iconsax.save_2,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPostHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    height: 42,
                    width: 42,
                    child: Image(
                      image: AssetImage("images/users/user$_index.png"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _index == 0 ? "Amirahmad" : "user$_index",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Mobile Developer',
                      style: TextStyle(
                        fontFamily: "GM",
                        fontSize: 12,
                        color: greyColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Icon(Iconsax.more),
        ],
      ),
    );
  }
}
