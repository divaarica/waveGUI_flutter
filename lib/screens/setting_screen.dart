import 'package:flutter/material.dart';
import '../models/option.dart';
import 'package:wave_project/screens/home_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  List<String> titleList = ["Partager", "Assistance", "Securite"];

  List<Option> partagerListe = [
    Option(
        text: "Inviter un ami a rejoindre Wave",
        color: Colors.black,
        icon: Icons.file_upload_outlined),
    Option(
        text: "Utiliser le code promotionnel",
        color: Colors.black,
        icon: Icons.auto_awesome_outlined)
  ];

  List<Option> assistanceListe = [
    Option(
        text: "Contacter le service client",
        color: Colors.black,
        icon: Icons.phone),
    Option(
        text: "Trouver les agent a proximiter",
        color: Colors.black,
        icon: Icons.location_on),
    Option(
      text: "Verifier vos plafonds",
      color: Colors.black,
      icon: Icons.assessment_rounded,
    ),
  ];

  List<Option> securiteListe = [
    Option(
        text: "Modifier votre code sercret",
        color: Colors.black,
        icon: Icons.admin_panel_settings),
    Option(
        text: "Vos appareils connecter",
        color: Colors.black,
        icon: Icons.android_outlined),
  ];

  List<Option> deconnectionListe = [
    Option(
      text: "Se deconnecter (77 654 24 34)",
      color: Colors.black,
      icon: Icons.logout,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.withOpacity(0.2),
            pinned: true,
            floating: true,
            //pour gerer l'ombre quand on scroll le degrade
            elevation: 0,
            title: const Text("Paramètres",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize:
                  15.0, // Vous pouvez ajuster la taille ici selon vos besoins
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
          SliverToBoxAdapter(
              child: Container(
                color: Colors.grey.withOpacity(0.2),
                height: 700,
                child: Column(
                  children: [
                    //Container pour partager
                    Container(
                      height: 160,
                      width: 400,
                      padding: EdgeInsets.only(right: 10),
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Partager",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade700),
                          ),
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: partagerListe.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Icon(partagerListe[index].icon),
                                      title: Text(partagerListe[index].text),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      //Container qui commence a partir de montant recu
                    ),
                    Container(
                      height: 220,
                      width: 400,
                      padding: EdgeInsets.only(right: 10),
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Assistance",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade700),
                          ),
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: assistanceListe.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Icon(assistanceListe[index].icon),
                                      title: Text(assistanceListe[index].text),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      //Container qui commence a partir de montant recu
                    ),
                    //Container pour Assistance
                    //Container pour securite
                    Container(
                      height: 160,
                      width: 400,
                      padding: EdgeInsets.only(right: 10),
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sécurité",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey.shade700),
                          ),
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: securiteListe.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      leading: Icon(securiteListe[index].icon),
                                      title: Text(securiteListe[index].text),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      //Container qui commence a partir de montant recu
                    ),
                    //Container pour se deconnecter
                    Container(
                      height: 160,
                      width: 400,
                      padding: EdgeInsets.only(right: 10),
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: deconnectionListe.length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                        leading:
                                        Icon(deconnectionListe[index].icon),
                                        title: Text(deconnectionListe[index].text)
                                    );
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),

                      //Container qui commence a partir de montant recu
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

// appBar: AppBar(
// backgroundColor: Colors.brown,
// ),
// floatingActionButton: FloatingActionButton(
// onPressed: (){
// Navigator.pop(context);
// },
// ),
