import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:social_media_ui/model/post_model.dart';

class PostsWidget extends StatelessWidget {
  final PageController _pageController;
  final String title;
  final List<Post> posts;

  PostsWidget(this._pageController, this.title, this.posts);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 400.0,
          child: PageView.builder(
            itemCount: posts.length,
            controller: _pageController,
            itemBuilder: (BuildContext ctx, int index) {
              return _buildPost(ctx, index);
            },
          ),
        )
      ],
    );
  }

  Widget _buildPost(BuildContext ctx, int index) {
    Post post = posts[index];
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext contex, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.25)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                width: 300.0,
                height: 400.0,
                image: AssetImage(post.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            bottom: 10.0,
            right: 10.0,
            child: Container(
              height: 110,
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    post.title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    post.location,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_outlined,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            post.likes.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.comment,
                            color: Theme.of(ctx).primaryColor,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            post.comments.toString(),
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
