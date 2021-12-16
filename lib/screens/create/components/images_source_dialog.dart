import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceModal extends StatelessWidget {
  //const ImageSourceModal({Key key}) : super(key: key);

  ImageSourceModal(this.onImageSelected);

  final Function(File) onImageSelected;

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid)
      return BottomSheet(
          onClosing: () {},
          builder: (_) => Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FlatButton(
                    child: Text("Câmera"),
                    onPressed: getFromCamera,
                  ),
                  FlatButton(
                    child: Text("Galeria"),
                    onPressed: getFromGalery,
                  )
                ],
              ));
    else
      return CupertinoActionSheet(
        title: Text("Selecionar foto para o anúncio"),
        message: Text("Escolha a origem da foto"),
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            "Cancelar",
            style: TextStyle(color: Colors.red),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          CupertinoActionSheetAction(
            child: Text("Câmera"),
            onPressed: getFromCamera,
          ),
          CupertinoActionSheetAction(
            child: Text("Galeria"),
            onPressed: getFromGalery,
          )
        ],
      );
  }

  Future<void> getFromCamera() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile == null) return null;

    final image = File(pickedFile.path);
    imageSelected(image);
  }

  Future<void> getFromGalery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;

    final image = File(pickedFile.path);
    imageSelected(image);
  }

  Future<void> imageSelected(File image) async {
    final croppedFile = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(
          ratioX: 1,
          ratioY: 1,
        ),
        androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Editar imagem',
          toolbarColor: Colors.purple,
          toolbarWidgetColor: Colors.white,
        ),
        iosUiSettings: IOSUiSettings(
            title: "Editar imagem",
            cancelButtonTitle: "Cancelar",
            doneButtonTitle: "Concluir"));

    if (croppedFile != null) onImageSelected(croppedFile);
  }
}
