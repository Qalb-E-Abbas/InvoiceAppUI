import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:invoiceapp/application/add_item_provider.dart';
import 'package:invoiceapp/application/add_tax_provider.dart';
import 'package:invoiceapp/application/client_provider.dart';
import 'package:invoiceapp/application/payment_provider.dart';
import 'package:invoiceapp/application/total_cost.dart';
import 'package:invoiceapp/application/uid_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'presentation/Views/sign_in.dart';
import 'application/add_discount_provider.dart';
import 'application/app_state.dart';
import 'application/errorStrings.dart';
import 'application/signUpBusinissLogic.dart';
import 'infratstrucutre/services/authServices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getPermission() async {
    var status = await Permission.storage.status;
    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    print(statuses[
        Permission.storage]); // it should print PermissionStatus.granted
  }

  @override
  void initState() {
    getPermission();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => ErrorString()),
        ChangeNotifierProvider(create: (_) => AddItemProvider()),
        ChangeNotifierProvider(create: (_) => AddDiscountProvider()),
        ChangeNotifierProvider(create: (_) => AddTaxProvider()),
        ChangeNotifierProvider(create: (_) => AddClientProvider()),
        ChangeNotifierProvider(create: (_) => AddPaymentProvider()),
        ChangeNotifierProvider(create: (_) => TotalCostProvider()),
        ChangeNotifierProvider(create: (_) => AppState()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(
          create: (_) => AuthServices.instance(),
        ),
        ChangeNotifierProvider(create: (_) => SignUpBusinessLogic()),
        ChangeNotifierProvider(create: (_) => ErrorString()),
        StreamProvider(
          create: (context) => context.read<AuthServices>().authState,
          initialData: AuthServices.instance().authState,
        )
      ],
      child: GetMaterialApp(
        title: "Invoice App",
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}
