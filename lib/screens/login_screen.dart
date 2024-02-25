import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/user_screens/main_screen.dart';
import 'package:getwidget/getwidget.dart';

enum AuthMode { Signup, Login }

class LoginScreen extends StatefulWidget {
  LoginScreen();
  static const routeName = '/auth';
  var isAuth = false;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin { AuthMode _authMode = AuthMode.Login;
  final GlobalKey<FormState> _formKey = GlobalKey();
 
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  late AnimationController _animController; //use to start or revert anim
  late Animation<Offset>
      _slideAnimation; //this do all the heavy lifting of changing a value overtime
  late Animation<double> _animOpacity;

  String selectedValue = 'user'; // Holds the selected value

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -1.5), end: const Offset(0, 0))
            .animate(
                CurvedAnimation(parent: _animController, curve: Curves.linear));
    //_heightAnimation.addListener(() => setState(
    //  () {})); //this to call setState when it updates it should updates whenever redraws the screen
    _animOpacity = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animController, curve: Curves.linear));
  }

  bool get isAuthh {
    //print(token);
    return widget.isAuth;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animController.dispose();
  }

  void _showDialog(String messeage) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('An Error Occoured'),
              content: Text(messeage),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('Ok'))
              ],
            ));
  }

  void _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }print(selectedValue);
    _formKey.currentState!.save();
    
    setState(() {
      _isLoading = true;
    });
    //  try {
    if (_authMode == AuthMode.Login) {
      // home: LoginScreen(),
      //print();
      Navigator.of(context).pushNamed(MainScreen.routeName);
      print(_authData['email'].toString() +
          '   ' +
          _authData['password'].toString() +
          ' ' +
          'login');
      // await Provider.of<Auth>(context, listen: false).login(
      //     _authData['email'].toString(), _authData['password'].toString());
    } else {
      // widget.isAuth = true;
      Navigator.of(context).pushNamed(MainScreen.routeName);
      print(_authData['email'].toString() +
          '   ' +
          _authData['password'].toString() +
          'signup');
      // await Provider.of<Auth>(context, listen: false).signup(
      //     _authData['email'].toString(), _authData['password'].toString());
    }
    // } on HttpException catch (error) {
    //   // print(error.messeage);
    //   var errMes = 'Authentication Faild';
    //   if (error.toString().contains('EMAIL_EXISTS')) {
    //     errMes = 'this EMAIL already in use.';
    //   } else if (error.toString().contains('INVALID_EMAIL')) {
    //     errMes = 'this EMAIL is invalid.';
    //   } else if (error.toString().contains('WEAK_PASSWORD')) {
    //     errMes = 'this PASSWORD is too weak.';
    //   } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
    //     errMes = 'this EMAIL not found.';
    //   } else if (error.toString().contains('INVALID_PASSWORD')) {
    //     errMes = 'this PASSWORD isn\'t correct.';
    //   }
    //   _showDialog(errMes);
    // } catch (error) {
    //   const errMes =
    //       'couldn\'t Authenticate you please turn on the proxy or try again later';
    //   _showDialog(errMes);
    // }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
      _animController.forward(); //this starts the animation
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _animController.reverse(); //this starts the animation from back
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> radioValues = [
      'user',
      'pharmaceutical',
    ];
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 21, 101, 192),
          Color.fromARGB(255, 30, 136, 229)
        ], begin: Alignment.topLeft, end: Alignment.centerRight)),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "welcome to what'sMed",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 24, right: 24, bottom: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 0)),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color(0xFFe7edeb),
                            hintText: "E-Mail",
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.grey[600],
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Invalid email!';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _authData['email'] = value.toString();
                          },
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          //  keyboardType: TextInputType.Password,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: const Color(0xFFe7edeb),
                            hintText: "Password",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey[600],
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value!.length < 5) {
                              return 'Password is too short!';
                            }
                          },
                          onSaved: (value) {
                            _authData['password'] = value.toString();
                          },
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),

                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          constraints: BoxConstraints(
                              minHeight: _authMode == AuthMode.Signup ? 60 : 0,
                              maxHeight:
                                  _authMode == AuthMode.Signup ? 120 : 0),
                          curve: Curves.easeIn,
                          child: FadeTransition(
                            opacity: _animOpacity,
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: TextFormField(
                                //  controller: _passwordController,
                                obscureText: true,
                                enabled: _authMode == AuthMode.Signup,
                                //keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFe7edeb),
                                  hintText: "Confirm Password",
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                validator: _authMode == AuthMode.Signup
                                    ? (value) {
                                        print(_passwordController.text +
                                            '    ' +
                                            '2222222222' +
                                            '    ' +
                                            value.toString());
                                        if (value != _passwordController.text) {
                                          return 'Passwords do not match!';
                                        }
                                      }
                                    : null,
                              ),
                            ),
                          ),
                        ),
                        _authMode == AuthMode.Login
                            ? GestureDetector(
                                onTap: () {
                                  print('forget password');
                                },
                                //   color: Colors.blue,
                                child: const Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 0),
                                    child: Text(
                                      'Forget your password',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color:
                                              Color.fromARGB(255, 66, 165, 245),
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                              )
                            : Text(''),
                        Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  _authMode == AuthMode.Signup
                                      ? Expanded(
                                          child: RadioListTile(
                                            title: Text(radioValues[0],
                                                style: const TextStyle(
                                                    fontSize: 16)),
                                            value: radioValues[0],
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue =
                                                    value.toString();
                                              });
                                            },
                                            contentPadding: EdgeInsets.zero,
                                          ),
                                        )
                                      : Text(''),
                                  _authMode == AuthMode.Signup
                                      ? Expanded(
                                          child: RadioListTile(
                                            title: Text(
                                              radioValues[1],
                                              style:
                                                  const TextStyle(fontSize: 14),
                                            ),
                                            value: radioValues[1],
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue =
                                                    value.toString();
                                              });
                                            },
                                            contentPadding: EdgeInsets
                                                .zero, // Set padding to zero
                                          ),
                                        )
                                      : Text(''),
                                ],
                              ),

                              //  ],
                              //   ),
                              const Padding(padding: EdgeInsets.only(top: 0)),
                              ElevatedButton(
                                child: Text(_authMode == AuthMode.Login
                                    ? '     LOGIN     '
                                    : '   SIGN UP   '),
                                onPressed: _submit,
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(30),
                                // ),
                                // padding:
                                //     EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                                // color: Theme.of(context).primaryColor,
                                // textColor: Theme.of(context).primaryTextTheme.button.color,
                              ),
                            ],
                          ),
                        ),
                        // const SizedBox(
                        //   height: 10.0,
                        // ),
                        const Text('OR'),
                        // const SizedBox(
                        //   height: 20.0,
                        // ),

                        Container(
                          child: Column(
                            children: [
                              const Padding(padding: EdgeInsets.only(top: 2)),
                              TextButton(
                                child: Text(
                                    '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                                onPressed: _switchAuthMode,
                                // padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                // textColor: Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
       
       
            ],
          ),
        ),
      )),
    );
  }
}
