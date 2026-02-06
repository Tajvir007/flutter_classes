import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

class VotingPage extends StatelessWidget {
  const VotingPage({super.key});

  @override
  Widget build(BuildContext context) {




    voteParticipant(String id){

      FirebaseFirestore.instance.collection('participants').doc(id).update({

        'votes' : FieldValue.increment(1)

      }
      );

    }




    /**
     * 1. StreamBuilder: Firestore থেকে continuous data stream আসবে. ডেটা update হলেই widget rebuild হবে
     * 2. QuerySnapshot: একটা পুরো collection-এর snapshot. এর ভিতরে অনেকগুলো DocumentSnapshot থাকে
     *
     */

    return StreamBuilder<QuerySnapshot>(
      // Firestore এর participants collection .snapshots() → live stream তৈরি করে. add / update / delete হলেই নতুন snapshot পাঠায়
      // Firestore এর participants collection থেকে live data stream
      stream: FirebaseFirestore.instance.collection('participants').snapshots(),
      builder: (context, snapshot) { // snapshot এর ভিতরে থাকে: data → actual Firestore data ,error → permission / network issue, connectionState → loading / active

        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }

        final participant = snapshot.data!.docs; // snapshot.data → পুরো QuerySnapshot ,.docs → documents এর List

        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemCount: 2,
            itemBuilder: (context, index){


              final doc = participant[index];
              // document এর data map আকারে নেওয়া
              final data = doc.data() as Map<String, dynamic>; // Document data map এ convert করা

              return Card(
                child: Column(
                  children: [
                    Image.network(data['imageUrl']),
                    Text(data['name']?? 'Unknown', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    Text('Votes: ${data['votes']}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: ()=>voteParticipant(doc.id), child: Text('Vote')),
                    )
                  ],
                ),
              );
            });
      }
    );
  }
}
