import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/const/firebase_consts.dart';
import 'package:emart_seller/views/auth_screen/login_screen.dart';
import 'package:emart_seller/views/home_screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    checkUser();
    super.initState();
  }

  var isLoggedIn = false;

  checkUser() {
    firebaseAuth.authStateChanges().listen((User? user) {
      if (user == null && mounted) {
        isLoggedIn = false;
      } else {
        isLoggedIn = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // // firebaseFirestore.collection('test').doc();
    // print(firebaseFirestore);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      )),
      home: isLoggedIn ? const Home() : const LoginScreen(),
    );
  }
}
