import 'package:flutter/material.dart';
import 'package:gameappui/konstants.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var WIDTH = MediaQuery.of(context).size.width;
    var HEIGHT = MediaQuery.of(context).size.height;
    return Container(
      color: kPrimaryColor,
      width: WIDTH,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DrawerHeader(
            child: Container(
              child: Column(children: const [
                CircleAvatar(
                  radius: 50,
                ),
                Text(
                  'Muhammed Rashid',
                  style: TextStyle(color: kDullWhite),
                ),
                Text(
                  '@rashidotz',
                  style: TextStyle(color: kDullWhite),
                )
              ]),
            ),
          ),
          Column(
            children: [
              DrwerListTile(
                title: 'Home',
                icon: Icons.home,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              DrwerListTile(
                title: 'Profile',
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              DrwerListTile(
                  title: 'Settings', icon: Icons.settings, onTap: () {}),
              DrwerListTile(
                  title: 'Favorites', icon: Icons.favorite, onTap: () {}),
              DrwerListTile(title: 'Games', icon: Icons.gamepad, onTap: () {}),
              DrwerListTile(
                  title: 'Messages', icon: Icons.message, onTap: () {})
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                tooltip: 'Logout',
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  size: 40,
                  color: kDullWhite,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.help,
                  size: 40,
                  color: kDullWhite,
                ),
              ),
              SizedBox(
                width: WIDTH * 0.15,
              ),
            ],
          ),
          const Text(
            'Version 1.0.0',
            style: TextStyle(color: kDullWhite),
          ),
          SizedBox(
            height: HEIGHT * 0.001,
          ),
        ],
      ),
    );
  }
}

class DrwerListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;
  const DrwerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedTileColor: Colors.white,
      leading: Icon(
        icon,
        color: kDullWhite,
        size: 35,
      ),
      title: Text(
        title,
        style: TextStyle(color: kDullWhite, fontSize: 18),
      ),
    );
  }
}
