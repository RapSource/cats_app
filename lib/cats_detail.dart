import 'package:cats_app/model/cats_ras.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  final CatsRas ras;

  const DetailPage({Key? key, required this.ras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 800) {
        return DetailWebPage(ras: ras);
      } else {
        return DetailMobilePage(ras: ras);
      }
    });
  }
}

class DetailWebPage extends StatefulWidget {
  final CatsRas ras;

  const DetailWebPage({super.key, required this.ras});

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            const Image(image: AssetImage('assets/images/logo_kucing.png')),
        title: const Text('Halaman Detail'),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
          child: SizedBox(
            width: 1200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      ClipRRect(
                        child: Image.asset(
                          widget.ras.imageAsset,
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Scrollbar(
                        controller: _scrollController,
                        child: Container(
                          height: 150,
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.ras.imageUrls.length,
                              itemBuilder: (BuildContext context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                        widget.ras.imageUrls[index]),
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                Expanded(
                    child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          child: Text(
                            widget.ras.rasName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color.fromARGB(141, 7, 119, 139),
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Text(
                            widget.ras.description,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(fontSize: 16.0),
                          ),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class DetailMobilePage extends StatelessWidget {
  final CatsRas ras;

  const DetailMobilePage({super.key, required this.ras});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:
              const Image(image: AssetImage('assets/images/logo_kucing.png')),
          title: const Text('Halaman Detail'),
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(children: [
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
                            )),
                      ),
                      const LoveIcon(),
                    ],
                  ),
                ))
              ]),
              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    ras.rasName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Color.fromARGB(141, 7, 119, 139),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )),
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
        ));
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
        ));
  }
}
