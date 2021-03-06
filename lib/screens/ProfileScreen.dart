import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample/DataBase/firebase.dart';
import 'MainScreen.dart';
import 'loginscreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    selectdp();
    readDetails();
  }

  final name_controller = TextEditingController();
  final ph_no_controller = TextEditingController();
  final email_controller = TextEditingController();
  bool _is_dp_exist = false;
  bool _status = true;
  bool start = false;
  final FocusNode myFocusNode = FocusNode();
  XFile? img;
  late File choosen_img;
  UploadTask? uploadTask;
  late final url_of_dp;
  dynamic profile_pic;
  Future pickimage() async {
    try {
      img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) {
        return;
      }
      final imagetemp = File(img!.path);
      setState(() {
        choosen_img = imagetemp;
      });

      final path = 'Profile_pictures/${auth.currentUser!.uid}.jpg';
      final ref = FirebaseStorage.instance.ref().child(path);
      uploadTask = ref.putFile(imagetemp);
      final check = await uploadTask!.whenComplete(() {});
      url_of_dp = await check.ref.getDownloadURL();
      setState(() {});
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> selectdp() async {
    try {
      Future.delayed(const Duration(seconds: 2));
      final dp = FirebaseStorage.instance
          .ref('/Profile_pictures')
          .child('${auth.currentUser!.uid}.jpg');
      profile_pic = await dp.getDownloadURL();
      _is_dp_exist=true;
      setState(() {});
    } on Exception catch (e) {
      _is_dp_exist = false;
    }
  }

  Future<void> _pullRefresh() async {
    setState(() {
      readDetails();
      selectdp();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => {
                MainScreen.indexnotify.value = 0,
                FirebaseAuth.instance.signOut(),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                ),
              },
              icon: const Icon(Icons.logout_rounded),
              color: Colors.black,
            ),
          ],
          title: const Text('PROFILE',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'lato',
                  color: Colors.black)),
        ),
        body: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                height: 180.0,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Stack(fit: StackFit.loose, children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: _is_dp_exist
                                    ? Container(
                                        height: 140,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,

                                            image: DecorationImage(
                                                image:
                                                    NetworkImage(profile_pic))
                                        ),
                                      )
                                    : Container(
                                        height: 140,
                                        width: 140,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                              'lib/images/logo.png',
                                            ))),
                                      ),
                                width: 140.0,
                                height: 140.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                  // image: (DecorationImage(
                                  //     image: _is_profile?AssetImage(
                                  //         'lib/images/title.png'):FileImage(choosen_img)))
                                )),
                          ],
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.only(top: 90.0, right: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 25.0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        pickimage();
                                      });
                                    },
                                    icon: const Icon(Icons.camera_alt),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                color: const Color(0xffFFFFFF),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    'Personal Information',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _status ? _getEditIcon() : Container(),
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF4F4F4),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextField(
                                    controller: name_controller,
                                    onTap: () {
                                      name_controller.text = Username;
                                    },
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 5),
                                        hintText: Username,
                                        hintStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        border: InputBorder.none),
                                    enabled: !_status,
                                    autofocus: !_status,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    'Email ID',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF4F4F4),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    onTap: () {
                                      email_controller.text = Email_add;
                                    },
                                    controller: email_controller,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 5),
                                        hintText: auth.currentUser!.email,
                                        hintStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        border: InputBorder.none),
                                    enabled: !_status,
                                    autofocus: !_status,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Text(
                                    'Mobile',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF4F4F4),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextField(
                                    onTap: () {
                                      ph_no_controller.text = phone_num;
                                    },
                                    controller: ph_no_controller,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 5),
                                        hintText: phone_num,
                                        hintStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                        border: InputBorder.none),
                                    enabled: !_status,
                                    autofocus: !_status,
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  child: const Text(
                                    'Password',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                            ],
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color(0xffF4F4F4),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: TextFormField(
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                          contentPadding:
                                              EdgeInsets.only(left: 5),
                                          hintText: "Change password",
                                          border: InputBorder.none),
                                      enabled: !_status,
                                      autofocus: !_status,
                                    ),
                                  ),
                                ),
                                flex: 2,
                              ),
                            ],
                          )),
                      !_status ? _getActionButtons() : Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                  child: ElevatedButton(
                child: const Text("Save"),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(color: Colors.white))),
                onPressed: () {
                  Username = name_controller.text;
                  phone_num = ph_no_controller.text;
                  UpdateUser(
                      name_controller.text.isEmpty
                          ? Username
                          : name_controller.text,
                      ph_no_controller.text.isEmpty
                          ? phone_num
                          : ph_no_controller.text);
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                  child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    textStyle: MaterialStateProperty.all(
                        const TextStyle(color: Colors.white))),
                child: const Text("Cancel"),
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(FocusNode());
                  });
                },
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: const CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
