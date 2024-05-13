import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:jakone_pay_case_study/common/common.dart';
import 'package:jakone_pay_case_study/controller/localizations_provider.dart';
import 'package:jakone_pay_case_study/widgets/sub_header_with_title.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _logout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final featuresList = [
      {
        'name': AppLocalizations.of(context)!.userBalance,
        'icon': Icons.money,
        'trailing': false
      },
      {
        'name': AppLocalizations.of(context)!.cards,
        'icon': Icons.credit_card,
        'trailing': false
      },
      {
        'name': AppLocalizations.of(context)!.helpCenter,
        'icon': Icons.help,
        'trailing': false
      },
      {'name': AppLocalizations.of(context)!.tNC, 'icon': Icons.description},
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: GFListTile(
                  avatar: GFAvatar(
                    child: Image.network('https://i.pravatar.cc/300'),
                  ),
                  titleText: 'User',
                  subTitleText: AppLocalizations.of(context)!.userAlert,
                  icon: const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.grey),
                  margin: const EdgeInsets.all(5.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.white,
                  onTap: () {},
                ),
              ),
              _buildSubHeader(context, "ID/US"),
              InkWell(
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
              const SizedBox(height: 10),
              _buildSubHeader(context, AppLocalizations.of(context)!.support),
              _buildFeaturesList(featuresList),
              _buildSubHeader(context, AppLocalizations.of(context)!.othersTxt),
              _buildLogoutTile(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SubHeaderNoIcon(title: title, press: () {}, buttonText: ""),
    );
  }

  Widget _buildFeaturesList(List<Map<String, dynamic>> featuresList) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(color: Colors.grey),
      itemCount: featuresList.length,
      itemBuilder: (context, index) {
        final feature = featuresList[index];
        return GFListTile(
          avatar: Icon(feature['icon'] as IconData),
          titleText: feature['name'].toString(),
          onTap: () {},
          icon: const Icon(Icons.arrow_forward_ios_outlined, size: 16),
        );
      },
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return GFListTile(
      avatar: const Icon(Icons.logout_outlined),
      titleText: 'Logout',
      icon: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white,
      onTap: () {
        _logout(context);
      },
    );
  }
}
