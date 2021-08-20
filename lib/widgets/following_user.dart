import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/model/user_model.dart';

class FollowingUser extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            "Following",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
              letterSpacing: 2.0,
            ),
          ),
        ),
        Container(
          height: 80.0,
          child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (_, index) {
                User user = users[index];
                return Container(
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                    child: ClipOval(
                      child: Image(
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                          image: AssetImage(user.profileImageUrl)),
                    ));
              }),
        ),
      ],
    );
  }
}
