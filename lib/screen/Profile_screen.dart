import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/widgets/main_drawer.dart';
import 'package:social_media_ui/widgets/posts_widget.dart';
import 'package:social_media_ui/widgets/profile_cliper.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  PageController _yourPostsPageControll;
  PageController _yourPostsFavPageControll;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _yourPostsPageControll =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _yourPostsFavPageControll =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileScreenCliper(),
                  child: Image(
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(currentUser.backgroundImageUrl),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      _globalKey.currentState.openDrawer();
                    },
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 110.0,
                        width: 110.0,
                        fit: BoxFit.cover,
                        image: AssetImage(currentUser.profileImageUrl),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              currentUser.name,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Following",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      currentUser.following.toString(),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Followers",
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      currentUser.followers.toString(),
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
            PostsWidget(
                _yourPostsPageControll, "your posts", currentUser.posts),
            PostsWidget(
                _yourPostsFavPageControll, "Favourites", currentUser.favorites),
            SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
