import 'package:flutter/material.dart';
import 'package:to_do_app/service/register_service.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Text("Register",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Form(
                    key: _formkey,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          _usernameTextField(),
                          SizedBox(
                            height: 20,
                          ),
                          _passwordTextField(),
                          SizedBox(
                            height: 40,
                          ),
                          _tombolRegister(),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Username"),
      controller: _usernameCtrl,
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Password"),
      obscureText: true,
      controller: _passwordCtrl,
    );
  }

  Widget _tombolRegister() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          child: Text("Register"),
          onPressed: () async {
            String username = _usernameCtrl.text;
            String password = _passwordCtrl.text;
            await RegisterService().register(username, password).then((value) {
              if (value == true) {
                Navigator.pop(
                    context); // Kembali ke halaman login setelah registrasi berhasil
              } else {
                AlertDialog alertDialog = AlertDialog(
                  content: Text("Registrasi gagal"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Ok"),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                    )
                  ],
                );
                showDialog(context: context, builder: (context) => alertDialog);
              }
            });
          }),
    );
  }
}
