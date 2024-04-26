import 'package:flutter/material.dart';

class InfoImg extends StatelessWidget {
  const InfoImg({
    super.key,
    required this.imagelink,
  });

  final String imagelink;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
          height: MediaQuery.of(context).size.height * .31,
          child: Image.asset(
            imagelink,
            fit: BoxFit.fill,
          )),
    );
  }
}
