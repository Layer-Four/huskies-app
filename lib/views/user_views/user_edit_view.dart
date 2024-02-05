import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/models/user_vm/user_model.dart';
import 'package:huskies_app/provider/static_provider.dart';
import 'package:huskies_app/views/view_widgets/blue_button_widget.dart';
import 'package:image_picker/image_picker.dart';

class UpdateUserView extends ConsumerStatefulWidget {
  const UpdateUserView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateUserState();
}

class _UpdateUserState extends ConsumerState<UpdateUserView> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final ImagePicker imageFile = ImagePicker();

  @override
  Widget build(BuildContext context) {
    UserModel? currentUser = ref.watch(userProvider);
    //TODO: search for current user image, else set a default image.
    return SafeArea(
      child: Material(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: AppTheme.boxPadding,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: currentUser != null
                          ? Image.asset(
                              currentUser.userImage != null
                                  ? currentUser.userImage!
                                  : 'assets/user.png',
                              width: 90)
                          : const Icon(Icons.account_circle_rounded, size: 90),
                    ),
                    BlueButton(
                      color: Colors.blueGrey,
                      text: 'Profilbild ändern',
                      onPressed: () => asktForImage(context),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: AppTheme.paddingM,
                child: Text(
                  'Vorname',
                  style: TextStyle(fontSize: 13),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: TextFormField(
                    controller: firstNameController, decoration: AppTheme.textInputDecoration),
              ),
              const Padding(
                padding: AppTheme.paddingM,
                child: Text('Nachname'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: TextFormField(
                    controller: lastNameController, decoration: AppTheme.textInputDecoration),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                width: 100,
                child: BlueButton(
                  color: Colors.green,
                  text: 'Ändern',
                  onPressed: () => Navigator.of(context).pop(),
                ),
              )
            ]),
      ),
    );
  }

  Future<dynamic> asktForImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => Card(
              margin: AppTheme.regtangelCard,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlueButton(
                      color: Colors.green,
                      text: 'Wähle ein Bild aus \ndeiner Galerie',
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: BlueButton(
                      color: Colors.green,
                      text: 'Erstelle ein neues \nProfile von dir',
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                ],
              ),
            ));
  }
}
