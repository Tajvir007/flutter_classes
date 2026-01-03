import 'package:flutter/material.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class TaskManagerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TaskManagerAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            CircleAvatar(),
            SizedBox(width: 8,),

            // Name and Email
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('Tajvir Ahmed Sejan',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white
                  ),
                ),

                Text('example@mail.com',
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
          AuthController.clearUserData();
          Navigator.pushNamedAndRemoveUntil(context, '/LogIn', (predicate) => false);
        }, icon: Icon(Icons.logout))
      ],

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // kToolbarHeight = AppBar-এর default height (56.0)
}