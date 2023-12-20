import 'package:flutter/material.dart';

class MyTextFieldWidget extends StatefulWidget {
   MyTextFieldWidget({Key? key, required this.nameController, required this.text1, required this.text2}) : super(key: key);

 final TextEditingController? nameController;

 String? text1;
 String? text2;

  FocusNode focusNode = FocusNode();

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.nameController,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "${widget.text1}",

        hintText: "${widget.text2}",

        // suffixIcon: IconButton(
        //   onPressed: (){
        //     widget.focusNode.unfocus();
        //     setState(() {
        //
        //     });
        //   },
        //   icon: Icon(Icons.close),
        // ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Color(0xff4AA4D6),
            width: 3,
          ),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Color(0xff4AA4D6),
            width: 3,
          ),
        ),


      ),
    );
  }
}
