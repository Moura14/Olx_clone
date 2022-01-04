import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:olx_mobx/screens/create/components/image_dialog.dart';
import 'package:olx_mobx/screens/create/components/images_source_dialog.dart';
import 'package:olx_mobx/stores/create_stores.dart';

class ImagesField extends StatelessWidget {
  final CreateStores createStores;

  ImagesField(this.createStores);
  //const ImagesField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onImageSelected(File image) {
      createStores.images.add(image);
      Navigator.of(context).pop();
    }

    return Column(
      children: [
        Container(
            color: Colors.grey[200],
            height: 120,
            child: Observer(
              builder: (_) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: createStores.images.length < 5
                      ? createStores.images.length + 1
                      : 5,
                  itemBuilder: (_, index) {
                    if (index == createStores.images.length)
                      return Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                        child: GestureDetector(
                          onTap: () {
                            if (Platform.isAndroid) {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (_) =>
                                      ImageSourceModal(onImageSelected));
                            } else {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (_) =>
                                      ImageSourceModal(onImageSelected));
                            }
                          },
                          child: CircleAvatar(
                            radius: 44,
                            backgroundColor: Colors.grey[300],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    else
                      return Padding(
                        padding:
                            EdgeInsets.fromLTRB(8, 8, index == 4 ? 8 : 0, 8),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (_) => ImageDialog(
                                    image: createStores.images[index],
                                    onDelete: () =>
                                        createStores.images.removeAt(index)));
                          },
                          child: CircleAvatar(
                              radius: 44,
                              backgroundImage:
                                  FileImage(createStores.images[index])),
                        ),
                      );
                  },
                );
              },
            )),
        Observer(builder: (_) {
          if (createStores.imagesError != null)
            return Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.red)),
              ),
              padding: EdgeInsets.fromLTRB(16, 8, 0, 8),
              child: Text(
                createStores.imagesError,
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            );
          else
            return Container();
        })
      ],
    );
  }
}
