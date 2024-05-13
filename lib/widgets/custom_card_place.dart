import 'package:flutter/material.dart';
import 'package:jakone_pay_case_study/common/common.dart';
import 'package:jakone_pay_case_study/common/fonts.dart';

class HomePlaceCard extends StatelessWidget {
  const HomePlaceCard({
    super.key,
    required this.image,
    required this.title,
    required this.press,
  });

  final String image, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
        child: SizedBox(
          height: 200,
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                  ),
                  height: 130,
                  width: 130,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 5, bottom: 10),
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.descriptionSmall
                      .copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    height: 20,
                    width: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: const BorderSide(
                              color: Colors.yellow, width: 0.5),
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
                          AppLocalizations.of(context)!.detailButton,
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
      ),
    );
  }
}
