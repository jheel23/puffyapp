import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puffyapp/providers/adoption_dog_provider.dart';
import 'package:puffyapp/providers/auth/auth_provider.dart';
import 'package:puffyapp/screens/auth_screen.dart';
import 'package:puffyapp/screens/home_screen.dart';
import 'package:puffyapp/screens/pet_details_screen.dart';
import 'package:puffyapp/screens/welcome_screen.dart';
import 'package:puffyapp/theme/theme_constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

class WidgetBinder {}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authProvider);

    // final isAuth = ref.watch(authProvider.notifier).tryAutoLogin();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Puffy',
      theme: apptheme,
      initialRoute: WelcomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        PetDetailsScreen.routeName: (context) => const PetDetailsScreen(),
        WelcomeScreen.routeName: (context) => const WelcomeScreen(),
        AuthScreen.routeName: (context) => const AuthScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Puffy'),
      ),
    );
  }
}
