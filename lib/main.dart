import 'package:flutter/material.dart';
import 'package:pet_care/RegScreen.dart';
import './DetectionScreen.dart';
import './SingleProdScreen.dart';
import 'ProdScreen.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
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
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegScreen(),
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
            leading: const Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.of(context).pushNamed('/'),
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
              // Navigator.of(context).pushNamed(Fertilizer().routename())
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
                    "Welcome,\n$name",
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(DetectionScreen().getRoute()),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/Brown_Rectangle.png",
                            scale: 0.9,
                          ),
                          Text(
                            "BEHAVIOUR\nDETECTION",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        alignment: Alignment.center,
                      ),
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          "assets/Purple_Rectangle.png",
                          scale: 0.9,
                        ),
                        Text(
                          "VETERINARIAN\'S\nCONSULTANCY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                      alignment: Alignment.center,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/Blue_Rectangle.png",
                          scale: 0.9,
                        ),
                        Text(
                          "PET\nSCHEDULER",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                      alignment: Alignment.center,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(ProdScreen().getRoute()),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/Green_Rectangle.png",
                            scale: 0.9,
                          ),
                          Text(
                            "PET\nSTORE",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                        alignment: Alignment.center,
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
