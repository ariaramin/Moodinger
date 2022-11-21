import 'package:flutter/material.dart';
import 'package:moodinger/constants/constants.dart';

import '../model/enums/activity_status.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: blackColor,
              child: TabBar(
                controller: _tabController,
                labelStyle: Theme.of(context).textTheme.bodyMedium,
                indicatorColor: primaryColor,
                tabs: [
                  Tab(text: 'Following'),
                  Tab(text: 'You'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getList(),
                  _getList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getList() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 14, top: 12),
            child: Text(
              'New',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _getListItem(ActivityStatus.likes);
          }, childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 14, top: 12),
            child: Text(
              'Today',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _getListItem(ActivityStatus.followBack);
          }, childCount: 5),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _getListItem(ActivityStatus.following);
          }, childCount: 2),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 14, top: 12),
            child: Text(
              'This Week',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return _getListItem(ActivityStatus.following);
          }, childCount: 5),
        )
      ],
    );
  }

  Widget _getListItem(ActivityStatus status) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          status == ActivityStatus.likes
              ? Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: primaryColor,
                  ),
                )
              : Container(),
          SizedBox(
            width: 6,
          ),
          Container(
            width: 46,
            height: 46,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: AssetImage("images/profile.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'arsenixdev',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    status == ActivityStatus.likes
                        ? "Liked your"
                        : 'Started following',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12,
                      color: greyColor,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    status == ActivityStatus.likes ? "post" : 'you',
                    style: TextStyle(
                      fontFamily: 'GM',
                      fontSize: 12,
                      color: greyColor,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    '3min',
                    style: TextStyle(
                      fontFamily: 'GB',
                      fontSize: 12,
                      color: greyColor,
                    ),
                  )
                ],
              ),
            ],
          ),
          Spacer(),
          _getActionActivityRow(status),
        ],
      ),
    );
  }

  Widget _getActionActivityRow(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followBack:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            textStyle: Theme.of(context).textTheme.bodySmall,
          ),
          onPressed: () {},
          child: Text('Follow'),
        );
      case ActivityStatus.likes:
        return SizedBox(
          height: 46,
          width: 46,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('images/item1.png'),
            ),
          ),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: greyColor,
              width: 2,
            ),
          ),
          child: Text(
            'Message',
            style: TextStyle(
              fontFamily: 'GB',
              fontSize: 12,
              color: greyColor,
            ),
          ),
        );
    }
  }
}
