import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'list_cats_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 4), () async {
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
        return const MainPage();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            const Image(image: AssetImage('assets/images/logo_kucing.png')),
        title: Text('Cats App',
            style: GoogleFonts.breeSerif(fontSize: 24, height: 1.5)),
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
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
              Colors.blueAccent,
              Color.fromARGB(10, 1, 238, 187)
            ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width: 200,
                  height: 100,
                  child: LottieBuilder.network(
                      'https://assets10.lottiefiles.com/packages/lf20_OT15QW.json')),
              // Material(
              //   elevation: 2,
              //   borderRadius: BorderRadius.circular(20),
              //   child: Container(
              //     width: 150,
              //     height: 30,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       gradient: LinearGradient(
              //         colors: [Colors.blueAccent, Color.fromARGB(255, 16, 242, 223)],
              //         begin: FractionalOffset.topCenter,
              //         end: FractionalOffset.bottomCenter
              //       ),
              //     ),
              //     child: Material(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Colors.transparent,
              //       child: InkWell(
              //         splashColor: Colors.blueAccent,
              //         borderRadius: BorderRadius.circular(20),
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (context) {
              //               return MainPage();
              //             })
              //           );
              //         },
              //         child: Center(
              //           child: Text('Halaman Artikel', style: GoogleFonts.poppins()),
              //         ),
              //       ),
              //     ),
              //   ),
              // )
              // Text(
              //   'Featured Lottie Animation by: Diane Picchiottino',
              //   style: GoogleFonts.poppins()
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) {
              //         return MainPage();
              //       })
              //     );
              //   },
              //   child: Text('Daftar Ras Kucing', style: GoogleFonts.poppins())
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// LottieBuilder.network('https://assets10.lottiefiles.com/packages/lf20_OT15QW.json')
