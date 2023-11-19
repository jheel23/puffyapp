import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:puffyapp/providers/auth/auth_provider.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  static const routeName = '/auth-Screen';

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool _isLoading = false;
  @override
  void initState() {
    _emailcontroller.addListener(() {});
    _passwordcontroller.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      FocusScope.of(context).unfocus();
      _isLoading = true;
    });
    final email = _emailcontroller.text.trim();
    final password = _passwordcontroller.text.trim();
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    ref.watch(authProvider.notifier).signUp(email, password);
    ref.read(authProvider.notifier).setExpiryDate();
    Navigator.of(context).pushNamed('/');
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 251, 239, 202),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(
                    top: 30, left: 10, bottom: 5, right: 10),
                child: RichText(
                  text: TextSpan(
                      text: 'Sign In, \n',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: '      To Continue',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.amber),
                        )
                      ]),
                ),
              ),
              Lottie.asset('assets/animations/paws.json', height: 150),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none,
                      hintText: 'Email'),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: _passwordcontroller,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: InputBorder.none,
                      hintText: 'Password'),
                ),
              ),
              Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: const Text('Forgot Password?'))),
              ElevatedButton(
                onPressed: _submit,
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 50),
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: _isLoading
                    ? SizedBox(
                        height: 50,
                        width: 50,
                        child: CupertinoActivityIndicator(
                            animating: true,
                            color: Theme.of(context).colorScheme.primary),
                      )
                    : const Text(
                        'Sign In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Terms & Conditions, Privacy Policy.'),
                  TextButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Terms & Conditions'),
                                content: const Text(
                                    'This is a demo app, so no terms and conditions'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Ok'))
                                ],
                              );
                            });
                      },
                      child: const Text(
                        'here',
                        style: TextStyle(color: Colors.amber),
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
