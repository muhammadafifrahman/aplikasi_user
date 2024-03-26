import 'package:flutter/material.dart';
import 'package:flutter_application_1/RegisterScreen.dart';
import 'package:flutter_application_1/UserScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'User',
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.blue),
                    accountName: Text("User"),
                    accountEmail: Text("")),
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainApp()));
                  },
                ),
                ListTile(
                  title: Text('Daftar'),
                  leading: Icon(Icons.book),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()));
                  },
                ),
                ListTile(
                  title: Text('Daftar User'),
                  leading: Icon(Icons.list),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserScreen()));
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue,
            child: Icon(Icons.refresh),
          ),
          appBar: AppBar(
            title: Text('User'),
            backgroundColor: Colors.blue,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // kotak start
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '',
                              style: TextStyle(
                                  fontSize: 16,
                                  color:
                                      const Color.fromARGB(255, 218, 183, 102)),
                            ),
                          ],
                        ),
                        // kotak end
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          )),
    );
  }
}
