import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/helpers/location_helper.dart';
import 'package:location/location.dart';

import 'package:flutter_travel_concept/util/countries.dart';
import 'package:getwidget/getwidget.dart';

class PhSignupScreen extends StatefulWidget {
  PhSignupScreen({super.key});
  static const routeName = 'PhSignupScreen';
  @override
  State<PhSignupScreen> createState() => _PhSignupScreenState();
}

class _PhSignupScreenState extends State<PhSignupScreen> {
  //final GlobalKey<FormState> _formKey = GlobalKey();
  final _passwordController = TextEditingController();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  Map countriess = countries as Map;
  List<String> countriesJustFile = countriesJust;
  String CountryselectedValue = 'Syria'; // Holds the selected value
  String StateselectedValue = countries['Syria']![0];
  bool isObsecurePassword = true;
  TextEditingController FullNameFieldController = TextEditingController();
  TextEditingController PasswordFieldController = TextEditingController();
  TextEditingController EmailFieldController = TextEditingController();
  TextEditingController PharamacyNameFieldController = TextEditingController();
  TextEditingController WorkingTimesFieldController = TextEditingController();
  TextEditingController imgPathFieldController = TextEditingController();
  TextEditingController AddressFieldController = TextEditingController();
  TextEditingController phoneNumberFieldController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String qwer = '';
  double latitude = 0.0;
  double longtude = 0.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    print(locData.latitude!);
    latitude = locData.latitude!;
    longtude = locData.longitude!;
  }

  @override
  void initState() {
    _getCurrentUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                          child:TextFormField(
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
                        ),),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                            //obscureText: true,

                            controller: PharamacyNameFieldController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              //  : null,
                              //contentPadding: EdgeInsets.only(top: 20),
                              labelText: 'Pharamacy Name',
                              //floatingLabelBehavior: FloatingLabelBehavior.always,
                              //hintText: 'Al Ahm Pharamacy',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            validator: (value) {
                              print('value2');
                              if (value!.isEmpty) {
                                return 'Write Your Pharamacy Name';
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
                              //  : null,
                              //contentPadding: EdgeInsets.only(top: 20),
                              labelText: 'E-Mail',

                              //hintText: 'ahm@gmail.com',
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
                                  setState(() {
                                    isObsecurePassword = !isObsecurePassword;
                                  });
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
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                            controller: WorkingTimesFieldController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Working Times',
                            ),
                            validator: (value) {
                              print('value2');
                              if (value!.isEmpty) {
                                return 'Write Your Working Times';
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
                            controller: imgPathFieldController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'imgPath Name',
                            ),

                            validator: (value) {
                              print('value2');
                              if (value!.isEmpty) {
                                return 'Write Your imgPath';
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
                          child:TextFormField(
                          //obscureText: true,
                          controller: AddressFieldController,
                          decoration: const InputDecoration(
                            //  : null,
                             border: OutlineInputBorder(),
                            labelText: 'Pharamacy Address',
                            
                          ),

                          validator: (value) {
                            print('value2');
                            if (value!.isEmpty) {
                              return 'Write Your Pharamacy Address';
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
                          child:TextFormField(
                          //obscureText: true,
                          keyboardType: TextInputType.phone,
                          controller: phoneNumberFieldController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            
                            labelText: 'phone of pharamacy',
                            
                          ),

                          validator: (value) {
                            print('value2');
                            if (value!.isEmpty) {
                              return 'Write Your phone of pharamacy';
                            }
                            return null;
                          },
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
              //buildTextField('Location', 'Damas', false,4),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(20),
                child: DropdownButtonHideUnderline(
                  child: GFDropdown<String>(
                    //disabledHint: ,
                    padding: const EdgeInsets.all(15),
                    borderRadius: BorderRadius.circular(5),
                    border: const BorderSide(color: Colors.black12, width: 1),
                    //   dropdownButtonColor: Colors.white,
                    value: CountryselectedValue,
                    dropdownButtonColor: Colors.green[50],
                    dropdownColor: const Color.fromARGB(255, 240, 247, 240),
                    onChanged: (dynamic newValue) {
                      setState(() {
                        StateselectedValue = countries[newValue]![0];
                        print(newValue);
                        CountryselectedValue = newValue;
                      });
                    },
                    items: countriesJustFile
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                        enabled: value == 'Country'
                            ? false
                            : value == 'State'
                                ? false
                                : true, // Disable the 'Devops' item
                      );
                    }).toList(),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 5)),
              Container(
                // color: Color.fromARGB(255, 255, 0, 0),
                height: 50,
                //width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(20),
                child: Container(
                  // color: Color.fromARGB(255, 255, 0, 0),  // Se
                  decoration: BoxDecoration(
                    //  color: Color.fromARGB(255, 255, 0, 0),
                    border: Border.all(
                        color: const Color.fromARGB(31, 255, 0, 0), width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Container(
                      // color: Color.fromARGB(255, 255, 0, 0), // Set the color inside DropdownButtonHideUnderline here
                      child: GFDropdown<String>(
                          padding: const EdgeInsets.all(15),
                          borderRadius: BorderRadius.circular(5),
                          dropdownColor:
                              const Color.fromARGB(255, 240, 247, 240),
                          value: StateselectedValue,
                          onChanged: (dynamic newValue) {
                            setState(() {
                              StateselectedValue = newValue;
                            });
                          },
                          items: getDropdownItems(CountryselectedValue),
                          dropdownButtonColor: Colors.green[50]),
                    ),
                  ),
                ),
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
                      print(AddressFieldController.text);
                      print(phoneNumberFieldController.text);
                      print(imgPathFieldController.text);
                      print(WorkingTimesFieldController.text);
                      print(PharamacyNameFieldController.text);

                      print(CountryselectedValue);
                      print(StateselectedValue);

                      print(latitude);
                      print(longtude);

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

          /*        Center(
            child: Align(
              alignment: FractionalOffset(0.5, 0.2),
              heightFactor: 20,
              child: TextFormField(
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
            ),
          ),
          Center(
            child: Align(
              alignment: FractionalOffset(0.5, 0.37),
              heightFactor: 20,
              child: TextFormField(
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
            ),
          ),
          Center(
            child: Align(
              alignment: FractionalOffset(0.5, 0.55),
              heightFactor: 20,
              child: TextFormField(
                  //  controller: _passwordController,
                  obscureText: true,
                  //   enabled: _authMode == AuthMode.Signup,
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
                  validator: (value) {
                    print(_passwordController.text +
                        '    ' +
                        '2222222222' +
                        '    ' +
                        value.toString());
                    if (value != _passwordController.text) {
                      return 'Passwords do not match!';
                    }
                  }),
            ),
          ),
    */
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropdownItems(String selectedCountry) {
    List<DropdownMenuItem<String>> dropdownItems = [];
    // Find the matching country object in the countries map
    var countryStates = countries[selectedCountry];
    if (countryStates != null) {
      // Create DropdownMenuItem for each state
      dropdownItems = countryStates.map((state) {
        return DropdownMenuItem<String>(
          value: state,
          child: Text(state),
        );
      }).toList();
    }
    // Add a default 'State' DropdownMenuItem if no states found
    if (dropdownItems.isEmpty) {
      dropdownItems.add(
        DropdownMenuItem<String>(
          value: 'State',
          child: Text('State'),
          enabled: false,
        ),
      );
    } else if (!dropdownItems.any((item) => item.value == 'State')) {
      // Add 'State' DropdownMenuItem if it doesn't already exist
      dropdownItems.insert(
        0,
        DropdownMenuItem<String>(
          value: 'State',
          child: Text('State'),
          enabled: false,
        ),
      );
    }
    return dropdownItems;
  }

  Widget buildTextField(
      String labelText, String placeHolder, bool isPasswordTextFeild, int num) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: Form(
            child: TextFormField(
          obscureText: true,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(
                  Icons.remove_red_eye,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    isObsecurePassword = !isObsecurePassword;
                  });
                },
              ),
              //  : null,
              contentPadding: const EdgeInsets.only(bottom: 5),
              labelText: labelText,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: placeHolder,
              hintStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          validator: (value) {
            print('value2');
            if (value!.isEmpty || value!.length < 5) {
              return 'Password is too short!';
            }
            return null;
          },
        )));
  }
}
