import 'package:flutter/material.dart';
import 'package:graduation/core/utils/assets.dart';
import 'package:graduation/core/utils/style.dart';

class SplachViewBody extends StatefulWidget {
  const SplachViewBody({super.key});

  @override
  State<SplachViewBody> createState() => _SplachViewBodyState();
}

class _SplachViewBodyState extends State<SplachViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * .4,
            child: Image.asset(
              AssetsData.logo,
            )),
        const SizedBox(
          height: 4,
        ),
        const Text(
          'welcome to egypt ...',
          textAlign: TextAlign.center,
          style: Textstyle.textStyle12,
        )
      ],
    ));
  }
}
// }
