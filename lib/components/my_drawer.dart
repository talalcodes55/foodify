import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodify/components/my_drawer_tile.dart';
import 'package:foodify/pages/account_page.dart';
import 'package:foodify/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logOut() {
    final auth = FirebaseAuth.instance;
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80, bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FaIcon(FontAwesomeIcons.burger,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary),
                Text(
                  'Foodify',
                  style: TextStyle(
                      fontFamily: 'sf_pro_display_regular',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Divider(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          MyDrawerTile(
              text: 'Home',
              icon: FontAwesomeIcons.house,
              onTap: () => Navigator.pop(context)),
          MyDrawerTile(
              text: 'Settings',
              icon: FontAwesomeIcons.gear,
              onTap: () => {
                    Navigator.pop(context),
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const SettingsPage()))
                  }),
          MyDrawerTile(
              text: 'Account', icon: FontAwesomeIcons.solidCircleUser, onTap: () => {Navigator.pop(context), Navigator.push(context, CupertinoPageRoute(builder: (context) => const AccountPage()))}),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Divider(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          MyDrawerTile(
              text: 'Logout',
              icon: FontAwesomeIcons.arrowRightFromBracket,
              onTap: () {
                logOut();
              }),
          // const SizedBox(
          //   height: 20,
          // )
        ],
      ),
    );
  }
}
