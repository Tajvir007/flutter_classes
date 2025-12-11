import 'package:flutter/material.dart';

class ListV extends StatelessWidget {
  const ListV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),

      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index){
          return Card( // Card:
            child: ListTile( //
              title: Text("Sejan"),
              subtitle: Text("016-xxxxxxxx"),
              leading: Icon(Icons.phone, color: Colors.green,),
              trailing: Icon(Icons.delete, color: Colors.red,),
            ),
          );
        },
      ),

    );
  }
}
