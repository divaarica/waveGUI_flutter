import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sqllite;
import 'package:wave_project/models/transaction.dart';
import 'package:wave_project/screens/home_screen.dart';

class RecuScreen extends StatefulWidget {
  final Transaction transaction;


  //constructor , il doit venir avec la transaction
  const RecuScreen({super.key, required this.transaction});

  @override
  State<StatefulWidget> createState() => _RecuScreenState();
}

class _RecuScreenState extends State<RecuScreen> {
  late double frais;
  late int prix;
  late DateTime date;
  List<String> phrase2 = [];

  //on a initialiser les valeurs de transaction car quand l'application se lance on ne connais pas les valeurs , c'est quand on clique que on recupere
  @override
  void initState() {
    super.initState();
    // Initialisez vos variables ici
    frais = (widget.transaction.price) / 100;
    phrase2 = [
      widget.transaction.price.toString(),
      frais.toString(),
      "Effectuer",
      widget.transaction.dateTime.toString(),
      "5900",
      "TGRFBGH",
    ];

  }

  List<String> phrase = [
    "Montant recu",
    "Frais",
    "Statut",
    "Date et heure",
    "Nouveau solde",
    "ID de la transaction",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            floating: false,
            //pour gerer l'ombre quand on scroll le degrade
            elevation: 0.0,
            title: const Text("Recu",
                style: TextStyle(
                  fontSize:
                      18.0, // Vous pouvez ajuster la taille ici selon vos besoins
                )),
            centerTitle: true,
            //expandedHeight: 90,
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
          ),

          //pour l'icone du telephone

          SliverToBoxAdapter(

            //container qui vaprendre toute la page depuis le app bar jusqu'a la taille souhaite
            child: Container(
                height: 700,
                //color: Colors.white,
                //color: Colors.lightGreenAccent, //pour voir limite du contenair
                child: Stack(
                  children: [

                    //container pour creer un cercle pour l'icone
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.circular(45) //arrandir le container
                          ),
                      //padding pour l'interieur de cercle
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 10),
                      //tester
                      // pour elogner l'icone du cercle
                      child: const Icon(Icons.phone_android_outlined,
                          color: Colors.blue, size: 25),
                      // color: Colors.pink,
                    ),

                    //Container du montant et nom de la personne
                    Container(
                        height: 60,
                        width: 400,
                        margin: const EdgeInsets.only(top: 70, left: 10),
                        //color: Colors.lightBlueAccent,
                        child: RichText(
                          textAlign: TextAlign.start,
                          //on aurai pu mettre dans un row que dans un richtext
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                //si la transaction est un retrait alors c'est un "-" sinon "+"
                                  text: "${widget.transaction.isRetrait ? '-':'+' } ${widget.transaction.price+(widget.transaction.price/100)} \n",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.black,
                                  )),
                              TextSpan(
                                  text:
                                      "${widget.transaction.isRetrait ? 'A' : 'De'} ${widget.transaction.name}  ${widget.transaction.phoneNumber} ",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  )),
                            ],
                          ),
                        )),

                    //Container qui commence a partir de montant recu
                    Container(
                        margin: const EdgeInsets.only(top: 100),
                        child: ListView.separated(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {

                              return Padding(
                                //padding pour l'encadrement qui ne touche pas le container
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  //pour que tout les elements commencent au debut du container
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //faire recherche
                                  children: [
                                    Text(
                                      phrase[index],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      phrase2[index],
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 5,
                              );
                            },
                            itemCount: phrase.length))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
