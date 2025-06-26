import 'package:code_grapper/config/dimensions/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationCardWidget extends StatelessWidget {
  final Widget child;
  final String title;
  final double? maxWidth;

  const AuthenticationCardWidget(
      {super.key, required this.title, required this.child, this.maxWidth});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxWidth ??
              AppDimensions
                  .cardMaxWidth, // Set a maximum width for the container

          // Set a maximum width for the container
        ),
        child: Card(
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withAlpha(50),
                //     blurRadius: 10,
                //     offset: const Offset(0, 4), // changes position of shadow
                //   ),
                // ],
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.libreBaskerville().fontFamily),
                  ),
                  SizedBox(height: 20),
                  child,
                ],
              )),
        ),
      ),
    );
  }
}
