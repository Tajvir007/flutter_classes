import 'package:flutter/material.dart';

class VotingPage extends StatelessWidget {
  const VotingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: 2,
        itemBuilder: (context, index){
          return Card(
            child: Column(
              children: [
                Image.network('https://images.squarespace-cdn.com/content/v1/62c32effd8601c2f49f1728b/ea99c9b7-2209-4f8f-89e6-0ae25e72a216/March+11+-+Post+3.JPG'),
                Text('Name', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('Votes: 10', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: (){}, child: Text('Vote')),
                )
              ],
            ),
          );
        });
  }
}
