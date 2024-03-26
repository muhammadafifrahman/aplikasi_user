import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/RegisterResponse.dart';

void main() {
  runApp(const RegisterScreen());
}

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterResponse? registerResponse = null;
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterScreen'),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0), // Jarak konsisten
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 10.0), // Jarak konsisten
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    labelText: 'Name',
                    border: const OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: jobController,
                  decoration: InputDecoration(
                    hintText: 'Enter your job',
                    labelText: 'Job',
                    border: OutlineInputBorder(),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      RegisterResponse.connectToAPI(
                              nameController.text, jobController.text)
                          .then((value) {
                        registerResponse = value;
                        setState(() {});
                      });
                    },
                    child: const Text('Submit'),
                  ),
                ),
                SizedBox(height: 10),
                Text(registerResponse == null
                    ? 'No Data'
                    : registerResponse!.id +
                        ' | ' +
                        registerResponse!.name +
                        ' | ' +
                        registerResponse!.job +
                        ' | ' +
                        registerResponse!.createAt)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
