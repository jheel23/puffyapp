import 'package:flutter/material.dart';
import 'package:puffyapp/screens/auth_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const routeName = '/welcome-page';

  @override
  Widget build(BuildContext context) {
    // final deviceSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Welcome To,\n',
                            style: theme.textTheme.titleLarge),
                        TextSpan(
                          text: '     Puffy',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(color: Colors.amber, fontSize: 45),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text('Adopt, Care, Love',
                  style: theme.textTheme.bodyMedium!
                      .copyWith(color: Colors.grey, fontSize: 20)),
              Image.asset('assets/images/dog_hi.png'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Best place to adopt and take care\nof your life Buddy!',
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AuthScreen.routeName);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text('Get Started'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
