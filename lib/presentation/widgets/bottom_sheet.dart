import 'package:flutter/material.dart';
import 'package:test_app/config/utils/app_styles.dart';
import 'package:test_app/presentation/widgets/primary_text_field.dart';

import '../../config/utils/validators.dart';

class CustomBottomSheet {
  static Future<void> get({
    required int idPost,
    required BuildContext context,
    required String title,
    required Function function,
    required state
  }) async {
    final _formKeyName = GlobalKey<FormState>();
    final _formKeyEmail = GlobalKey<FormState>();
    final _formKeyBody = GlobalKey<FormState>();
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerEmail = TextEditingController();
    final TextEditingController controllerBody = TextEditingController();
    showModalBottomSheet<void>(
      isScrollControlled: true,
      barrierColor: Color(0x801B1C29),
      backgroundColor: Color(0xff2E3046),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24)
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: 450.0 + MediaQuery.of(context).viewInsets.bottom,
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 24, right: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8,),
                Center(
                  child: Container(
                    height: 4,
                    width: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(24)
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: AppStyles.ordinary16w600.copyWith(color: Color(0xff8F92AC))
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 367,
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Name", style: AppStyles.ordinary16w600,),
                          const SizedBox(height: 4,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Form(
                              key: _formKeyName,
                              child: PrimaryTextField(
                                onChanged: (String s) {
                                  _formKeyName.currentState!.validate();
                                },
                                textInputType: TextInputType.name,
                                hintText: "Enter your name",
                                controller: controllerName,
                                validator: (value) {
                                  if (!Validators.isNameValid(value)) {
                                    return 'Invalid name format';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const Text("Email", style: AppStyles.ordinary16w600,),
                          const SizedBox(height: 4,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Form(
                              key: _formKeyEmail,
                              child: PrimaryTextField(
                                onChanged: (String s) {
                                  _formKeyEmail.currentState!.validate();
                                },
                                textInputType: TextInputType.name,
                                hintText: "Enter your email",
                                controller: controllerEmail,
                                validator: (value) {
                                  if (!Validators.isEmailValid(value)) {
                                    return 'Invalid email format';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          const Text("Text", style: AppStyles.ordinary16w600,),
                          const SizedBox(height: 4,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Form(
                              key: _formKeyBody,
                              child: PrimaryTextField(
                                onChanged: (String s) {
                                  _formKeyBody.currentState!.validate();
                                },
                                textInputType: TextInputType.name,
                                hintText: "Enter text",
                                controller: controllerBody,
                                validator: (value) {
                                  if (!Validators.isTextValid(value)) {
                                    return 'Invalid text format';
                                  }
                                  return null;
                                },
                                maxLine: 3,
                                maxLength: 250,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              child: const SizedBox(
                                  height: 52,
                                  width: 72,
                                  child: Center(child: Text(
                                    "Send",
                                    style: AppStyles.header18w700,
                                  )
                                  )
                              ),
                              onPressed: ()async{
                                if(
                                  _formKeyEmail.currentState!.validate()&&
                                    _formKeyName.currentState!.validate()&&
                                      _formKeyBody.currentState!.validate()
                                )function(
                                    idPost,
                                    controllerEmail.text,
                                    controllerName.text,
                                    controllerBody.text,
                                    state
                                );
                                Navigator.pop(context);
                              },
                            )
                          )
                        ],
                    )],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
