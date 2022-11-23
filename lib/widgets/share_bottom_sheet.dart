import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:moodinger/constants/constants.dart';

class ShareBottomSheet extends StatefulWidget {
  ShareBottomSheet({super.key});

  @override
  State<ShareBottomSheet> createState() => _ShareBottomSheetState();
}

class _ShareBottomSheetState extends State<ShareBottomSheet> {
  int? _selectedUserIndex;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
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
          child: _getContent(context),
        ),
      ),
    );
  }

  Widget _getContent(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getTopSection(context),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _selectedUserIndex = index;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _selectedUserIndex == index
                            ? DottedBorder(
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
                                    height: 50,
                                    width: 50,
                                    child: Image(
                                      image: AssetImage(
                                          "images/users/user$index.png"),
                                    ),
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                child: Container(
                                  height: 58,
                                  width: 58,
                                  child: Image(
                                    image: AssetImage(
                                        "images/users/user$index.png"),
                                  ),
                                ),
                              ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "user$index",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  );
                },
                childCount: 6,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 14,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 72),
            ),
          ],
        ),
        _selectedUserIndex != null
            ? Positioned(
                bottom: 14,
                child: SizedBox(
                  height: 46,
                  width: 132,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Send'),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }

  Widget _getTopSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18, right: 18, bottom: 18),
      child: Column(
        children: [
          Container(
            height: 6,
            width: 52,
            margin: EdgeInsets.only(top: 8, bottom: 18),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(98),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Share",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Icon(Iconsax.share),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(14),
              ),
              color: Color.fromRGBO(255, 255, 255, 0.4),
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
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
