import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:tasks_basic/checklist/view/checklist_view.dart';
import 'package:tasks_basic/counter/view/counter_view.dart';
import 'package:tasks_basic/login/view_model/login_store.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:tasks_basic/login/view/login_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        Provider<LoginStore>(
          create: (_) => LoginStore(),
          dispose: (_, loginStore) => loginStore.dispose(),
        ),
      ],
      child: const TaskBasic(),
    ),
  );
}

class LoginProvider with ChangeNotifier {
  LoginStore _loginStore = LoginStore();

  LoginStore get loginStore => _loginStore;

  set loginStore(LoginStore newLoginStore) {
    _loginStore = newLoginStore;
    notifyListeners();
  }
}

class TaskBasic extends StatelessWidget {
  const TaskBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Basics',
      theme: customTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginView(),
        '/checklist': (context) => ChecklistView(),
        '/counter': (context) => const CounterView(),
      },
    );
  }
}

ThemeData customTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
    brightness: Brightness.dark,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 48.0,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontSize: 36.0,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.bold,
    ),
  ),
);
