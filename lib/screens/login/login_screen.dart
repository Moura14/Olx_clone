import 'package:flutter/material.dart';
import 'package:olx_mobx/screens/signup/signup_screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Entrar"), centerTitle: true),
        body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 32),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Acessar com E-mail",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3, bottom: 4),
                        child: Text(
                          "E-mail",
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), isDense: true),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3, bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Senha",
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Esqueceu sua senha?",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.purple),
                              ),
                            )
                          ],
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), isDense: true),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.only(top: 20, bottom: 12),
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.orange,
                          child: Text("ENTRAR"),
                          textColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Divider(color: Colors.black),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            Text(
                              "Não tem uma conta?",
                              style: TextStyle(fontSize: 16),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => SignUpScreens()));
                                },
                                child: Text(
                                  "Cadastre - se",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.purple,
                                    fontSize: 16,
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
