import 'package:flutter/material.dart';
import 'package:spotify/pages/profile_page.dart';
import 'package:spotify/pages/settings_page.dart';
import 'package:spotify/services/auth/service_auth.dart';
import 'package:spotify/widgets/drawer_tile.dart';

class MyDrawer extends StatelessWidget { 
  MyDrawer({super.key});


  final _auth = AuthService();

  void logout() {
    _auth.logout();
  }
  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Padding(  
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Icon(
                  Icons.person,
                  size: 72,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Divider(
                indent: 25,
                endIndent: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),
              DrawerTile(
                title: "Home", 
                icon: Icons.home, 
                onTap: () {
                  Navigator.pop(context);
                }
              ),

              DrawerTile(
                title: "Profile", 
                icon: Icons.person,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(uid: _auth.getCurrentUid()),));
                }
              ),

              DrawerTile(
                title: "Settings", 
                icon: Icons.settings, 
                onTap: () {
                  Navigator.pop(context);
          
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(),
                    ),
                  );
                }
              ),

              Spacer(),
              DrawerTile(
                title: "Logout", 
                icon: Icons.logout, 
                onTap: logout
              )
            ],
          ),
        ),
      )
    );
  }
}