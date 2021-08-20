import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/model/user_model.dart';
import 'package:social_media_ui/widgets/following_user.dart';
import 'package:social_media_ui/widgets/main_drawer.dart';
import 'package:social_media_ui/widgets/posts_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        title: Center(
          child: Text(
            "Frenzy",
            style: TextStyle(
                letterSpacing: 10,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 18.0,
          ),
          tabs: [
            Tab(
              text: "Trending",
            ),
            Tab(
              text: "Latest",
            ),
          ],
        ),
      ),
      drawer: MainDrawer(),
      body: ListView(
        children: [
          FollowingUser(),
          PostsWidget(_pageController,"Posts",posts),
        ],
      ),
    );
  }
}
