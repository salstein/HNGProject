import 'package:flutter/material.dart';
import 'package:zuriproject/buttons.dart';
import '../color.dart';

bool boolEmail = false;
bool boolName = false;
bool _display = false;
String name = "";
String email = "";

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();

  var submitted = false;
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  void initState() {
    super.initState();
    _emailController.addListener(setEmail);
    _nameController.addListener(setName);
  }

  void setEmail() {
    if (_emailController.text.toString().trim() == '') {
      setState(() {
        boolEmail = false;
      });
    } else
      setState(() {
        boolEmail = true;
      });
  }

  void setName() {
    if (_nameController.text.toString().trim() == '') {
      setState(() {
        boolName = false;
      });
    } else
      setState(() {
        boolName = true;
      });
  }

  void _submit() {
    setState(() {
      submitted = true;
      _display = true;
      name = _nameController.text.toString().trim();
      email = _emailController.text.toString().trim();
      submitted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        centerTitle: true,
        title: Text("Registration"),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 20, right: 20, left: 20),
        child: Container(
          decoration: BoxDecoration(
              color: color1,
              border: Border.all(color: Colors.white, width: 1.0),
              borderRadius: BorderRadius.circular(10.0)),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: color1),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Full Name',
                      hintStyle: TextStyle(color: color1, fontSize: 13),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: color1),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: color1, fontSize: 13),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    onPressed: (boolName == true && boolEmail == true)
                        ? _submit //submit here
                        : null,
                    color: Colors.white,
                    disabledColor: Colors.grey.withOpacity(0.89),
                    disabledTextColor: Colors.white60,
                    textColor: Colors.black,
                    padding: EdgeInsets.all(15.0),
                    child: submitted
                        ? SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.black),
                            ),
                          )
                        : Text(
                            'SUBMIT',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                  ),
                ),
                _display?Padding(
                  padding:
                      const EdgeInsets.only(top: 20, right: 8.0, left: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white, width: 1.0),
                        borderRadius: BorderRadius.circular(20.0)),
                    height: 200,
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Your Name is:  $name",
                          style: TextStyle(color: color1, fontSize: 15),
                        ),
                        Text("Your Email is:  $email",
                            style: TextStyle(color: color1, fontSize: 15))
                      ],
                    ),
                  ),
                ):Text("")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
