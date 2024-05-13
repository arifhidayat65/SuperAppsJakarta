import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:jakone_pay_case_study/common/common.dart';
import 'package:jakone_pay_case_study/common/fonts.dart';
import 'package:jakone_pay_case_study/model/common_data.dart';
import 'package:jakone_pay_case_study/screen/home_screen/account_and_balance_bar.dart';
import 'package:jakone_pay_case_study/widgets/custom_card_place.dart';
import 'package:jakone_pay_case_study/widgets/custom_event_card.dart';
import 'package:jakone_pay_case_study/widgets/custom_fab.dart';
import 'package:jakone_pay_case_study/widgets/sub_header_with_title.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _sliverAppbar(),
          SliverPersistentHeader(
            delegate: AccountAndBalance(
                height: MediaQuery.of(context).size.height * 0.2),
            pinned: false,
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 70,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              delegate: SliverChildListDelegate(
                [
                  _buildMenuItem("Explore Jakarta", "assets/menu/locate.png"),
                  _buildMenuItem("Top Up JakCard", "assets/menu/wallet.png"),
                  _buildMenuItem("JakCard Balance", "assets/menu/jakcard.png"),
                  _buildMenuItem("Event", "assets/menu/event.png"),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
            sliver: _buildSwiperPromo(imageUrls),
          ),
          SliverToBoxAdapter(
            child: SubHeaderWithTitle(
              title: AppLocalizations.of(context)!.placesTabTitle,
              press: () {},
              buttonText: AppLocalizations.of(context)!.viewAllText,
              icon: Icons.location_city_rounded,
              subtitle: AppLocalizations.of(context)!.placesTabDesc,
            ),
          ),
          _buildPlaceItems(),
          SliverToBoxAdapter(
            child: SubHeaderWithTitle(
              title: AppLocalizations.of(context)!.eventsTabTitle,
              press: () {},
              buttonText: AppLocalizations.of(context)!.viewAllText,
              icon: Icons.event_available,
              subtitle: AppLocalizations.of(context)!.eventsTabDesc,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: SizedBox(height: 210, child: _buildSwiperEvent()),
            ),
          ),
        ],
      ),
      floatingActionButton: CustomFAB(onTap: () {}),
    );
  }

  Widget _buildPlaceItems() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: places.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  width: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/menu/first_item.png'),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                );
              } else {
                final place = places[index - 1];
                return HomePlaceCard(
                  image: place['image'],
                  title: place['title'],
                  press: () {
                    if (kDebugMode) {
                      print('Tapped on ${place['title']}');
                    }
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSwiperEvent() {
    return VxSwiper.builder(
      enableInfiniteScroll: true,
      reverse: false,
      height: 300,
      viewportFraction: 0.8,
      initialPage: 0,
      autoPlay: false,
      autoPlayCurve: Curves.easeIn,
      enlargeCenterPage: true,
      onPageChanged: (value) {},
      scrollDirection: Axis.horizontal,
      itemCount: events.length,
      itemBuilder: (context, index) {
        var event = events[index];
        return HomeEventCard(image: event['image']);
      },
    );
  }

  Widget _buildSwiperPromo(List<String> imageUrls) {
    return SliverToBoxAdapter(
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        height: 90,
        child: Swiper(
          itemCount: imageUrls.length,
          autoplay: true,
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              imageUrls[index],
              fit: BoxFit.cover,
            );
          },
          curve: Curves.easeIn,
          pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  color: Colors.white70,
                  activeColor: kPrimaryColor,
                  size: 10.0,
                  activeSize: 10.0)),
        ),
      ),
    );
  }

  Widget _buildMenuItem(String label, String image) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xffFFE3CA), Colors.white],
                ),
                border: const GradientBoxBorder(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.yellow, kGradientColor1]),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(image),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: AppFonts.descriptionSmall.copyWith(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _sliverAppbar() {
    return SliverAppBar(
      pinned: true,
      actions: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [kGradientColor1, kGradientColor2],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 5.0,
                  spreadRadius: .1,
                  offset: Offset(
                    0.0,
                    5.0,
                  ),
                )
              ],
            ),
            child: const Icon(
              Icons.blinds_closed_sharp,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [kGradientColor1, kGradientColor2],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 5.0,
                  spreadRadius: .1,
                  offset: Offset(
                    0.0,
                    5.0,
                  ),
                )
              ],
            ),
            child: const Icon(
              Icons.notifications_sharp,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
      backgroundColor: kPrimaryColor,
      title: Image.asset(
        'assets/images/jakone_pay_logo.png',
        height: 45,
      ),
    );
  }
}
