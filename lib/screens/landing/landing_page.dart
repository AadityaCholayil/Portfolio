import 'package:flutter/material.dart';
import 'package:my_portfolio/data/landing_page_section_data.dart';
import 'package:my_portfolio/models/landing_page_section/landing_page_section.dart';
import 'package:my_portfolio/providers/animation_provider.dart';
import 'package:my_portfolio/screens/landing/sections/name_section.dart';
import 'package:my_portfolio/screens/landing/sections/project_section.dart';
import 'package:my_portfolio/shared/improved_scroll/improved_scrolling.dart';
import 'package:my_portfolio/shared/web_wrapper/header.dart';
import 'package:my_portfolio/shared/web_wrapper/web_wrapper.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late ScrollController controller;

  double padding = 20;
  LayoutType layout = LayoutType.x4;

  List<LandingPageSection> screenList = [];

  void setParameters(BuildContext context, BoxConstraints constraints) {
    double width = constraints.maxWidth;
    if (width > 1200) {
      padding = ((width - 1200) / 2) + 22;
      layout = LayoutType.x5;
    } else if (width > 992) {
      padding = ((width - 992) / 2) + 28;
      layout = LayoutType.x4;
    } else if (width > 768) {
      padding = ((width - 768) / 2) + 36;
      layout = LayoutType.x3;
    } else if (width > 576) {
      padding = ((width - 576) / 2) + 30;
      layout = LayoutType.x2;
    } else {
      padding = 20;
      layout = LayoutType.x1;
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<ConstraintsProvider>()
          .updatePadding(padding, constraints.maxHeight);
    });
  }

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    screenList = landingPageSectionData
        .map((e) => LandingPageSection.fromMap(e))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ConstraintsProvider>(
      create: (context) => ConstraintsProvider(
        controller: controller,
      ),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: MyFloatingActionButton(controller: controller),
          body: ImprovedScrolling(
            // scrollOffset: 100,
            // controller: _controller,
            // curve: Curves.linearToEaseOut,
            // animationDuration: 150,
            enableKeyboardScrolling: true,
            enableMMBScrolling: true,
            enableCustomMouseWheelScrolling: true,
            customMouseWheelScrollConfig: const CustomMouseWheelScrollConfig(
              // scrollDuration: Duration(milliseconds: 50),
              scrollAmountMultiplier: 2.5,
            ),
            scrollController: controller,
            child: LayoutBuilder(
              builder: (context, constraints) {
                setParameters(context, constraints);
                return Consumer<ConstraintsProvider>(
                  builder: (context, provider, child) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        ScrollConfiguration(
                          behavior: ScrollConfiguration.of(context)
                              .copyWith(scrollbars: false),
                          child: SingleChildScrollView(
                            physics: layout == LayoutType.x1
                                ? const ClampingScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                            controller: controller,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                NameSection(
                                  layout: layout,
                                  padding: padding,
                                  height: provider.height,
                                ),
                                Container(
                                  height: provider.dividerHeight,
                                  color: Colors.white,
                                  // child: const Center(child: Text('hi')),
                                ),
                                Container(
                                  height: provider.height +
                                      provider.dividerHeight * 2,
                                  color: Colors.grey[50],
                                  child: const Center(child: Text('hi')),
                                ),
                                for (int i = 2; i < screenList.length; i++)
                                  ProjectSection(
                                      layout: layout, section: screenList[i]),
                                Container(
                                  height: provider.dividerHeight,
                                  color: Colors.white,
                                  // child: const Center(child: Text('hi')),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          left: provider.phoneX,
                          duration: const Duration(milliseconds: 50),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              height: provider.phoneY,
                              width: (provider.phoneY) * (414 / 896),
                              // clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: PhoneView(
                                controller: controller,
                                height: provider.height,
                                phoneHeight: provider.phoneY,
                                dividerHeight: provider.dividerHeight,
                                projectOffset: provider.projectOffset,
                                screenList: screenList
                                    .map((e) => 'assets/${e.id}-1.png')
                                    .toList()
                                  ..add('assets/screen1-1.png'),
                              ),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          left: (MediaQuery.of(context).size.width -
                                  (provider.phoneX)) -
                              ((provider.phoneY) * (414 / 896)),
                          duration: const Duration(milliseconds: 50),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: SizedBox(
                              height: provider.phoneY,
                              width: (provider.phoneY) * (414 / 896),
                              // clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: PhoneView(
                                controller: controller,
                                height: provider.height,
                                phoneHeight: provider.phoneHeight,
                                dividerHeight: provider.dividerHeight,
                                projectOffset: provider.projectOffset,
                                screenList: screenList
                                    .map((e) => 'assets/${e.id}-2.png')
                                    .toList()
                                  ..add('assets/screen1-2.png'),
                              ),
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.topCenter,
                          child: MyHeader(),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // List<Widget> screenList = [
  //   Colors.grey[200],
  //   Colors.grey[400],
  //   Colors.pink[300],
  //   Colors.blue[300],
  //   Colors.amber[300],
  //   Colors.blue[300],
  //   Colors.amber[300],
  //   Colors.amber[300]
  // ]
  //     .map((e) => Container(
  //           color: e,
  //           // child: Center(child: Text('hi')),
  //         ))
  //     .toList();
}

class PhoneView extends StatefulWidget {
  const PhoneView({
    super.key,
    required this.controller,
    required this.height,
    required this.phoneHeight,
    required this.dividerHeight,
    required this.projectOffset,
    required this.screenList,
  });

  final ScrollController controller;
  final double height;
  final double phoneHeight;
  final double dividerHeight;
  final double projectOffset;
  final List<String> screenList;

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  double padding = 20;
  LayoutType layout = LayoutType.x4;

  late ScrollController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (sectionNo < 1) {
    //   return const SizedBox.shrink();
    // }
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        height: 896,
        width: 414,
        decoration: BoxDecoration(
          // border: Border.all(
          //     width: 3,
          //     strokeAlign: BorderSide.strokeAlignOutside),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 15,
              offset: const Offset(4, 4),
            )
          ],
          // color: Colors.grey,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        // color: Colors.pink[100],
        child: Consumer<ConstraintsProvider>(
          builder: (context, provider, child) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  height: 896,
                  width: 414,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        widget.screenList[provider.sectionNo + 1],
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(
                  height: 896,
                  width: 414,
                  child: ClipRect(
                    clipper: MyClip(1 - provider.revealPercentage),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      width: 414,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            widget.screenList[provider.sectionNo],
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class MyClip extends CustomClipper<Rect> {
  final double revealPercentage;

  MyClip(this.revealPercentage);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, size.width, size.height * revealPercentage);
  }

  @override
  bool shouldReclip(oldClipper) {
    return true;
  }
}
