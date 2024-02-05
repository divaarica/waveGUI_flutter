// import 'package:wave_project/screens/rechercher_screen.dart';
// import 'package:wave_project/screens/recu_screen.dart';
import 'package:wave_project/screens/setting_screen.dart';
import 'package:wave_project/utils/constants.dart';
import 'package:flutter/material.dart';

import '../models/option.dart';
import '../models/transaction.dart';
import '../widget/card_widget.dart';

//pour creer un widget stateful sans tout ecrire :stful
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//Appbar pour afficher une barre tout en hautde l'ecran
//pour mettre une couleur en hexadecimal on ne me pas # mais 0x
class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = true;
  List<Option> optionList = [
    Option(
        text: "Transfert", color: Colors.deepPurpleAccent, icon: Icons.person),
    Option(
        text: "Paiements",
        color: Colors.orangeAccent,
        icon: Icons.shopping_cart_outlined),
    Option(
        text: "Crédit", color: Colors.blue, icon: Icons.phone_android_outlined),
    Option(
        text: "Banque", color: Colors.redAccent, icon: Icons.account_balance),
    Option(text: "Cadeaux", color: Colors.green, icon: Icons.gif_box_outlined),
  ];

  List<Transaction> transactionList = [
    Transaction("Aho", "776548970", 10000, DateTime.now(), true),
    Transaction("Sackho", "777548972", 10000, DateTime.now(), false),
    Transaction("Gakosso", "778548974", 50000, DateTime.now(), false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: CustomScrollView(
        //CustomSACROLLvIEUX VA GERER l'effet de scroll
        slivers: [
          // Un Sliver en Flutter fait référence à un modèle de rendu utilisé pour les widgets de défilement dans l'application.
          SliverAppBar(
            backgroundColor: primaryColor,
            pinned: true,
            //epingle , peut on importe ou on se trouve le appbar est la
            floating: true,
            //pour permettre de bouger malgre qu'il soit epingle
            expandedHeight: 90,
            // etendre la taille du appBar
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SettingScreen();
                  },
                ));
              },
            ),
            flexibleSpace: FlexibleSpaceBar(
              //pour utiliser toute la partie flexible du appBar genre le montant bouge avec le appBar epingle
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //mettre les elements sur la meme ligne
                children: [
                  isVisible
                      ? RichText(
                          text: const TextSpan(
                              text: "5.000",
                              style: TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w600),
                              children: [
                              TextSpan(
                                  text: "F", style: TextStyle(fontSize: 18)),
                            ]))
                      : const Text(
                          "••••••••",
                          style: TextStyle(color: Colors.white, fontSize: 26),
                        ),
                  const SizedBox(
                    //pour separer le montant et l'oeuil, il permet de mettre des espacement
                    width: 10,
                  ),
                  GestureDetector(
                    //pour le bouton des yeux
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(
                      isVisible
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            //permet d'ajouter un element de n'importe quel taille c'est toute la partie blanche
            child: Container(
                //composant ou on peut mettre tout ce qu'on veut
                height: 1000,
                child: Stack(
                  children: [
                    Container(
                      //container qui va remplir le backgroung compltemetn tout va devenir bleu
                      color: primaryColor,
                    ),
                    Container(
                      //pour faire l'effet de contour et mettre un container blanc
                      margin: const EdgeInsets.only(top: 80), //tester
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35))),
                    ),
                    Column(
                      children: [
                        CardWidget(),
                        GridView.builder(
                          //grille de la barre des icones
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          //faire recherche
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          //pour pouvoir scroller meme sur les elements
                          itemCount: optionList.length,
                          itemBuilder: (context, index) {
                            return optionWidget(
                              icon: optionList[index].icon,
                              color: optionList[index].color,
                              text: optionList[index].text,
                            );
                          },
                        ),
                        Divider(
                          // espacement en gris
                          thickness: 10,
                          color: Colors.grey.withOpacity(.3),
                        ),
                        ListView.separated(
                            //pour le details des tranferts
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
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            "${transaction.isRetrait ? '-' : ''} ${transaction.price} F",
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: 16,
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
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: (){
                                    // Navigator.push(context, MaterialPageRoute(
                                    //   builder: (context) {
                                    //     return RecuScreen(transaction: transaction);
                                    //   },
                                    // ));
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
                        const SizedBox(
                          height: 30,
                        ),

                        TextButton(
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return ResearchScreen();
                            //   },
                            // ));
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(primaryColor.withOpacity(0.1)),
                          ),
                          child: Container(
                            height: 20,
                            width: 120,
                              child: Row(
                                children: [
                                  Icon(Icons.search, color: Colors.blueAccent.shade700),
                                  Text('Rechercher',style: TextStyle(color: Colors.blueAccent.shade700)),
                                ],

                              )
                          )
                        ),
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

//pour les differents menu , transfert paiement ...
  optionWidget(
      {required IconData icon, required Color color, required String text}) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(45) //arrandir le container
              ),
          padding: EdgeInsets.all(6), // pour elogner l'icone du cercle
          child: Icon(icon, color: color, size: 40),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }

//tout ce qui concerte la carte bleu ou il y a le qr code
// cardWidget(){
//   return Container(//container du petit carre blau clair ou il y a le qrCode
//     width: MediaQuery.of(context).size.width, //faire recherche
//     height: 200,
//     margin: const EdgeInsets.symmetric(horizontal: 30),
//     decoration: BoxDecoration(
//         color: Colors.lightBlueAccent,
//         borderRadius: BorderRadius.circular(15),//arrange le boder du carre bleur clair
//         image: DecorationImage(
//             image: const AssetImage("assets/images/bg_card.png"),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.purple.shade200.withOpacity(0.4), BlendMode.srcIn))),
//     child: Container( //container pour le carres blanc du qrcode
//       //margin: EdgeInsets.symmetric(vertical: 20, horizontal: 70), //pour carder le container
//       margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 75), //pour carder le container
//       //padding: EdgeInsets.all(12),
//       padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15), //pour carder le container
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10)
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           //Image.asset("assets/images/qr.png", width: 140),
//           Image.asset("assets/images/qr.png"),
//           const SizedBox(height: 2),
//           //const SizedBox(height: 1,),
//           const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.photo_camera, size: 20.0,),
//
//               SizedBox(width: 5,),//ajouter un espace entre la camera et le text
//               Text('Scanner',style: TextStyle(fontSize: 15.0,)),//ajuster la taille du scanner
//             ],
//           )
//         ],
//       ),
//     ),
//
//   );
// }

//appBar normal, sans custum
// appBar() {
//   return AppBar(
//     backgroundColor: primaryColor,
//     //pour ajouter un widget(buton, image..) a un appBar il faut leading
//     //mettre const devant certains element qui ne cangent pas va faciliter a compilation
//     /*leading : GestureDetector(
//       onTap: (){
//         print("test")
//       }, //ontap fait le meme effet que onPressed
//
//       child: const Icon(
//         Icons.settings,
//         color: Colors.white,
//         size: 30,
//       ),
//     )*/
//     leading: IconButton(
//       onPressed: () {
//         print("object");
//       },
//       icon: const Icon(
//         Icons.settings,
//         color: Colors.white,
//         size: 30,
//       ),
//     ),
//     /*title: const Text("5000 fcfa",style: TextStyle(color: Colors.white, fontSize: 26),),
//     centerTitle: true,*/ //mais vu que les elements sont de diffirente taille on va utiliser row pour les separer
//     title: Row(
//       mainAxisAlignment: MainAxisAlignment.center,//positionnement du row
//       children: [
//         isVisible
//             ? RichText(
//             text: const TextSpan( //le textspan a plusieus enfants , il doit tjr etre dans un richText
//                 text: "5.000",
//                 style:
//                 TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
//                 children: [
//                   TextSpan(text: "F", style: TextStyle(fontSize: 18)),
//                 ]))
//             : const Text(
//           "********",
//           style: TextStyle(color: Colors.white, fontSize: 26),
//         ),
//         IconButton(
//             onPressed: () {
//               setState(() {
//                 isVisible = !isVisible;
//               });
//             },
//             icon: isVisible
//                 ? const Icon(
//               Icons.visibility_off_rounded,
//               color: Colors.white,
//             )
//                 : const Icon(
//               Icons.visibility_rounded,
//               color: Colors.white,
//             ))
//       ],
//     ),
//     centerTitle: true,
//   );
// }child: isVisible
//                         ? const Icon(
//                       Icons.visibility_off_rounded,
//                       color: Colors.white,
//                     )
//                         : const Icon(
//                       Icons.visibility_rounded,
//                       color: Colors.white,
//                     ),
}
