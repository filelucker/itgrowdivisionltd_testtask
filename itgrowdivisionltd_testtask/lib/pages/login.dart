import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../models/common_request.dart';
import '../provider/data_provider.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  static Map<String, TextEditingController> controllers = {
    'login': TextEditingController(),
    'password': TextEditingController(),
  };

bool _passwordVisible = false;

@override
  void initState() {
    super.initState();
  autoLogIn();
  }


  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Peanut Login Page')),
        body: Consumer<DataProvider>(
    builder: (context, provider, widget) {
      if(!provider.loading) {
        return Center(
          child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      width: double.infinity,
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          controller: controllers['login'],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Login is required';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_sharp),
                            labelText: "Login",
                            // errorText: "Email required",
                            labelStyle: TextStyle(
                                color: Color(0xFF454545),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                            hintText: "Enter Login",
                            hintStyle: TextStyle(
                                color: Color(0xFF454545),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                            border: OutlineInputBorder(),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          style: const TextStyle(
                              color: Color(0xFF454545),
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 15, bottom: 0),
                          child: TextFormField(
                            controller: controllers['password'],

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password is required';
                              }
                              return null;
                            },
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.key),
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                  color: Color(0xFF454545),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              hintText: "Enter your password",
                              hintStyle: const TextStyle(
                                  color: Color(0xFF454545),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              border: const OutlineInputBorder(),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme
                                      .of(context)
                                      .primaryColorDark,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            style: const TextStyle(
                                color: Color(0xFF454545),
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 15.0),
                        child: ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (formkey.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                                // ShowToast.show('Sending data', false);
                                // var random = Random();
                                var model = new CommonRequest(
                                  password: controllers['password']
                                      ?.text as String,
                                  login: int.parse(
                                      controllers['login']?.text as String),
                                );

                                Provider.of<DataProvider>(
                                    context, listen: false)
                                    .loginUser(context, model);
                              }
                            },
                            child: const Text('Submit')),
                      ),
                    ),
                    const SizedBox(
                      width: double.infinity,
                      height: 20,
                    ),
                  ],
                ),
              )),
        );
      }else{
        return Center(child: CircularProgressIndicator(),);
      }
    },
        ),
      ),
    );
  }

  void autoLogIn() async {
    final storage = await GetStorage();
    if(storage.read('login') != null && storage.read('token') != null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Home()));
    }
  }
}
