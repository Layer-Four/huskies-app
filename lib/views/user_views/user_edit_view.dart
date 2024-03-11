import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/helpers.dart';
import 'package:huskies_app/models/user_vm/user_model.dart';
import 'package:huskies_app/provider/user_provider/user_provider.dart';
import 'package:huskies_app/views/view_widgets/accept_return.widget.dart';
import 'package:huskies_app/views/view_widgets/symetric_button_widget.dart';
import 'package:huskies_app/views/view_widgets/user_view_widgets/delete_user_widget.dart';

class UpdateUserView extends ConsumerStatefulWidget {
  const UpdateUserView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateUserState();
}

class _UpdateUserState extends ConsumerState<UpdateUserView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserModel? currentUser = ref.watch(userProvider);
    if (mounted && currentUser != null) {
      if (currentUser.displayedName != null) {
        firstNameController.text = currentUser.displayedName!.split(',').first;
        lastNameController.text = currentUser.displayedName!.split(',').last;
      }
      emailController.text = currentUser.email ?? '';
      phoneController.text = currentUser.phoneNumber?.toString() ?? '';
    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: AppTheme.mainAlignBetween,
          children: [
            Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: AppTheme.mainAlignCenter,
                children: [
                  const Padding(padding: AppTheme.padding0_30),
                  Row(
                    mainAxisAlignment: AppTheme.mainAlignEvenly,
                    children: [
                      Container(
                        margin: AppTheme.padding12_8,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: currentUser?.userImageUrl != null
                            ? Image.network(currentUser!.userImageUrl!, height: 90, width: 90)
                            : Image.asset('assets/images/user.png', width: 90),
                      ),
                      SymmetricButton(
                          color: AppTheme.blueGrey,
                          text: 'Profilbild ändern',
                          onPressed: () async {
                            await Helpers.asktForImage(context, ref);
                          }),
                    ],
                  ),
                  const Padding(
                    padding: AppTheme.paddingS,
                    child: Text('Vorname', style: TextStyle(fontSize: 13)),
                  ),
                  Padding(
                    padding: AppTheme.padding40_6,
                    child: TextFormField(
                      initialValue: firstNameController.text,
                      controller: firstNameController,
                      decoration: AppTheme.textInputDecoration,
                      keyboardType: TextInputType.name,
                      textAlign: AppTheme.textCenter,
                    ),
                  ),
                  const Padding(padding: AppTheme.paddingS, child: Text('Nachname')),
                  Padding(
                    padding: AppTheme.padding40_6,
                    child: TextFormField(
                      initialValue: lastNameController.text,
                      controller: lastNameController,
                      decoration: AppTheme.textInputDecoration,
                      keyboardType: TextInputType.name,
                      textAlign: AppTheme.textCenter,
                    ),
                  ),
                  const Padding(padding: AppTheme.paddingS, child: Text('Emailadresse')),
                  Padding(
                    padding: AppTheme.padding40_6,
                    child: TextFormField(
                      initialValue: emailController.text,
                      controller: emailController,
                      decoration: AppTheme.textInputDecoration,
                      keyboardType: TextInputType.emailAddress,
                      textAlign: AppTheme.textCenter,
                    ),
                  ),
                  const Padding(padding: AppTheme.paddingS, child: Text('phone number')),
                  Padding(
                    padding: AppTheme.padding40_6,
                    child: TextFormField(
                      initialValue: phoneController.text,
                      controller: phoneController,
                      decoration: AppTheme.textInputDecoration,
                      keyboardType: TextInputType.phone,
                      textAlign: AppTheme.textCenter,
                    ),
                  ),
                  AcceptOrReturnWidget(
                    onPressed: () {
                      if (firstNameController.text.isEmpty &&
                          lastNameController.text.isEmpty &&
                          emailController.text.isEmpty &&
                          phoneController.text.isEmpty) {
                        Helpers.showSnackbar(context, 'keine änderungen übernommen');
                        Navigator.of(context).pop();
                        return;
                      }
                      String displayName = '${firstNameController.text},${lastNameController.text}';

                      ref.read(userProvider.notifier).updateUserProfile(
                            displayName:
                                displayName.length > 1 ? displayName : currentUser!.displayedName,
                            newEmail: emailController.text.isNotEmpty
                                ? emailController.text
                                : currentUser!.email,
                            newPhoneNumber: phoneController.text.isNotEmpty
                                ? int.parse(phoneController.text)
                                : currentUser!.phoneNumber,
                          );
                      Navigator.of(context).pop();
                    },
                  ),
                ]),
            const DeleteUserCard(),
          ],
        ),
      ),
    );
  }
}
