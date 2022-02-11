import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/components/drawer/custom_drawer.dart';
import 'package:olx_mobx/screens/edit_account/edit_account_screens.dart';
import 'package:olx_mobx/screens/myads/myads_screens.dart';
import 'package:olx_mobx/stores/user_menage_stores.dart';

class AccountScreens extends StatelessWidget {
  const AccountScreens({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Minha conta"),
        centerTitle: true,
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 140,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(GetIt.I<UserMenageStore>().user.name,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.purple,
                                  fontWeight: FontWeight.w900)),
                          Text(
                            GetIt.I<UserMenageStore>().user.email,
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FlatButton(
                        child: Text("EDITAR"),
                        textColor: Colors.purple,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => EditAccountScreen()));
                        },
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              ListTile(
                title: Text("Meus anúncios",
                    style: TextStyle(
                        color: Colors.purple, fontWeight: FontWeight.w600)),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => MyAds()));
                },
              ),
              ListTile(
                title: Text(
                  "Favoritos",
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.w600),
                ),
                trailing: Icon(Icons.keyboard_arrow_right),
              )
            ],
          ),
        ),
      ),
    );
  }
}
