import 'package:flutter/material.dart';
import 'package:wave_project/utils/constants.dart';
import 'package:wave_project/models/contact.dart';

import 'home_screen.dart';

class Achat_credit_screen extends StatefulWidget {
  const Achat_credit_screen({super.key});

  @override
  State<Achat_credit_screen> createState() => _Achat_credit_screenState();
}
Contact moiMeme = new Contact(nom: "Mon Numéro", numero: "77 000 11 00", operateur: "orange");
List<Contact> liste_contacts = [
  new Contact(nom: "Rica", numero: "33 111 00 00", operateur: "free"),
  new Contact(nom: "Brice", numero: "77 888 99 00", operateur: "orange"),
  new Contact(nom: "Carlie", numero: "33 111 33 33", operateur: "free"),
  new Contact(nom: "Gady", numero: "77 888 22 11", operateur: "orange"),
  new Contact(nom: "Liam", numero: "77 663 55 67", operateur: "orange"),
];
class _Achat_credit_screenState extends State<Achat_credit_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: const Text(
            'Achat crédit',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 241, 241, 241),
          elevation: 0,
          leading: IconButton(
            onPressed: () => {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => const HomeScreen(),
                ),
              ),
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          ),
      SliverToBoxAdapter(
        child: Container(
          child: Column(
            children: [
            TextField(
            autofocus: true,
            decoration: InputDecoration(
            labelText: 'A',
            border: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor,width: 2.0),
            ),
            focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor),
            ),
            ),
            ),
              SizedBox(height: 20.0),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(45)),
                          padding: const EdgeInsets.all(8),
                          child: Icon(Icons.add, size: 40, color: Colors.white,),
                        ),
                        ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Acheter du crédit pour un',
                            style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(
                              'nouveau Numéro',
                              style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
              ],
              ),
              SizedBox(height: 40.0,),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
                    child: Text(
                      'Favoris',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),
                    ),
                  )
                ],
              ),
              cardWidget(moiMeme),
              SizedBox(height: 40.0,),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10.0,),
                    child: Text(
                      'Contacts',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),
                    ),
                  )
                ],
              ),
              Container(
                height: 1000,
                child: ListView.separated(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                         itemBuilder: (context, index){
                          Contact contact = liste_contacts[index];
                          return cardWidget(contact);
                        }, separatorBuilder: (context, index){
                      return const SizedBox(height: 5,);}, itemCount: liste_contacts.length),
                 // ],
                ),
              // ),

            ],

        ),
      ),
      ),
        ],
      ),
    );

  }

  cardWidget(Contact contact){
    return Row(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: contact.operateur == "orange"? Colors.orange: Colors.redAccent,
                  borderRadius: BorderRadius.circular(100),
                ),
                height: 50.0,
                width: 50.0,
              ),
            ),
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    contact.nom,
                    style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    contact.numero,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}


