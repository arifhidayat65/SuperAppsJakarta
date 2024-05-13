import 'package:flutter/material.dart';
import 'package:jakone_pay_case_study/common/common.dart';
import 'package:jakone_pay_case_study/common/fonts.dart';

class HomeEventCard extends StatelessWidget {
  const HomeEventCard({super.key, required this.image});

  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.2, 1],
          colors: [Color(0xffFE5F5F), Color(0xffFC9842), Colors.white],
        ),
        // border: Border.all(color: Colors.grey.shade100, width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 190,
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(10)),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                  height: 20,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                        side:
                            const BorderSide(color: Colors.yellow, width: 0.5),
                      ),
                    ),
                    child: Ink(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: gradient1,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.moreInformation,
                        textAlign: TextAlign.center,
                        style: AppFonts.descriptionSmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
