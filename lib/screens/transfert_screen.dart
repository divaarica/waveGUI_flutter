import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransfertScreen extends StatefulWidget {
  const TransfertScreen({super.key});

  @override
  State<TransfertScreen> createState() => _TransfertScreenState();
}

class _TransfertScreenState extends State<TransfertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Envoyer de l'argent"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: TextFormField(
                maxLines: 1, //pas plus de 1 ligne de texte
                decoration: const InputDecoration(
                  labelText: "A",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Favoris", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Contacts", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 15,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                      child: Row(
                        children: [
                          Container(
                            child: Icon(Icons.person, color: Colors.grey, size: 30),
                            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular((30)),
                            ),
                            padding: EdgeInsets.all(5),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            children: [
                              Text("Nom Complet", style: TextStyle(fontWeight: FontWeight.bold,),),
                              Text("77 890 65 74", style: TextStyle(color: Colors.grey),),
                            ],
                          )
                        ],
                      ),
                    );
                  }),

                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
