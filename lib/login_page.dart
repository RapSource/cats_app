import 'package:flutter/material.dart';
import 'package:cats_app/main_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image(image: AssetImage('images/logo_kucing.png')),
        title: Text('Cats App'),
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
      body: Container(
        // height: 500,
        // width: 500,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Colors.blueAccent,
              Color.fromARGB(10, 1, 238, 187)
            ]
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 150,
                child: LottieBuilder.network('https://assets10.lottiefiles.com/packages/lf20_OT15QW.json')
              ),
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.blueAccent, Color.fromARGB(255, 16, 242, 223)],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter
                    ),
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return MainPage();
                          })
                        ); 
                      },
                      child: Center(
                        child: Text('Daftar Ras Kucing', style: GoogleFonts.poppins()),
                      ),
                    ),
                  ),
                ),
              )
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
