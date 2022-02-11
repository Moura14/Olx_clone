import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/stores/edit_account_stores.dart';
import 'package:toggle_switch/toggle_switch.dart';

class EditAccountScreen extends StatelessWidget {
  //const EditAccountScreen({Key key}) : super(key: key);

  final EditAccountStore store = EditAccountStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Text("Editar Conta"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Observer(builder: (_) {
                      return IgnorePointer(
                        ignoring: store.loading,
                        child: LayoutBuilder(
                          builder: (_, constraints) {
                            return ToggleSwitch(
                              minWidth: constraints.biggest.width / 2.01,
                              labels: ["Particular", "Profissional"],
                              totalSwitches: 2,
                              cornerRadius: 20,
                              activeBgColor: [Colors.purple],
                              inactiveBgColor: Colors.grey,
                              activeFgColor: Colors.white,
                              inactiveFgColor: Colors.white,
                              initialLabelIndex: store.userType.index,
                              onToggle: store.setUserType,
                            );
                          },
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 8,
                    ),
                    Observer(builder: (_) {
                      return TextFormField(
                        initialValue: store.name,
                        enabled: !store.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            labelText: "Nome*",
                            errorText: store.nameError),
                        onChanged: store.setName,
                      );
                    }),
                    const SizedBox(
                      height: 8,
                    ),
                    Observer(builder: (_) {
                      return TextFormField(
                        initialValue: store.phone,
                        enabled: !store.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            labelText: "Telefone*",
                            errorText: store.phoneError),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                        onChanged: store.setPhone,
                      );
                    }),
                    SizedBox(
                      height: 8,
                    ),
                    Observer(builder: (_) {
                      return TextFormField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            labelText: "Nova Senha"),
                        obscureText: true,
                        onChanged: store.setPass1,
                      );
                    }),
                    SizedBox(
                      height: 8,
                    ),
                    Observer(builder: (_) {
                      return TextFormField(
                        enabled: !store.loading,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            labelText: "Confirmar senha",
                            errorText: store.passError),
                        obscureText: true,
                        onChanged: store.setPass2,
                      );
                    }),
                    SizedBox(
                      height: 12,
                    ),
                    Observer(builder: (_) {
                      return SizedBox(
                        height: 40,
                        child: RaisedButton(
                            color: Colors.orange,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 0,
                            disabledColor: Colors.orange.withAlpha(100),
                            textColor: Colors.white,
                            child: store.loading
                                ? CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : Text("Salvar"),
                            onPressed: store.savePressed),
                      );
                    }),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 40,
                      child: RaisedButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 0,
                        textColor: Colors.white,
                        child: Text("Sair"),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
