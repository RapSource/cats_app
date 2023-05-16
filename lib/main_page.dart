import 'dart:io';
import 'package:cats_app/model/cats_ras.dart';
import 'package:flutter/material.dart';
import 'package:cats_app/second_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(image: AssetImage('images/logo_kucing.png')),
        title: Text('Ras Kucing'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              exit(0);
            },
            icon: Icon(Icons.exit_to_app)
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 0, 4, 255), Color.fromARGB(255, 16, 242, 223)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
            ),
            image: DecorationImage(
              image: AssetImage('images/patern.jpg'),
              opacity: 0.5,
              fit: BoxFit.none,
              repeat: ImageRepeat.repeat
            )
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (
          (context, index) {
            final CatsRas ras = catsRas[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage(ras: ras)
                  )
                );
              },
              child: Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Hero(
                        tag: ras.imageAsset,
                        child: Image.asset(ras.imageAsset, width: 100,))
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              ras.rasName,
                              style: TextStyle(fontSize: 16.0),
                            )
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
            );
          }
        ), itemCount: catsRas.length,
      )
    );
  }
}