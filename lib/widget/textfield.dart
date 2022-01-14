import 'package:flutter/material.dart';

class SDTextFields extends StatelessWidget {
  final String? title;
  final String? hintText;
  final TextEditingController? controller;
  final bool? obsecureText;

  const SDTextFields(
      {Key? key,
      this.title,
      this.hintText,
      this.controller,
      this.obsecureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.lightBlueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16)),
            child: TextFormField(
              controller: controller,
              obscureText: obsecureText!,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  fillColor: Colors.blue,
                  hintText: hintText ?? 'Enter Your Name',
                  hintStyle: TextStyle(fontSize: 14),
                  border: InputBorder.none,
                  errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 5))),
            ),
          )
        ],
      ),
    );
  }
}
