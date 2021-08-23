import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:some_app/widgets/popups.dart';

import '../controller.dart';

class SettingsPage extends StatelessWidget {

    const SettingsPage({Key? key, this.themeNotifier}) : super(key: key);

    final ValueNotifier<ThemeMode>? themeNotifier;
    @override Widget build(context) {

        // Instantiate your class using Get.put() to make it available for all "child" routes there.
        final Controller controller = Get.find();

        return Scaffold(
            // Use Obx(()=> to update Text() whenever count is changed.
//            appBar: AppBar(title: Obx(() => Text("Clicks: ${c.count}"))),
            appBar: AppBar(title: const Text("Settings")),

            // Replace the 8 lines Navigator.push by a simple Get.to(). You don't need context
//            body: Center(child: ElevatedButton(
//                child: Text("Go to Other"), onPressed: () => Get.to(Other()))
//            ),

            body: WillPopScope(
                child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                        Obx(() => ListTile(
                            title: Text(
                                'Dark theme',
//                                style: TextStyle(fontSize: 16, color: Colors.black38),
                                style: TextStyle(
                                    fontSize: 16,
//                                    color: (themeNotifier?.value == ThemeMode.dark) ? Theme.of(context).primaryColor : Colors.black38
                                    color: (themeNotifier?.value == ThemeMode.dark) ? Colors.white54 : Colors.black38
                                ),
                            ),
                            trailing: CupertinoSwitch(
                                value: controller.settings.containsKey('theme')
                                    ? controller.settings['theme'] == true.toString()
                                    : false,
                                activeColor: CupertinoColors.secondarySystemFill,
                                trackColor: CupertinoColors.systemTeal,
                                onChanged: (val) {
                                    //                                setState(() {
                                    //                                    PrefService.setBool('feature_enabled', val);
                                    //                                });

//                                    popup(context, 'in process (to do)');
//                                    MediaQuery.of(context).platformBrightness == Brightness.dark;
                                    var curTheme =  MediaQuery.of(context).platformBrightness;
                                    themeNotifier?.value = val ? ThemeMode.dark : ThemeMode.light;
                                    controller.settings['theme'] = val.toString();
                                },
                            ),
                            onTap: () {
                                //                            setState(() {
                                //                                PrefService.setBool(
                                //                                    'feature_enabled', !PrefService.getBool('feature_enabled'));
                                //                            });
                            },
                        ))
                    ]
                ),
                onWillPop: () async {
                    return true;
                }
            )
        );
    }
}


//class Other extends StatelessWidget {
//    // You can ask Get to find a Controller that is being used by another page and redirect you to it.
//    final Controller c = Get.find();
//
//    @override
//    Widget build(context){
//        // Access the updated count variable
//        return Scaffold(body: Center(child: Text("${c.count}")));
//    }
//}