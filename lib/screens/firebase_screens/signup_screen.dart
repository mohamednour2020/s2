import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:s2/services/cubits/auth_cubit.dart';


class SignInPage extends StatefulWidget {
  final String? errorMessage;
  const SignInPage({super.key, this.errorMessage});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _isRegister = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    final email = _emailCtrl.text.trim();
    final pass = _passCtrl.text.trim();

    if (email.isEmpty || pass.isEmpty) {
      _toast('Please fill email and password');
      return;
    }
    // قواعد بسيطة لكلمة السر (اختياري)
    if (_isRegister && pass.length < 6) {
      _toast('Password must be at least 6 characters');
      return;
    }

    final cubit = context.read<AuthCubit>();
    if (_isRegister) {
      cubit.registerEmail(email, pass);
    } else {
      cubit.signInEmail(email, pass);
    }
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    final errorText = widget.errorMessage;

    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 8),
              Text(
                _isRegister ? 'Create an account' : 'Welcome back',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),

              if (errorText != null) ...[
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.shade200),
                  ),
                  child: Text(errorText, style: const TextStyle(color: Colors.red)),
                ),
              ],

              TextField(
                controller: _emailCtrl,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passCtrl,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 16),

              FilledButton(
                onPressed: _submit,
                child: Text(_isRegister ? 'Register' : 'Sign In'),
              ),

              TextButton(
                onPressed: () => setState(() => _isRegister = !_isRegister),
                child: Text(_isRegister
                    ? 'Already have an account? Sign in'
                    : 'New here? Create an account'),
              ),

              const Divider(height: 32),

              Center(
                child: TextButton(
                  onPressed: () async {
                    final email = _emailCtrl.text.trim();
                    if (email.isEmpty) {
                      _toast('Enter your email first');
                    } else {
                      await context.read<AuthCubit>().resetPassword(email);
                    }
                  },
                  child: const Text('Forgot password?'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
