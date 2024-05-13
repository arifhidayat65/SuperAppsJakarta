import 'package:flutter/material.dart';
import 'package:jakone_pay_case_study/common/common.dart';
import 'package:jakone_pay_case_study/common/fonts.dart';
import 'package:jakone_pay_case_study/controller/localizations_provider.dart';
import 'package:jakone_pay_case_study/model/destination_model.dart';
import 'package:jakone_pay_case_study/screen/home_screen/navbar_menu.dart';
import 'package:jakone_pay_case_study/widgets/custom_fab.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late PageController _pageController;
  bool isLastPage = false;
  bool _isLoading = false;

  void _login() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavbar(),
        ),
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<DestinationModel> destinationData = [
      DestinationModel(
        image: 'assets/images/monas.jpg',
        title: AppLocalizations.of(context)!.monasTitle,
        description: AppLocalizations.of(context)!.monasDesc,
      ),
      DestinationModel(
        image: 'assets/images/dufan.jpg',
        title: AppLocalizations.of(context)!.ancolTitle,
        description: AppLocalizations.of(context)!.ancolDesc,
      ),
      DestinationModel(
        image: 'assets/images/ragunan.jpg',
        title: AppLocalizations.of(context)!.ragunanTitle,
        description: AppLocalizations.of(context)!.ragunanDesc,
      ),
    ];
    return Scaffold(
        appBar: _customAppBar(),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.49,
                      width: MediaQuery.of(context).size.width,
                      child: _buildPageView(destinationData)),
                ),
              ),
              SizedBox(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: destinationData.length,
                  effect: const WormEffect(
                    dotColor: kGradientColor2,
                    activeDotColor: kGradientColor1,
                    dotHeight: 8,
                    dotWidth: 8,
                    type: WormType.thinUnderground,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 30.0),
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: const BorderSide(color: Colors.yellow, width: 2),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: gradient1,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Container(
                      constraints:
                          const BoxConstraints(minWidth: 88.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: _isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              AppLocalizations.of(context)!.loginButton,
                              style: AppFonts.descriptionSmall.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: CustomFAB(onTap: () {}));
  }

  Widget _buildPageView(List<dynamic> destinationData) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return PageView.builder(
        onPageChanged: (index) {
          setState(() {
            isLastPage = index == destinationData.length - 1;
          });
        },
        itemCount: destinationData.length,
        controller: _pageController,
        itemBuilder: (context, index) {
          final DestinationModel onBoardList = destinationData[index];
          return OnBoardingWidget(
            image: onBoardList.image,
            title: onBoardList.title,
            description: onBoardList.description,
          );
        },
      );
    });
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      title: Stack(
        children: [
          Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.grey.shade200,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: InkWell(
              onTap: () {
                Provider.of<LocalizationProvider>(context, listen: false)
                    .toggleLocale();
              },
              child: SizedBox(
                width: 70,
                height: 30,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Consumer<LocalizationProvider>(
                        builder: (context, provider, child) =>
                            provider.locale.languageCode == 'id'
                                ? Image.asset(
                                    'assets/images/id_flag.png',
                                    fit: BoxFit.fill,
                                  )
                                : ColorFiltered(
                                    colorFilter: const ColorFilter.mode(
                                      Colors.grey,
                                      BlendMode.saturation,
                                    ),
                                    child: Image.asset(
                                      'assets/images/id_flag.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Consumer<LocalizationProvider>(
                        builder: (context, provider, child) =>
                            provider.locale.languageCode == 'en'
                                ? Image.asset(
                                    'assets/images/uk_flag.png',
                                    fit: BoxFit.fill,
                                  )
                                : ColorFiltered(
                                    colorFilter: const ColorFilter.mode(
                                      Colors.grey,
                                      BlendMode.saturation,
                                    ),
                                    child: Image.asset(
                                      'assets/images/uk_flag.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          padding: const EdgeInsets.all(8),
          child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  overlayColor:
                      MaterialStateProperty.resolveWith<Color?>((states) {
                    if (states.contains(MaterialState.pressed)) {
                      return kPrimaryColor;
                    }
                    return null;
                  })),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.credit_card_outlined,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/images/jakcard_logo.png',
                    height: 20,
                  )
                ],
              )),
        )
      ],
    );
  }
}

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  image,
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 25,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: const Color(0xffFC9842),
                ),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppFonts.descriptionSmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: AppFonts.descriptionSmall.copyWith(
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
