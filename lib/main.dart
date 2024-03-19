import 'package:flutter/material.dart';
import 'package:flutter_in_app_pip/navigatable_pip_widget.dart';
import 'package:flutter_in_app_pip/picture_in_picture.dart';
import 'package:flutter_in_app_pip/pip_material_app.dart';
import 'package:flutter_in_app_pip/pip_params.dart';
import 'package:flutter_in_app_pip/pip_view_corner.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PiPMaterialApp(
      pipParams: const PiPParams(
        pipWindowHeight: 300,
        pipWindowWidth: 150,
        bottomSpace: 10,
        leftSpace: 10,
        rightSpace: 10,
        topSpace: 10,
        maxSize: Size(800, 200),
        minSize: Size(150, 100),
        movable: true,
        resizable: false,
        initialCorner: PIPViewCorner.bottomRight,
        // Diğer parametreler...
      ),
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Burada PiP modunu başlat
              PictureInPicture.startPiP(
                  pipWidget: NavigatablePiPWidget(
                builder: (context) {
                  return MyPiPWidget();
                },
                onPiPClose: () {
                  //Handle closing events e.g. dispose controllers.
                },
                elevation: 50, //Optional
                pipBorderRadius: 50, //Optional
              ));
            },
            child: const Text('Start PiP'),
          ),
        ),
      ),
    );
  }
}

class MyPiPWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("PiP Mode"),
      ),
      body: Container(
        color: Colors.green,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.red,
              child: const Text('data'),
            ),
            ElevatedButton(
              onPressed: () {
                PictureInPicture.updatePiPParams(
                  pipParams: const PiPParams(
                    pipWindowHeight: 600,
                    pipWindowWidth: 150,
                    bottomSpace: 10,
                    leftSpace: 10,
                    rightSpace: 10,
                    topSpace: 10,
                    maxSize: Size(800, 200),
                    minSize: Size(150, 100),
                    movable: true,
                    resizable: false,
                    initialCorner: PIPViewCorner.bottomRight,
                  ),
                );
              },
              child: const Text('data'),
            ),
          ],
        ),
      ),
      // Widget içeriği...
    );
  }
}
