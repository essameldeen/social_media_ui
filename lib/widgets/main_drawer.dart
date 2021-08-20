import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_ui/data/data.dart';
import 'package:social_media_ui/screen/Profile_screen.dart';
import 'package:social_media_ui/screen/home_screen.dart';
import 'package:social_media_ui/screen/login_screen.dart';

class MainDrawer extends StatelessWidget {
  _buildDrawerItems(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                fit: BoxFit.cover,
                height: 200.0,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
              ),
              Positioned(
                bottom: 20.0,
                left: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 3.0, color: Theme.of(context).primaryColor),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerItems(
            Icon(Icons.dashboard),
            "Home",
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerItems(
            Icon(Icons.chat),
            "Chat",
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => LoginScreen(),
              ),
            ),
          ),
          _buildDrawerItems(
            Icon(Icons.location_on),
            "Map",
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => LoginScreen(),
              ),
            ),
          ),
          _buildDrawerItems(
            Icon(Icons.account_circle),
            "Your Profile",
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(),
              ),
            ),
          ),
          _buildDrawerItems(
            Icon(Icons.settings),
            "Settings",
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => LoginScreen(),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerItems(
                Icon(Icons.directions_run),
                "Logout",
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
