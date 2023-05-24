import 'dart:ui';

import 'package:flutter/material.dart';

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
                      child: CircleAvatar(
                        radius: 60,
                        foregroundImage: networkImage(),
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
              )
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