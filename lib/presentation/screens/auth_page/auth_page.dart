import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iamc_flutter/bloc/authBloc/auth_bloc.dart';
import 'package:iamc_flutter/core/config/routes/app_router.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AUTH PAGE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              maxLength: 12,
              decoration: const InputDecoration(
                hintText: 'Enter a 12-digit number',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                BlocProvider.of<AuthBloc>(context)
                    .add(AuthToken(number: controller.text));
                final authBloc = BlocProvider.of<AuthBloc>(context);
                authBloc.stream.listen((state) {
                  if (state is AuthSuccess) {
                    context.router.push(const HomeRoute());
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              'Authentication failed: ${state.errorText}')),
                    );
                  }
                });
                // context.router.push(const ProfileRoute());
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
