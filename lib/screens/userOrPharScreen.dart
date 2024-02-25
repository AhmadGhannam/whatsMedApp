import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/phar_screens/PharSignupScreen.dart';
import 'package:flutter_travel_concept/screens/user_screens/userSignupScreen.dart';

class UserPharScreen extends StatelessWidget {
  UserPharScreen({super.key});
  static const routeName = 'UserPharScreen';

  TextEditingController PasswordFieldController = TextEditingController();
  TextEditingController EmailFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text(''),),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/intro.PNG'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 100,
                  child: Text(
                    "welcome to what'sMed",
                    style: TextStyle(
                      color: Colors.blueGrey[500],
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: EmailFieldController,
                    decoration: const InputDecoration(
                      labelText: "E-Mail",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: PasswordFieldController,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    print(EmailFieldController.text);
                    print(PasswordFieldController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[500],
                  ),
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 80,
                  child: Text(
                    'or signup as a',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.04,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(userSignupScreen.routename);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[500],
                      ),
                      child: const Text(' User '),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height * 0.1,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return PhSignupScreen();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[500],
                      ),
                      child: const Text('Pharmaceutical'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
