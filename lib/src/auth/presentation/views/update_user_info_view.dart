import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UpdateUserInfoView extends StatefulWidget {
  const UpdateUserInfoView({super.key});

  static const path = '/update-user';

  @override
  State<UpdateUserInfoView> createState() => _UpdateUserInfoViewState();
}

class _UpdateUserInfoViewState extends State<UpdateUserInfoView> {
  late final TextEditingController name;
  late final TextEditingController email;
  late final TextEditingController birthdate;
  late int currentGender;
  late String sqlFormattedDate;
  int workSpaceId = 0;
  late final _formKey;

  @override
  void initState() {
    // TODO: implement initState
    name = TextEditingController();
    email = TextEditingController();
    currentGender = 1; //made 1 for backend 1=male 2 female
    sqlFormattedDate = "";
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    email.dispose();
    birthdate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),

        ),
      ),
    );
  }
}
