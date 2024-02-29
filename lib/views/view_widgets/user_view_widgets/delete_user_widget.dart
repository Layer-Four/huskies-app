import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/view_widgets/symetric_button_widget.dart';

class DeleteUserCard extends ConsumerWidget {
  const DeleteUserCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding:
          EdgeInsets.only(left: MediaQuery.of(context).size.width / 1.4, right: 12, bottom: 12),
      child: SymmetricButton(
        color: AppTheme.red,
        text: 'Nutzer Löschen',
        onPressed: () {
          final passwordController = TextEditingController();
          showDialog(
              context: context,
              builder: (context) => Card(
                    color: const Color.fromARGB(255, 213, 211, 211),
                    margin: AppTheme.regtangelCard,
                    child: Column(
                      mainAxisAlignment: AppTheme.mainAlignCenter,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: AppTheme.paddingM,
                          child: Text(
                            'Bitte bestätige mit deinem\nPasswort:',
                            textAlign: AppTheme.textCenter,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: AppTheme.textInputDecoration,
                            keyboardType: TextInputType.visiblePassword,
                            textAlign: AppTheme.textCenter,
                          ),
                        ),
                        SymmetricButton(
                            color: AppTheme.red,
                            text: 'Konto löschen?',
                            onPressed: () {
                              ref
                                  .read(statusProvider.notifier)
                                  .deleteUser(passwordController.text.trim());
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  ));
        },
      ),
    );
  }
}
