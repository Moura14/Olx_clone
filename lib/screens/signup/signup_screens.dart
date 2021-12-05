import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:olx_mobx/components/error_box.dart';
import 'package:olx_mobx/screens/signup/components/field_title.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:olx_mobx/stores/signup_stores.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignUpScreens extends StatelessWidget {
  final SignUpStore signUpStore = SignUpStore();
  //const SignUpScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastrar"),
        centerTitle: true,
      ),
      body: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Card(
                margin: EdgeInsets.symmetric(horizontal: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Observer(builder: (_) {
                        return ErrorBox(signUpStore.error);
                      }),
                      FieldTitle("Apelido", "Como aparecerá em seus anúncios"),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Exemplo: João Moura",
                              isDense: true,
                              errorText: signUpStore.nameError),
                          onChanged: signUpStore.setName,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      FieldTitle(
                          "E-mail", "Enviaremos um e-mail de confirmação"),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Exemplo:joao@gmail.com",
                              isDense: true,
                              errorText: signUpStore.emailError),
                          onChanged: signUpStore.setEmail,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      FieldTitle("Celular", "Proteja sua conta"),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "(21) 4002-8922",
                              isDense: true,
                              errorText: signUpStore.phoneError),
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                          onChanged: signUpStore.setPhone,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      FieldTitle("Senha",
                          "Use letras, números e caracteres especiais"),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              errorText: signUpStore.passError),
                          obscureText: true,
                          onChanged: signUpStore.setPassword,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      FieldTitle("Confirmar senha", "Repita a senha"),
                      Observer(builder: (_) {
                        return TextField(
                          enabled: !signUpStore.loading,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              errorText: signUpStore.passwordError2),
                          obscureText: true,
                          onChanged: signUpStore.setPassword2,
                        );
                      }),
                      SizedBox(
                        height: 16,
                      ),
                      Observer(builder: (_) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 20, bottom: 12),
                          child: RaisedButton(
                            onPressed: signUpStore.signUpPressed,
                            color: Colors.orange,
                            disabledColor: Colors.orange.withAlpha(120),
                            child: signUpStore.loading
                                ? CircularProgressIndicator()
                                : Text("Cadastrar"),
                            textColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        );
                      }),
                      Divider(
                        color: Colors.black,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          Text(
                            "Já tem uma conta?",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Entrar",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.purple,
                                fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          )),
    );
  }
}
