import 'package:cats_app/model/cats_ras.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatelessWidget {
  final CatsRas ras;

  const SecondPage({Key? key, required this.ras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(image: AssetImage('images/logo_kucing.png')),
        title: Text('Halaman Detail'),
        // actions: <Widget>[
        //   IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.exit_to_app)
        //   ),
        // ],
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Hero(
                  tag: ras.imageAsset,
                  child: Image.asset(
                    ras.imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )
                          ),
                        ),
                        const LoveIcon(),
                      ],
                    ),
                  )
                )
              ]
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                ras.rasName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(141, 7, 119, 139),
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              )
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                ras.description,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 16.0),
                  ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: ras.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      )
    );
  }
}

class LoveIcon extends StatefulWidget {
  const LoveIcon({super.key});

  @override
  State<LoveIcon> createState() => _LoveIconState();
}

class _LoveIconState extends State<LoveIcon> {
bool isLove = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isLove = !isLove;
        });
      },
      icon: Icon(
        isLove ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      )
    );
  }
}