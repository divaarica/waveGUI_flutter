import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../models/transaction_2.dart';
import 'home_screen.dart';

class Recherche_transactionScreen extends StatefulWidget {
  const Recherche_transactionScreen({super.key});

  @override
  State<Recherche_transactionScreen> createState() => _Recherche_transactionScreenState();
}

List<Transaction_2> transactionList = [
  Transaction_2("ODOUN", "77898999", 20000, "janv.06, 19:21", "Retrait"),
  Transaction_2("LINA", "775555555", 100000, "déc.06, 19:21", "Dépôt"),
  Transaction_2("MODOU", "33999999", 2000, "nov.06, 19:21", "woyofal"),
  Transaction_2("FALL", "771111119", 1000, "nov.06, 19:21", "Retrait"),
  Transaction_2("DJOUNA", "778989999", 80000000, "jnov.06, 19:21","Retrait")
];
class _Recherche_transactionScreenState extends State<Recherche_transactionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: const Text(
                'Envoyer de l\'argent',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.grey[200],
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
              ), // Retirez la virgule supplémentaire ici
            ),
            SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        style: TextStyle(color: Colors.grey),
                        decoration: InputDecoration(
                          hintText: 'Rechercher...',
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search, color: Colors.grey,),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 6.0),
                          focusColor: Colors.grey,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        GestureDetector(
                          child:  Container(
                            width: 105,
                            height: 35,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(8),
                            child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Icons.person, color: Colors.grey[700],),
                                  SizedBox(width: 2.0),
                                  Text('Transferts', style: TextStyle(color: Colors.grey,fontSize: 12, fontWeight: FontWeight.bold,),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            GestureDetector(
                              child:  Container(
                                width: 105,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.all(8),
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.lightbulb, color: Colors.grey[700],),
                                      SizedBox(width: 2.0),
                                      Text('Factures', style: TextStyle(color: Colors.grey,fontSize: 12, fontWeight: FontWeight.bold,),),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                      height: 1000,
                      decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35))),
                      child: ListView.separated(
                          padding: EdgeInsets.only(top: 5.0, left: 10.0, right: 10.0),
                          shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index){
                            Transaction_2 transac = transactionList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${transac.type != "woyofal"? transac.type : ""} ",style: const TextStyle(color: Colors.blue,fontSize: 16, fontWeight: FontWeight.w500),),
                                    Text("${transac.type != "Dépôt"? "-": ""}  ${transac.price.toString()} F",style: const TextStyle(color: Colors.blue,fontSize: 16, fontWeight: FontWeight.w500))
                                  ],
                                ),
                                Text(transac.dateTime.toString(),style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500))
                              ],
                            ),
                          );
                        }, separatorBuilder: (context, index){
                          return const SizedBox(height: 5,);}, itemCount: transactionList.length),
                    )
                  ],

                )
            )
          ],
        ),
      ),
      );
  }
}
