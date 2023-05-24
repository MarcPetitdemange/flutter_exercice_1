import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_exercice/model.dart';


Auteur marc = Auteur("PETITDEMANGE", "Marc", "https://images.pexels.com/photos/15960020/pexels-photo-15960020/free-photo-of-mer-aube-paysage-soleil-couchant.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
Auteur lena = Auteur("BONFILS", "Léna", "https://images.pexels.com/photos/15045104/pexels-photo-15045104/free-photo-of-costume-femme-debout-fleur.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load");


PostInformations postInformations = PostInformations("https://images.pexels.com/photos/16889399/pexels-photo-16889399/free-photo-of-lumineux-aube-paysage-nature.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load", marc, "Seul sur le sable, les yeux dans l'eau, mon rêve était trop beau...", 12, 13, DateTime.now());
PostInformations postInformations2 = PostInformations("https://images.pexels.com/photos/2883135/pexels-photo-2883135.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load", lena, "Oh macumba macumba...", 63, 22,  DateTime.now());
PostInformations postInformations3 = PostInformations("https://images.pexels.com/photos/16948623/pexels-photo-16948623.jpeg?auto=compress&cs=tinysrgb&w=400&lazy=load", lena, "Allez venez milor, vous asseoir à ma table !", 584, 123,  DateTime.now());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Basics(),
    );
  }
}

class Basics extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: whiteText("Basics")
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Image(
                    image: NetworkImage("https://images.pexels.com/photos/15960020/pexels-photo-15960020/free-photo-of-mer-aube-paysage-soleil-couchant.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    width: size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 140),
                      child:
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 4.0,
                                color: Colors.white
                            ),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: networkImage()
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(60.0))
                          ),
                        )
                  ),
                ],
              ),
              Text(
                "Marc PETITDEMANGE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic
                ),
              ),
              const Text(
                  "Un jour les chats domineront le monde, mais pas aujourd'hui, c'est l'heure de la sieste",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.teal
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child:  Container(
                        alignment: Alignment.center,
                        child: whiteText("Modifier le profil"),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xff018cfb),
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                      ),
                  ),
                  Container(
                    child: Icon(Icons.edit, color: Colors.white),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xff018cfb),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  )
                ],
              ),
              Divider(),
              sectionTitle("A propos de moi"),
              Column(
                children: [
                  iconRow(Icons.house, "Nancy 54000, Meurthe-et-Moselle, France"),
                  iconRow(Icons.work, "Développeur Flutter"),
                  iconRow(Icons.favorite, "En couple")
                ],
              ),
              Divider(),
              sectionTitle("Amis"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  stackImageWomen(size),
                  stackImageWomen(size),
                  stackImageWomen(size)
                ],
              ),
              post(postInformations),
              post(postInformations2),
              post(postInformations3),
            ],
          ),
      ),
    );
  }
}



Text whiteText(String text){
  return Text(
    text,
    style: const TextStyle(
        color: Colors.white
    )
  );
}

Row iconRow(IconData iconData, String text){
  return Row(
    children: [
      Icon(iconData),
      Text(text)
    ],
  );
}

Image imageFromNetwork(){
  return Image.network("https://images.pexels.com/photos/16932257/pexels-photo-16932257/free-photo-of-animal-grand-fourrure-zoo.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");
}

NetworkImage networkImage(){
  return const NetworkImage(
      "https://images.pexels.com/photos/16932257/pexels-photo-16932257/free-photo-of-animal-grand-fourrure-zoo.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  );
}

Row sectionTitle(title){
  return  Row(
    children: [
      Text(
        title,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),
      ),
    ],
  );
}

Stack stackImageWomen(Size size){
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        width: size.width/3.5,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: networkImage(),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(top: 210),
          child: Text("Léna")
      )
    ],
  );
}



Container post(PostInformations postInformations){
    return Container(
      color: Colors.teal,
      margin: EdgeInsets.only(top: 5, bottom: 5),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    foregroundImage: NetworkImage(postInformations.auteur.avatar),
                  ),
                  Text(postInformations.auteur.nom.toUpperCase() + "" + postInformations.auteur.prenom,),
                ],
              ),
              Text("Il y'a " + postInformations.dateTime.hour.toString() + " heures")
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(postInformations.imageAdresse.toString())
              )
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              postInformations.description,
              textAlign: TextAlign.left,
            ),
          ),
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             Icon(Icons.favorite),
             Text(postInformations.nbLikes.toString() + " likes"),
             Icon(Icons.comment),
             Text(postInformations.nbCommentaires.toString() + " Commentaires")
           ],
          )
        ],
      ),
    );
}