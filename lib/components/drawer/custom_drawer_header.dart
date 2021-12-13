import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:olx_mobx/screens/login/login_screen.dart';
import 'package:olx_mobx/stores/page_store.dart';
import 'package:olx_mobx/stores/user_menage_stores.dart';

class CustomDrawerHeader extends StatelessWidget {
  final UserMenageStore userMenageStore = GetIt.I<UserMenageStore>();
  //const CustomDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        if (userMenageStore.isLoggedIn) {
          GetIt.I<PageStore>().setPage(4);
        } else {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => LoginScreen()));
        }
      },
      child: Container(
        color: Colors.purple,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    userMenageStore.isLoggedIn
                        ? userMenageStore.user.name
                        : "Acesse sua conta agora!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                Text(
                  userMenageStore.isLoggedIn
                      ? userMenageStore.user.email
                      : "Clique aqui",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
