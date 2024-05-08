import 'package:cardealership/controllers/cart_controller.dart';
import 'package:cardealership/controllers/favorite_controller.dart';
import 'package:cardealership/controllers/home_controller.dart';

import 'package:cardealership/controllers/repository/auth_repository.dart';
import 'package:cardealership/controllers/spare_part_controller.dart';
import 'package:cardealership/firebase_options.dart';
import 'package:cardealership/utils/constants/lists.dart';
import 'package:cardealership/utils/constants/text_strings.dart';
import 'package:cardealership/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

//get storage
  GetStorage.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthRepository()));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: AppTexts.splashPage,
      initialBinding: BindingsBuilder(() {
        Get.put(HomeController());
        Get.put(SparePartsController());
        Get.put(CartController());
        Get.put(FavoriteController());
      }),
      getPages: AppLists.getPages,
    );
  }
}
