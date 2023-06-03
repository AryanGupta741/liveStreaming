import 'package:flutter/material.dart';
import 'package:tood/MyWidget.dart';

class Livestream extends StatefulWidget {
  const Livestream({super.key});

  @override
  State<Livestream> createState() => _LivestreamState();
}

class _LivestreamState extends State<Livestream> {
  TextEditingController userNameControler = TextEditingController();
  TextEditingController userIdControler = TextEditingController();
  var host = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // this is used to an box or keyboard are opened than close any click of the screen
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          body: Center(
        child:
            //In Flutter, the SingleChildScrollView widget is a scrollable widget that allows its child widget to be scrolled vertically. It's often used when the content within a widget exceeds the available vertical space and needs to be scrolled to view the entire content.
            SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            child: Column(
              children: [
                textField(
                  controller: userNameControler,
                  text: 'username',
                  icon: Icons.person,
                
                ),
                const SizedBox(height: 25),
                textField(
                  controller: userIdControler,
                  text: 'user Id',
                  icon: Icons.pin,
                ),
                const SizedBox(
                  height: 25,
                ),
                hostCheck(),
                const SizedBox(
                  height: 10,
                ),
                submitButton(context),
              ],
            ),
          ),
        ),
      )),
    );
  }

  TextFormField textField({
    required TextEditingController controller,
    required String text,
    required IconData icon,
  }) {
    return TextFormField(
      controller: controller,
      onSaved: (value) {
        controller.text = value!;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.brown, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
        prefixIcon: Icon(icon, color: Colors.brown),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: text,
        hintStyle: const TextStyle(
          color: Colors.red
        ),
      ),
    );
  }

// it is created the hostchecked function
  Row hostCheck() {
    return Row(
      children: [
        const Text('Host'),
        // host varible is defined in the top of the class and  value is store bool value
        Checkbox(
          value: host,
          onChanged: ((value) {
            setState(() {
              host = value!;
            });
          }),
        )
      ],
    );
  }

  Material submitButton(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(5),
      color: Colors.brown,
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 12),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) => MyWidget(
                    userID: userIdControler.text,
                    userName: userNameControler.text,
                    liveID: '1',
                    isHost: host,
                  )),
            ),
          ); 
        },
        child: const Text(
          'join',
       ),
      ),
    );
  }
}
