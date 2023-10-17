import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../routes/pages/pages.dart';
import '../../widget/dialogues.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeScreen extends StatefulWidget {
  static const String pageName = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Constants.darkPink,
      body: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 400) {
                return Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 80,
                    width: double.infinity,
                    child: ListTile(
                      leading: Container(
                          width: 150,
                          alignment: Alignment.center,
                          height: 80,
                          child: const Image(
                            image: AssetImage('assets/images/m_logo.png'),
                          )),
                      tileColor: Constants.darkPink,
                      title: Center(
                          child: Container(
                              height: 50,
                              width: 50,
                              child: const Image(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                      'assets/images/spalshscreen.png')))),
                      trailing: GestureDetector(
                        onTap: () async {
                          await GeneralDialogs.showLoginDialogue(context);
                          // Navigator.pushNamed(context, CoursCrudScreen.pageName);
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          height: 50,
                          width: 130,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.pink.withOpacity(0.2),
                                  spreadRadius: 4,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                )
                              ],
                              color: Constants.darkPink,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                              child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container(
                  height: 80,
                  width: double.infinity,
                  color: Constants.darkPink,
                  child: ListTile(
                    leading: Container(
                        width: 150,
                        alignment: Alignment.center,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: const Image(
                          image: AssetImage('assets/images/m_logo.png'),
                        )),
                    tileColor: Constants.pinkColor,
                    title: Center(
                        child: Container(
                            width: 200,
                            child: Text(
                              "Rose excellence",
                              style: GoogleFonts.playfairDisplay().copyWith(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ))
                    ),
                    trailing: GestureDetector(
                      onTap: () async {
                        await GeneralDialogs.showLoginDialogue(context);
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        width: 130,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Constants.darkPink.withOpacity(0.1),
                                spreadRadius: 4,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          'Login',
                          style: GoogleFonts.playfairDisplay().copyWith(
                              color: Constants.darkPink,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  MediaQuery.of(context).size.width < 400
                      ? Container(
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  alignment: Alignment.center,
                                  image: AssetImage("assets/images/bg.webp"),
                                  fit: BoxFit.fitWidth)),
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height -
                              (MediaQuery.of(context).size.height /
                                  5), //width:MediaQuery.of(context).size.width,
                          // height: MediaQuery.of(context).size.height,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  alignment: Alignment.center,
                                  image: AssetImage("assets/images/bg.webp"),
                                  fit: BoxFit.fitWidth)),
                        ),
                  MediaQuery.of(context).size.width < 400
                      ? Positioned(
                          right: 20,
                          bottom: 50,
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(maxWidth: 300, minWidth: 200),
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.pink.withOpacity(0.2),
                                      spreadRadius: 4,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  color: Constants.darkPink),
                              child: const Text(
                                """Pourquoi tout ces trackers ?

Tu pourras retrouver ce bilan à jour mensuellement dans BILAN.

Le but est de te montrer l’impact du quotidien sur tes cheveux. Comment la météo, ton alimentation, ton stress, etc. agit sur la santé de tes cheveux.""",
                                textScaleFactor: 1.5,
                                style:
                                    TextStyle(color: Colors.black, fontSize: 8),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ))
                      : Positioned(
                          left: 20,
                          top: 20,
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints(maxWidth: 300, minWidth: 200),
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.pink.withOpacity(0.2),
                                      spreadRadius: 4,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  color: Constants.darkPink),
                              child: const Text(
                                """Pourquoi tout ces trackers ?

Tu pourras retrouver ce bilan à jour mensuellement dans BILAN.

Le but est de te montrer l’impact du quotidien sur tes cheveux. Comment la météo, ton alimentation, ton stress, etc. agit sur la santé de tes cheveux.""",
                                textScaleFactor: 1.5,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 8),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ))
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: double.infinity,
            child: ListTile(
              tileColor: Constants.darkPink,
              title: Container(
                  width: 150,
                  alignment: Alignment.center,
                  height: 80,
                  child: const Text(
                    'Rose excellence Admin Portal',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
