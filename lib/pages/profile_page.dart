import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:spotify/models/user.dart';
import 'package:spotify/services/auth/service_auth.dart';
import 'package:spotify/services/database/database_provider.dart';
import 'package:spotify/widgets/bio_box.dart';
import 'package:spotify/widgets/input_alert_box.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);

  UserProfile? user;
  String currentUserId = AuthService().getCurrentUid();

  final bioTextController = TextEditingController();

  bool _isLoading = true;

  void initState() {
    super.initState();

    loadUser();
  }

  Future<void> loadUser() async {
    user = await databaseProvider.userProfile(widget.uid);
    setState(() {
      _isLoading = false;
    });
  }

  void _showEditBioBox() {
    showDialog(
        context: context,
        builder: (context) => InputAlertBox(
              textContoller: bioTextController,
              hintText: "Edit bio",
              onPressedText: "Save",
              onPressed: saveBio,
            ));
  }

  Future<void> saveBio() async {
    setState(() {
      _isLoading = true;
    });

    await databaseProvider.updateBio(bioTextController.text);

    await loadUser();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: Text(_isLoading ? '' : user!.name),
          foregroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView(
            children: [
              Center(
                  child: Text(_isLoading ? '' : '@${user!.username}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary))),
              SizedBox(height: 25),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(25)),
                  padding: EdgeInsets.all(25),
                  child: Icon(
                    Icons.person,
                    size: 72,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bio"),
                  GestureDetector(
                    onTap: _showEditBioBox,
                    child: Icon(Icons.settings,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              BioBox(text: _isLoading ? '...' : user!.bio),
            ],
          ),
        ));
  }
}
