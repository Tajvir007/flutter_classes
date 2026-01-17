import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/providers/auth_provider.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class TaskManagerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskManagerAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    // final profilePhoto = AuthController.userModel!.photo; // Controller

    // By Provider
    final authProvider = Provider.of<AuthProvider>(context);
    final userModel = authProvider.userModel;

    final profilePhoto = userModel?.photo ?? '';

    return AppBar(
      backgroundColor: Colors.green,

      // 1. To add title in app bar
      title: InkWell(

        // 3. To navigate to update profile screen
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProfileScreen()));
        },

        child: Row(
          children: [

            //
            CircleAvatar(
              child: profilePhoto.isNotEmpty ? Image.memory(jsonDecode(profilePhoto)) :
              Icon(Icons.person)
              ,
            ),
            SizedBox(width: 8,),

            // Name and Email
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
              //  Text('${AuthController.userModel!.firstName} ${AuthController.userModel!.lastName}', // Controller
                Text('${userModel!.firstName} ${userModel!.lastName}',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white
                  ),
                ),

                Text(authProvider.userModel!.email,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.white
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      // 2. To add button in app bar
      actions: [
        IconButton(onPressed: (){
        //  AuthController.clearUserData(); // Controller
          authProvider.logOut();
          Navigator.pushNamedAndRemoveUntil(context, '/LogIn', (predicate) => false);
        }, icon: Icon(Icons.logout))
      ],

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // kToolbarHeight = AppBar-এর default height (56.0)
}