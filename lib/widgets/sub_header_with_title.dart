import 'package:flutter/material.dart';
import 'package:jakone_pay_case_study/common/common.dart';
import 'package:jakone_pay_case_study/common/fonts.dart';

class SubHeaderWithTitle extends StatelessWidget {
  const SubHeaderWithTitle({
    super.key,
    required this.title,
    required this.press,
    required this.buttonText,
    required this.icon,
    required this.subtitle,
  });

  final String title, subtitle, buttonText;
  final Function press;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 45,
          width: 40,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(right: 10),
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            gradient: gradient1,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(100),
              bottomRight: Radius.circular(100),
            ),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: AppFonts.headline2
                    .copyWith(fontWeight: FontWeight.w700, fontSize: 15)),
            Text(subtitle,
                style: AppFonts.headline2
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 12)),
            Container(
              height: 3,
              width: 50,
              margin: const EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                  gradient: gradient1, borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
        const Spacer(),
        TextButton(
          onPressed: press(),
          child: Text(
            buttonText,
            style: AppFonts.descriptionSmall.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}

class SubHeaderNoIcon extends StatelessWidget {
  const SubHeaderNoIcon({
    super.key,
    required this.title,
    required this.press,
    required this.buttonText,
  });

  final String title;
  final String buttonText;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
            style: AppFonts.headline2.copyWith(fontWeight: FontWeight.w600)),
        const Spacer(),
        TextButton(
          onPressed: () {
            press();
          },
          child: Text(
            buttonText,
            style: AppFonts.descriptionSmall.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
