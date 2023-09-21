import 'dart:io';
import 'package:cats_app/model/cats_ras.dart';
import 'package:flutter/material.dart';
import 'package:cats_app/cats_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
              const Image(image: AssetImage('assets/images/logo_kucing.png')),
          title: Text('Ras Kucing', style: GoogleFonts.poppins()),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  exit(0);
                },
                icon: Icon(Icons.exit_to_app)),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 4, 255),
                    Color.fromARGB(255, 16, 242, 223)
                  ],
                  begin: FractionalOffset.topLeft,
                  end: FractionalOffset.bottomRight,
                ),
                image: DecorationImage(
                    image: AssetImage('assets/images/patern.jpg'),
                    opacity: 0.5,
                    fit: BoxFit.none,
                    repeat: ImageRepeat.repeat)),
          ),
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth <= 600) {
              return const CatList();
            } else if (constraints.maxWidth <= 1200) {
              return const CatGrid(gridCount: 4);
            } else {
              return const CatGrid(gridCount: 6);
            }
          },
        ));
  }
}

class CatList extends StatelessWidget {
  const CatList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: ((context, index) {
        final CatsRas ras = catsRas[index];
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailPage(ras: ras)));
          },
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Hero(
                        tag: ras.imageAsset,
                        child: Image.asset(
                          ras.imageAsset,
                          width: 100,
                        ))),
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
                    ))
              ],
            ),
          ),
        );
      }),
      itemCount: catsRas.length,
    );
  }
}

class CatGrid extends StatelessWidget {
  final int gridCount;

  const CatGrid({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: GridView.count(
          crossAxisCount: gridCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: catsRas.map((ras) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(ras: ras)));
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                        child: Image.asset(
                      ras.imageAsset,
                      fit: BoxFit.cover,
                    )),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ras.rasName,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ));
  }
}
