import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:iconsax/iconsax.dart';
import '../constants/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              _getAppBar(),
              SliverPadding(
                padding: EdgeInsets.only(bottom: 24),
                sliver: SliverToBoxAdapter(
                  child: _getProfileInfo(context),
                ),
              ),
              SliverToBoxAdapter(
                child: _getStoryList(),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TabBarViewDelegate(
                  TabBar(
                    // padding: EdgeInsets.only(top: 56),
                    indicatorColor: primaryColor,
                    tabs: [
                      Tab(
                        icon: Icon(Iconsax.gallery),
                      ),
                      Tab(
                        icon: Icon(Iconsax.save_2),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              _getTabBarView(),
              _getTabBarView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      height: 98,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return index == 0
                ? _addStoryContainer(context)
                : _getStoryContainer(context, index);
          },
        ),
      ),
    );
  }

  Widget _getStoryContainer(BuildContext context, int index) {
    List<String> storyTitle = ["Flutter VIP", "Support", "Shoping", "Projects"];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Container(
              height: 58,
              width: 58,
              child: Image(
                image: AssetImage("images/story$index.png"),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            storyTitle[index - 1],
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(16),
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
            'New',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _getProfileInfo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getProfileHeader(context),
          SizedBox(
            height: 14,
          ),
          Text(
            "💻 Android | Flutter",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "🚀 Share My journey",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            "🐱 See My Projects Here 👇",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Iconsax.link),
              SizedBox(
                width: 6,
              ),
              Text(
                "github.com/ariaramin",
                style: TextStyle(
                  fontFamily: "GB",
                  fontSize: 14,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Iconsax.briefcase),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Developer",
                  style: TextStyle(
                    fontFamily: "GB",
                    fontSize: 12,
                    color: greyColor,
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Icon(Iconsax.location),
                SizedBox(
                  width: 6,
                ),
                Text(
                  "Iran",
                  style: TextStyle(
                    fontFamily: "GB",
                    fontSize: 12,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "12",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Posts",
                style: TextStyle(
                  fontFamily: "GB",
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Text(
                "50K",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Followers",
                style: TextStyle(
                  fontFamily: "GB",
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Text(
                "285",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Following",
                style: TextStyle(
                  fontFamily: "GB",
                  fontSize: 12,
                  color: greyColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 46,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Follow'),
                  ),
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Expanded(
                child: Container(
                  height: 46,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      side: BorderSide(
                        color: greyColor,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      'Message',
                      style: TextStyle(
                        fontFamily: 'GB',
                        fontSize: 16,
                        color: whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getTabBarView() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'images/posts/self_post$index.png',
                    fit: BoxFit.cover,
                  ),
                );
              },
              childCount: 6,
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
                QuiltedGridTile(1, 1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getAppBar() {
    return SliverAppBar(
      expandedHeight: 116,
      backgroundColor: blackColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          "images/profile_appbar_image.png",
          fit: BoxFit.cover,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(16),
        child: Container(
          height: 16,
          decoration: BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getProfileHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 68,
          height: 68,
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image(
              image: AssetImage("images/profile.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          height: 68,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "arsenixdev",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Mobile Developer",
                  style: TextStyle(
                    fontFamily: "GB",
                    fontSize: 14,
                    color: greyColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Icon(Iconsax.edit),
      ],
    );
  }
}

class TabBarViewDelegate extends SliverPersistentHeaderDelegate {
  TabBar _tabBar;

  TabBarViewDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: blackColor,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
