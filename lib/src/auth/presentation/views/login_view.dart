import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const path = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _controller;
  late final _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            height: 85.h,
            width: double.infinity,
            padding: EdgeInsets.all(5.w),

          ),
        ),
      ),
    );
  }
}
