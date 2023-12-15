import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'outdoor_page.dart';
import 'http_get.dart';


class Connect2DronePage extends StatelessWidget {
  TextEditingController ipAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('连接到巡逻无人机'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/drone_sticker.png', // Replace with the actual path to your drone sticker
              width: 250, // Adjust the width as needed
              height: 250, // Adjust the height as needed
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              child: TextFormField(
                controller: ipAddressController,
                inputFormatters: [IpInputFormatter()],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  labelText: '输入无人机的IP地址',
                  hintText: 'e.g., 192.168.0.1',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.lightBlue, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 20),
        child: FloatingActionButton(
          onPressed: () async {
            // Get the entered IP address
            String ipAddress = ipAddressController.text;

            // Validate the IP address
            if (await isValidIpAddress(ipAddress)) {
              // Navigate to OutdoorPage and pass the IP address as a parameter
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => OutdoorPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = 0.0;
                    const end = 1.0;
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var opacityAnimation = animation.drive(tween);

                    return FadeTransition(
                      opacity: opacityAnimation,
                      child: child,
                    );
                  },
                ),
              );

            } else {
              // Show an error message or handle invalid IP address
              print('Invalid IP Address');

              // Show a snackbar
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('IP地址无效，请检查无人机是否已连接到网络'),
                  duration: const Duration(seconds: 3),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  elevation: 5,
                  backgroundColor: Colors.blueGrey,
                ),
              );
            }
          }, // Replace with your desired icon
          shape: const CircleBorder(),
          backgroundColor: Colors.lightBlue,
          child: const Icon(Icons.arrow_forward, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Future<bool> isValidIpAddress(String input) async {
    int result = await checkIP(input);
    return result == 1;
  }
}

class IpInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    // Use a regular expression to match an IP address
    RegExp regex = RegExp(
        r'^([0-9]{1,3}\.){0,3}[0-9]{0,3}$'); // This regex is a basic example, you may need to adjust it based on your specific requirements

    if (regex.hasMatch(newText)) {
      // If the new text matches the IP address format, allow the change
      return newValue;
    } else {
      // If the new text doesn't match, keep the old value
      return oldValue;
    }
  }
}