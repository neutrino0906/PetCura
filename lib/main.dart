import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:pet_care/BreedDetection.dart';
import 'package:pet_care/ChatScreen.dart';
import 'package:pet_care/RegScreen.dart';
import 'package:pet_care/VeteScreen.dart';
import './DetectionScreen.dart';
import './SingleProdScreen.dart';
import 'ProdScreen.dart';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
// import 'firebase_options.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  cameras = await availableCameras();
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        HomePage().getRoute(): (context) => HomePage(),
        ProdScreen().getRoute(): (context) => ProdScreen(),
        DetectionScreen().getRoute(): (context) => DetectionScreen(),
        SingleProdScreen().getRoute(): (context) => SingleProdScreen(),
        VeteScreen().getRoute(): (context) => VeteScreen(),
        ChatScreen().getRoute(): (context) => ChatScreen(),
        // BreedDetection().getRoute(): (context) => BreedDetection(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: RegScreen(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData)
            return HomePage();
          else
            return RegScreen();
        },
      ),
    );
  }
}

class sideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 47, 147, 201),
              // image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/cover.jpg'),
              //     )
            ),
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Log Out'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.of(context).pushReplacementNamed('/'),
            },
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Detection'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.of(context).pushNamed(DetectionScreen().getRoute()),
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Consultancy'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.of(context).pushNamed(VeteScreen().getRoute()),
            },
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Scheduler'),
            onTap: () => {
              Navigator.of(context).pop(),
              // Navigator.of(context).pushNamed(CameraScreen().routename()),
            },
          ),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Store'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.of(context).pushNamed(ProdScreen().getRoute()),
            },
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  String getRoute() => "HomePage";

  String name = "Prashant";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: sideDrawer(),
        appBar: AppBar(
            toolbarHeight: 80,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            // title: Text("PET CARE"),
            // leading: const Icon(
            //   Icons.menu,
            //   color: Color.fromARGB(255, 0, 0, 0),
            // ),
            actions: const [
              Icon(
                Icons.person,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              SizedBox(
                width: 20,
              )
            ],
            // shadowColor: Colors.black,
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 2,
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(44.0),
                  child: Text(
                    "Welcome,\n${FirebaseAuth.instance.currentUser!.displayName}",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(DetectionScreen().getRoute()),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/Brown_Rectangle.png",
                            scale: 0.9,
                          ),
                          Stack(
                            children: [
                              // Implement the stroke
                              Text(
                                'BEHAVIOUR\nDETECTION',
                                style: TextStyle(
                                  fontSize: 15,
                                  // letterSpacing: 5,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 3
                                    ..color = Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              const Text(
                                "BEHAVIOUR\nDETECTION",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(VeteScreen().getRoute()),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/Purple_Rectangle.png",
                            scale: 0.9,
                          ),
                          const Text(
                            "VETERINARIAN\'S\nCONSULTANCY",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => FlutterAlarmClock.showAlarms(),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/Blue_Rectangle.png",
                            scale: 0.9,
                          ),
                          const Text(
                            "PET\nSCHEDULER",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(ProdScreen().getRoute()),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            "assets/Green_Rectangle.png",
                            scale: 0.9,
                          ),
                          const Text(
                            "PET\nSTORE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
