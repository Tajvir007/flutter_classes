import 'package:flutter/material.dart';
import 'package:flutter_classes/module%2012/password.dart';

class StatefulLifecycle extends StatefulWidget {
   StatefulLifecycle({super.key}){
     print('1. Constructor'); 
   }

  @override
  State<StatefulLifecycle> createState() {
     print('2. CreateState');
     return _StatefulLifecycleState();
  }
}

class _StatefulLifecycleState extends State<StatefulLifecycle> {

  String name = 'Demo';
  Color bgColor = Colors.red;

  // initState
  @override
  void initState() {
    // TODO: implement initState
    print('3. initState');

    bgColor = Colors.green;
    name = 'sejan';

    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print('4. didChangeDependencies');

    bgColor = Colors.pink;
    name = 'tajvir';

    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print('5. deactivate');
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Lifecycle'),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell( // InkWell: Tappable, it is used to handle tap events.

              onTap: (){
                setState(() {
                  print('setState called');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Password()));
                });
              },

              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: bgColor,
                ),
                child: Center(
                  child: Text('The text is: $name',style: TextStyle(
                    fontSize: 25
                  ),),
                ),
              ),
            ),
          ),
        ],
      ),
      
    );
  }
}
