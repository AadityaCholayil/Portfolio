import 'package:my_portfolio/shared/my_widgets/my_inkwell.dart';
import 'package:my_portfolio/shared/web_wrapper/web_wrapper.dart';
import 'package:my_portfolio/themes/theme.dart';
import 'package:flutter/material.dart';

class MyFooter extends StatelessWidget {
  final LayoutType layout;
  final double padding;

  const MyFooter({
    super.key,
    required this.layout,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    double w1 = 0;
    double w2 = 0;
    double h1 = 0;
    double h2 = 0;
    if (layout == LayoutType.x5) {
      w1 = 295;
      w2 = 196;
    } else if (layout == LayoutType.x4) {
      w1 = 242;
      w2 = 158;
    } else if (layout == LayoutType.x3) {
      w1 = 360;
      w2 = 360;
    } else {
      w1 = MediaQuery.of(context).size.width;
      w2 = MediaQuery.of(context).size.width;
    }
    return Container(
      color: CustomTheme.footerBg,
      // height: 260,
      constraints: const BoxConstraints(minHeight: 260),
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.fromLTRB(padding - 12, 50, padding - 12, 10),
        child: Wrap(
          // crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Container(
              width: w1,
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 46,
                    child: Image.asset('assets/images/footer-logo.png'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing.',
                    style: CustomTheme.footerLinks(false),
                  ),
                ],
              ),
            ),
            Container(
              width: w2,
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Quick Links',
                      style: CustomTheme.h4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Text(
                        'Doctor',
                        style: CustomTheme.footerLinks(hover),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Text(
                        'Diagnostics',
                        style: CustomTheme.footerLinks(hover),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Text(
                        'Medicines',
                        style: CustomTheme.footerLinks(hover),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Container(
              width: w2,
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'FAQs',
                      style: CustomTheme.h4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Text(
                        'Labs',
                        style: CustomTheme.footerLinks(hover),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Text(
                        'Test Results',
                        style: CustomTheme.footerLinks(hover),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Text(
                        'All Patient',
                        style: CustomTheme.footerLinks(hover),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Text(
                        'All Provider',
                        style: CustomTheme.footerLinks(hover),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Container(
              width: w2,
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Useful Links',
                      style: CustomTheme.h4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Text(
                        'Privacy Statement',
                        style: CustomTheme.footerLinks(hover),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Text(
                        'Terms of use',
                        style: CustomTheme.footerLinks(hover),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Text(
                        'Contact',
                        style: CustomTheme.footerLinks(hover),
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Text(
                        'Refund',
                        style: CustomTheme.footerLinks(hover),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Container(
              width: w1,
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Contacts',
                      style: CustomTheme.h4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Icon(
                              Icons.phone,
                              color: CustomTheme.t3,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '+234 905 1125',
                            style: CustomTheme.footerLinks(hover),
                          ),
                        ],
                      );
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: MyInkWell(onTap: () {
                      // TODO: Navigate
                    }, builder: (hover) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Icon(
                              Icons.email,
                              color: CustomTheme.t3,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'info@360carefirst.com',
                            style: CustomTheme.footerLinks(hover),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
