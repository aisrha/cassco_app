import 'package:casscoapp/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppState with ChangeNotifier {
  List<String> _correctAnsList = [];
  List<String> _userAnswerList = [];
  int _score = 0;

  final PageController controller = PageController();

  get correctAnsList => _correctAnsList;
  get userAnswerList => _userAnswerList;
  get score => _score;

  void addScore(int score) {
    _score = _score + score;
  }

  void addCorrectAnsList(String correctAns) {
    _correctAnsList.add(correctAns);
  }

  void addUserAnsList(String userAns) {
    _userAnswerList.add(userAns);
  }

  void emptyArrayList() {
    _correctAnsList.clear();
    _userAnswerList.clear();
    _score = 0;
  }

  void nextPage() async {
    await controller.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(const MyApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppState(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CASSCO',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: LoginScreen());
  }
}
