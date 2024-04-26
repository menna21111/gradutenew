import 'package:flutter/material.dart';
import 'package:graduation/features/splachview/preslayer/views/splach_view_body.dart';

bool show = true;

class SplashView extends StatelessWidget {
  static String id = 'splashviewbody';

  const SplashView({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplachViewBody());
  }
}
