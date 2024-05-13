import 'package:flutter/material.dart';
import 'package:jakone_pay_case_study/common/common.dart';
import 'package:jakone_pay_case_study/common/fonts.dart';
import 'package:jakone_pay_case_study/widgets/custom_painter_appbar_home.dart';

class AccountAndBalance extends SliverPersistentHeaderDelegate {
  final double height;

  const AccountAndBalance({required this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        color: Colors.transparent,
        child: Stack(fit: StackFit.loose, children: <Widget>[
          Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: height,
              child: CustomPaint(
                painter: RPSCustomPainter(),
              )),
          Align(
              alignment: const Alignment(0, 2.5),
              child: Container(
                  height: MediaQuery.of(context).size.height / 8,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20.0,
                            spreadRadius: .5,
                            offset: Offset(
                              0.0,
                              5.0,
                            ),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: double.infinity,
                            width: 10,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xffFE5F5F), Color(0xffFFF84B)],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .userBalance,
                                        style: AppFonts.descriptionSmall,
                                      ),
                                      Text(
                                        "Rp 500.000.000",
                                        style: AppFonts.descriptionSmall
                                            .copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                      ),
                                      Text(
                                        "-",
                                        style: AppFonts.descriptionSmall
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: const BorderSide(
                                            color: Colors.yellow, width: 1),
                                      ),
                                    ),
                                    child: Ink(
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            kGradientColor1,
                                            kGradientColor2
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Container(
                                        constraints: const BoxConstraints(
                                            maxWidth: 75.0, maxHeight: 45.0),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Top Up',
                                          style: AppFonts.descriptionSmall
                                              .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )))),
          Align(
              alignment: const Alignment(-0.9, -0.8),
              child: SizedBox(
                height: 55,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 100,
                      child: Icon(
                        Icons.person_pin,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppLocalizations.of(context)!.greetUserHome,
                            style: AppFonts.descriptionSmall.copyWith(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        Text("Guest",
                            style: AppFonts.descriptionSmall.copyWith(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ],
                    )
                  ],
                ),
              )),
        ]));
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
