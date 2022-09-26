import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'providers/Auth/auth_service.dart';
import 'screens/Auth/login_screen.dart';
import 'screens/Auth/recover_screen.dart';
import 'screens/Dashboard/dashboard.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // for plugins that need to use platform channels to call the native code
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFF021660),
  ));

  await dotenv.load(fileName: '.env'); //environment variables

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => AuthStateProvider()),
  ], child: TusrmisStudentApp()));
}

class TusrmisStudentApp extends StatelessWidget {
  const TusrmisStudentApp({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TUSRMIS',
      theme: ThemeData(
          primaryColor: Color.fromARGB(255, 18, 94, 144),
          secondaryHeaderColor: Color.fromARGB(255, 8, 125, 109)),
      home: StreamBuilder<User?>(
        stream: context.read<AuthStateProvider>().onAuthStateChanged,
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              Fluttertoast.showToast(
                  timeInSecForIosWeb: 2,
                  webBgColor: "linear-gradient(to right, #021660, #021660)",
                  toastLength: Toast.LENGTH_LONG,
                  textColor: const Color(0xFFF03800),
                  backgroundColor: const Color(0xFF000000),
                  gravity: ToastGravity.CENTER,
                  msg: "Login Success");
              return Dashboard();
            } else {
              Fluttertoast.showToast(
                  timeInSecForIosWeb: 2,
                  webBgColor: "linear-gradient(to right, #021660, #021660)",
                  toastLength: Toast.LENGTH_LONG,
                  textColor: const Color(0xFFF03800),
                  backgroundColor: const Color(0xFF000000),
                  gravity: ToastGravity.CENTER,
                  msg: "Login Failed: Wrong Password/Email/Session");
              return const LoginPage(title: 'TUSRMIS');
            }
          } else {
            return const LoginPage(title: 'TUSRMIS');
            ;
          }
        },
      ),
      onGenerateRoute: (settings) {
        //route chosen depends on settings
        if (settings.name == LoginPage.routeName) {
          return MaterialPageRoute(builder: (_) {
            return const LoginPage(title: 'TUSRMIS');
          });
        }
        if (settings.name == RecoverPasswordPage.routeName) {
          return MaterialPageRoute(builder: (_) {
            return const RecoverPasswordPage(title: 'TUSRMIS');
          });
        }
        if (settings.name == Dashboard.routeName) {
          return MaterialPageRoute(builder: (_) {
            return Dashboard();
          });
        }
        // incase non of the routes match
        return MaterialPageRoute(builder: (context) {
          return const LoginPage(title: 'TUSRMIS');
        });
      },
    );
  }
}
