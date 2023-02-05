import 'package:flutter/material.dart';
import 'package:font_app/controller/fonts_controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FontController fontController = Get.put(FontController());
    return SimpleBuilder(builder: (context) {
      return GetMaterialApp(
        initialRoute: fontController.intFont().toString(),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  FontController fontController = Get.put(FontController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FontController>(
        init: fontController,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Flutter Fonts',
                style: TextStyle(fontFamily: fontController.fontUse.toString()),
              ),
            ),
            body: ListView.builder(
              itemCount: context.fonts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                      onTap: () {
                        fontController.changFont(index);
                      },
                      leading: fontController.fontUse.toString() ==
                              fontController.fonts[index]
                          ? const Icon(
                              Icons.done,
                              color: Colors.blue,
                            )
                          : const SizedBox(),
                      title: Text(fontController.fonts[index].toString())),
                );
              },
            ),
            floatingActionButton: const FloatingActionButton(
              onPressed: null,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
