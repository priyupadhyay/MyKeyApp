import 'package:flutter/material.dart';
import 'package:my_key_maker/styles/colors.dart';
import 'package:provider/provider.dart';
import 'package:my_key_maker/blocks/auth_block.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthBlock authBlock = Provider.of<AuthBlock>(context);
    
    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        color: Colors.grey.shade100,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              child: Image.asset('assets/images/logo.png'),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Welcome,",
                style: TextStyle(
                    color: Colors.grey.shade900,
                    fontWeight: FontWeight.w700,
                    fontSize: 30.0,
                    letterSpacing: 0.9),
              ),
            ),
            Text("login with mobile number.",
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    letterSpacing: 0.6)),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phoneNumberController,
                autofocus: false,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  labelText: 'Mobile Number',
                  prefixText: "+91 ",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: (String value) {
                  if (value.length != 10)
                    return 'Mobile Number must be of 10 digit';
                  else
                    return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    print("login");
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/", (Route<dynamic> route) => false);
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: AccentColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        "Get OTP",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    ]));
  }
}
/*To add form and validation in this*/