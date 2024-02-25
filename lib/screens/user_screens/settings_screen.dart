import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_travel_concept/screens/user_screens/main_screen.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_travel_concept/util/countries.dart';
import 'package:location/location.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Map countriess = countries as Map;
  List<String> countriesJustFile = countriesJust;
  String CountryselectedValue = 'Country'; // Holds the selected value
  String StateselectedValue = 'State';
  bool isObsecurePassword = true;
  TextEditingController FullNameFieldController = TextEditingController();
  TextEditingController PasswordFieldController = TextEditingController();
  TextEditingController EmailFieldController = TextEditingController();

  Future<void> _getCurrentUserLocation() async {
    print('locData');
    final locData = await Location().getLocation();

    print(locData.longitude);
    print(locData.latitude);
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  String qwer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text('settings'),
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 1, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
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
                              image: NetworkImage(
                                  'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png'))),
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
                        child: Column(children: [
                          TextFormField(
                            //obscureText: true,
                            controller: FullNameFieldController,
                            decoration: const InputDecoration(

                                //  : null,
                                contentPadding: EdgeInsets.only(top: 5),
                                labelText: 'Full Name',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'John Smith',
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),

                            validator: (value) {
                              print('value2');
                              if (value!.isEmpty) {
                                return 'Write Your Name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            //obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            controller: EmailFieldController,
                            decoration: const InputDecoration(

                                //  : null,
                                contentPadding: EdgeInsets.only(top: 20),
                                labelText: 'E-Mail',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: 'ahm@gmail.com',
                                hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),

                            validator: (value) {
                              print('value2');
                              if (value!.isEmpty || !value!.contains('@')) {
                                return 'Invalid email!';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            obscureText: true,
                            controller: PasswordFieldController,
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
                                contentPadding: const EdgeInsets.only(top: 20),
                                labelText: 'password',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                hintText: '******',
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
                          )
                        ]),
                      ))),
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
                    dropdownButtonColor: Colors.white,
                    value: CountryselectedValue,
                    onChanged: (dynamic newValue) {
                      setState(() {
                        StateselectedValue = 'State';
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
                height: 50,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(20),
                child: DropdownButtonHideUnderline(
                  child: GFDropdown<String>(
                    //disabledHint: ,
                    padding: const EdgeInsets.all(15),
                    borderRadius: BorderRadius.circular(5),
                    border: const BorderSide(color: Colors.black12, width: 1),
                    dropdownButtonColor: Colors.white,
                    value: StateselectedValue,
                    onChanged: (dynamic newValue) {
                      setState(() {
                        StateselectedValue = newValue;
                      });
                    },
                    items: getDropdownItems(CountryselectedValue),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      _getCurrentUserLocation();
                      // Navigator.of(context).pushNamed(MainScreen.routeName);
                    },
                    child: const Text(
                      'CANCEL',
                      style: TextStyle(
                          fontSize: 15, letterSpacing: 2, color: Colors.black),
                    ),
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                      print(FullNameFieldController.text);
                      print(EmailFieldController.text);
                      print(PasswordFieldController.text);
                      print(CountryselectedValue);
                      print(StateselectedValue);
                      // _formKey.currentState!.save();
                    },
                    child: const Text(
                      'SAVE',
                      style: TextStyle(
                        fontSize: 15,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )
                ],
              )
            ],
          ),
        ),
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
