import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PrimaryButton extends StatelessWidget {
  Function onPressed;
  String title;
  bool enabled;
  PrimaryButton({@required this.title,this.onPressed,this.enabled=true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: enabled?Color(0xff0681e1):Colors.black12,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Color(0x292a98d8),
              offset: Offset(0, 0),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Center(
          child: Text(
              title,
              style: GoogleFonts.nunitoSans(fontSize:16 ).copyWith(color: Colors.white,fontWeight: FontWeight.w400),
              textAlign: TextAlign.left
          ),
        ),
      ),
    );
  }
}




