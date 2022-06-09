import 'package:flutter/material.dart';
import 'package:appmaps/screens/gotocollage_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter APP-GMaps"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const SimpleMapScreen();
                        }));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.green),
                        child: Image.asset("assets/images/lokasi1.png"),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text("posisi", style: TextStyle(fontSize: 20))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
