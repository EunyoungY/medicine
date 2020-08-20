import 'package:flutter/material.dart';
import 'package:pill_project_app/data/login_of_join.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(color: Colors.white),
        Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _logoImage(),
              //backgroundImage: Image.asset("assets/cat.gif"),
              Stack(children: <Widget>[
                _inputForm(size),
                _authButton(size),
              ]),
              Container(height: size.height * 0.1),
              GestureDetector(
                onTap: () {
                  JoinOrLogin joinOrLogin = Provider.of<JoinOrLogin>(context);
                  joinOrLogin.toogle();
                },
                child: Text("Don't Have an Account? Create One"),
              ),
              Container(height: size.height * 0.05)
            ])
      ],
    ));
  }

  Widget _logoImage() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left:24, right: 24),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://picsum.photos/700"),
          ),
        ),
      ),
    );
  }


  Widget _authButton(Size size) {
    return Positioned(
      left: size.width*0.15,
      right: size.width*0.15,
      bottom: 0,
      child: SizedBox(
        height: 50,
        child: RaisedButton(
            child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.white)),
            color: Colors.indigo,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)),
            onPressed: (){
              if(_formKey.currentState.validate()){
                print("button pressed");
              }
            }),
      ),
    );
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width*0.05),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        elevation: 6,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0, bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.account_circle),
                          labelText: "Email"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please input correct Email.";
                        }
                        return null;
                      }),
                  TextFormField(
                    obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          labelText: "Email"),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Please input correct password.";
                        }
                        return null;
                      }),
                  Container(height:8),
                  Text("Forgot Password"),
                ],
              )),
        ),
      ),
    );
  }

}
