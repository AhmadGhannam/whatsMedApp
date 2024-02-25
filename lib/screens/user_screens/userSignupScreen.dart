import 'package:flutter/material.dart';

class userSignupScreen extends StatelessWidget {
  static const String routename = 'userSignupScreen';

  userSignupScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isObsecurePassword = true;

  TextEditingController FullNameFieldController = TextEditingController();
  TextEditingController PasswordFieldController = TextEditingController();
  TextEditingController EmailFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/intro.PNG',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1))
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/person-icon.png'))),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                            //obscureText: true,
                            controller: FullNameFieldController,
                            decoration: const InputDecoration(
                              //  : null,
                              border: OutlineInputBorder(),
                              labelText: 'Full Name',
                            ),

                            validator: (value) {
                              print('value2');
                              if (value!.isEmpty) {
                                return 'Write Your Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                            //obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            controller: EmailFieldController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'E-Mail',
                            ),

                            validator: (value) {
                              print('value2');
                              if (value!.isEmpty || !value!.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                            obscureText: true,
                            controller: PasswordFieldController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  // setState(() {
                                  //   isObsecurePassword = !isObsecurePassword;
                                  // });
                                },
                              ),
                              //  : null,
                              //contentPadding: const EdgeInsets.only(top: 20),
                              labelText: 'password',
                            ),
                            validator: (value) {
                              print('value2');
                              if (value!.isEmpty || value!.length < 5) {
                                return 'Password is too short!';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //buildTextField('Location', 'Damas', false,4),
              const SizedBox(
                height: 5,
              ),

              //  const Padding(padding: EdgeInsets.only(top: 30)),
              // Card(
              //   color: Colors.green[100],
              //   child:Container(
              // //  width:0.1,
              //  child: Text('when u click save we will take your location as a pharamacy location',
              //  style: TextStyle(fontSize: 20),)
              //       ,),),

              //  SizedBox(height: 35,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    // style: OutlinedButton.styleFrom(
                    //     padding: const EdgeInsets.symmetric(horizontal: 50),
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20)
                    //     ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[100],
                    ),
                    child: const Text(
                      'cancel',
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 35,
                  ),

                  ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      print(FullNameFieldController.text);
                      print(EmailFieldController.text);
                      print(PasswordFieldController.text);

                      // _formKey.currentState!.save();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 206, 235, 208),
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20))
                    ),
                    child: const Text(
                      'save',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  )
                  // }
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              //   Text('data')
            ],
          ),
        ],
      ),
    );
  }
}
