import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:wave_project/screens/home_screen.dart';
import 'package:wave_project/utils/constants.dart';
import 'package:wave_project/screens/recu_screen.dart';


class ResearchScreen extends StatefulWidget{

  const ResearchScreen({super.key});


  @override
  State<StatefulWidget> createState() => _ResearchScreenState();

}

class _ResearchScreenState extends State<ResearchScreen>{

  List<Transaction> transactionList = [
    Transaction("Aho", "776548970", 10000, DateTime.now(), true),
    Transaction("Sackho", "777548972", 10000, DateTime.now(), false),
    Transaction("Gakosso", "778548974", 50000, DateTime.now(), false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade100,
            pinned: true,
            floating: false,
            //forceElevated: true,
            //elevation: 0.0,
            title: const Text("Transactions",
                style: TextStyle(
                  fontSize: 15.0,
                )),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomeScreen();
                  },
                ));
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.black,
                size: 30,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100), // adjust the height as needed
              child: Container(
                height: 100,
                //color: Colors.grey.withOpacity(0.1),
                child: Column(
                  children: [
                    Container(
                      color: Colors.grey.withOpacity(0.2),
                      margin: EdgeInsets.all(10.0),
                      height: 35,
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey.shade600),
                          Text("Rechercher", style: TextStyle(color: Colors.grey.shade600)),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0, top: 0),
                      height: 32,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.2)),
                            ),
                            child: Container(
                              height: 20,
                              width: 95,
                              child: Row(
                                children: [
                                  Icon(Icons.person, color: Colors.grey.shade700, size: 20,),
                                  SizedBox(width: 5,),
                                  Text("Transferts", style: TextStyle(color: Colors.grey.shade700)),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.2)),
                            ),
                            child: Container(
                              height: 20,
                              width: 90,
                              child: Row(
                                children: [
                                  Icon(Icons.lightbulb, color: Colors.grey.shade700, size: 20,),
                                  SizedBox(width: 5,),
                                  Text("Factures", style: TextStyle(color: Colors.grey.shade700)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 600,
              color: Colors.grey.shade100, //pour voir limite du contenair
              child: Container(
                //width: 600,
                  // color: Colors.blue,
                padding: EdgeInsets.only(right: 15),
                margin: EdgeInsets.only(left: 15),
                child: Container(
                  margin: EdgeInsets.only(top: 3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    // Valeur du border radius
                  ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.separated(
                            //pour le details des tranferts
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                //recuperation des elements de transaction
                                Transaction transaction = transactionList[
                                index]; //recuperation de chaque element de la liste
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  //j'ai mis la colonne dans un gesture parceque quand on clique ca mene vers le recu
                                  child: GestureDetector(
                                    child:Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      //faire recherche
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            //pour verifier pour chaque index si c'est un retrait ou pas
                                            Text(
                                              "${transaction.isRetrait ? 'A' : 'De'} ${transaction.name}  ${transaction.phoneNumber} ",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "${transaction.isRetrait ? '-' : ''} ${transaction.price} F",
                                              style: TextStyle(
                                                  color: primaryColor,
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        Text(
                                          transactionList[index]
                                              .dateTime
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return RecuScreen(transaction: transaction);
                                        },
                                      ));
                                    },
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: 5,
                                );
                              },
                              itemCount: transactionList.length),

                        ],
                      ),
                    )

                //Container qui commence a partir de montant recu
              ),
            ),
          )
          // Add other SliverList, SliverGrid, or SliverToBoxAdapter widgets as needed.
        ],
      )

    );


  }

}