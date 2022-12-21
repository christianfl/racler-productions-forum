import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'pages/home_page.dart';
import 'providers/forum_post/forum_post_provider.dart';
import 'providers/username_provider/username_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsernameProvider()),
        ChangeNotifierProvider(create: (context) => ForumPostProvider()),
      ],
      child: MaterialApp(
        title: 'Forum',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(),
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: const Color.fromARGB(255, 9, 55, 56),
        ),
        home: const HomePage(),
      ),
    );
  }
}
