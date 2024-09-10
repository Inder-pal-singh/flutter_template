import 'package:app_assets/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KBackButton extends StatefulWidget {
  final Function()? onTap;
  const KBackButton({super.key, this.onTap});

  @override
  State<KBackButton> createState() => _KBackButtonState();
}

class _KBackButtonState extends State<KBackButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
          return;
        }
        Navigator.of(context).pop();
        FocusScope.of(context).unfocus();
      },
      borderRadius: BorderRadius.circular(50),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Ink(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Center(
                child: SvgPicture.asset(
              AppAssets.backArrow2Icon,
              // size: 24,
              // weight: 0.4,
              // grade: 0.4,
            )),
          ),
        ),
      ),
    );
  }
}
