import 'package:my_portfolio/themes/theme.dart';
import 'package:flutter/material.dart';

class MyHeader extends StatefulWidget {
  // final ScrollController controller;

  const MyHeader({
    super.key,
    // required this.controller,
  });

  @override
  State<MyHeader> createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  double padding = 20;

  void setParameters(double width) {
    if (width > 1200) {
      padding = ((width - 1200) / 2) + 24;
    } else if (width > 992) {
      padding = ((width - 992) / 2) + 28;
    } else if (width > 768) {
      padding = ((width - 768) / 2) + 36;
    } else if (width > 576) {
      padding = ((width - 576) / 2) + 30;
    } else {
      padding = 20;
    }
  }

  TextStyle selectedStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: CustomTheme.t1,
  );

  TextStyle normalStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: CustomTheme.t4,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        setParameters(constraints.maxWidth);
        return Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Row(
            children: [
              Text(
                'Home',
                style: selectedStyle,
              ),
              const SizedBox(width: 80),
              Text(
                'About',
                style: normalStyle,
              ),
              const SizedBox(width: 80),
              Text(
                'Work',
                style: normalStyle,
              ),
              const SizedBox(width: 80),
              Text(
                'Projects',
                style: normalStyle,
              ),
              const Spacer(),
              Text(
                'Contact me',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: CustomTheme.t1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget _buildTopBanner(BuildContext context) {
  //   double cyanWidth = 0;
  //   double newPadding = 0;
  //   if (layout == LayoutType.x1) {
  //     cyanWidth = MediaQuery.of(context).size.width * 0.65;
  //     newPadding = 20;
  //   } else if (layout == LayoutType.x2) {
  //     cyanWidth = MediaQuery.of(context).size.width * 0.52;
  //     newPadding = 30;
  //   } else if (layout == LayoutType.x3) {
  //     cyanWidth = MediaQuery.of(context).size.width * 0.4;
  //     newPadding = 36;
  //   } else {
  //     cyanWidth = MediaQuery.of(context).size.width * 0.5;
  //     newPadding = padding;
  //   }
  //   return SizedBox(
  //     height: 46,
  //     width: MediaQuery.of(context).size.width,
  //     child: Center(
  //       child: Stack(
  //         alignment: Alignment.center,
  //         children: [
  //           Container(
  //             color: const Color(0xFFf9f9f9),
  //             alignment: Alignment.centerLeft,
  //             child: Transform(
  //               transform: Matrix4.skewX(-0.5),
  //               child: Container(
  //                 color: CustomTheme.cyan,
  //                 width: cyanWidth,
  //               ),
  //             ),
  //           ),
  //           Padding(
  //             padding: EdgeInsets.symmetric(horizontal: newPadding),
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 SizedBox(
  //                   width: cyanWidth - newPadding - 10,
  //                   child: Text(
  //                     'Welcome To Our 360 Care First Center',
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                       color: CustomTheme.white,
  //                       fontWeight: FontWeight.w100,
  //                     ),
  //                   ),
  //                 ),
  //                 const Spacer(),
  //                 _buildProfileButton(),
  //                 SizedBox(
  //                     width: layout == LayoutType.x1
  //                         ? 0
  //                         : layout == LayoutType.x3 || layout == LayoutType.x2
  //                             ? 20
  //                             : 26),
  //                 layout == LayoutType.x1
  //                     ? const SizedBox.shrink()
  //                     : _buildCartButton(context),
  //                 SizedBox(
  //                     width: layout == LayoutType.x1 || layout == LayoutType.x2
  //                         ? 0
  //                         : layout == LayoutType.x3
  //                             ? 28
  //                             : 32),
  //                 layout == LayoutType.x1 || layout == LayoutType.x2
  //                     ? const SizedBox.shrink()
  //                     : Row(
  //                         children: [
  //                           _buildLanguageDropdown(layout),
  //                           const SizedBox(width: 5),
  //                           _buildLocationDropdown(layout),
  //                         ],
  //                       ),
  //                 // SizedBox(width: padding),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildProfileButton() {
  //   return BlocBuilder<AuthBloc, AuthState>(
  //     builder: (context, state) {
  //       if (state is Authenticated) {
  //         return DropdownButtonHideUnderline(
  //           child: DropdownButton2(
  //             isExpanded: true,
  //             hint: Row(
  //               children: [
  //                 SizedBox(
  //                   height: 34,
  //                   width: 34,
  //                   child: Image.asset('assets/images/user.png'),
  //                 ),
  //                 const SizedBox(width: 8),
  //                 SizedBox(
  //                   width: 59,
  //                   child: Text(
  //                     '${state.user.firstname} ${state.user.lastname}',
  //                     style: TextStyle(
  //                       fontSize: 14,
  //                       color: CustomTheme.t1,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //             items: _addDividersAfterItems(),
  //             customItemsHeights: _getCustomItemsHeights(),
  //             value: selectedValue,
  //             onChanged: (value) {
  //               if (value != null) {
  //                 if (value == 'Logout') {
  //                   context.read<AuthBloc>().add(const LogoutUser());
  //                 } else {
  //                   Navigator.pushNamed(context, value);
  //                 }
  //               }
  //             },
  //             buttonHeight: 40,
  //             dropdownMaxHeight: 300,
  //             buttonWidth: 125,
  //             dropdownWidth: 200,
  //             buttonPadding: EdgeInsets.zero,
  //             itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
  //           ),
  //         );
  //         // return
  //       }
  //       return Row(
  //         children: [
  //           MyInkWell(
  //             onTap: () {
  //               Navigator.of(context).pushNamed(RoutesName.signinRoute);
  //             },
  //             builder: (hover) {
  //               return Text(
  //                 'Login',
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   color: hover ? CustomTheme.blue : CustomTheme.t1,
  //                   fontWeight: FontWeight.w100,
  //                 ),
  //               );
  //             },
  //           ),
  //           const SizedBox(width: 3),
  //           Text(
  //             '/',
  //             style: TextStyle(
  //               fontSize: 14,
  //               color: CustomTheme.t1,
  //               fontWeight: FontWeight.w100,
  //             ),
  //           ),
  //           const SizedBox(width: 4),
  //           MyInkWell(
  //             onTap: () {
  //               Navigator.of(context).pushNamed(RoutesName.signupRoute);
  //             },
  //             builder: (hover) {
  //               return Text(
  //                 'Signup',
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   color: hover ? CustomTheme.blue : CustomTheme.t1,
  //                   fontWeight: FontWeight.w100,
  //                 ),
  //               );
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // MyInkWell _buildCartButton(BuildContext context) {
  //   return MyInkWell(
  //     onTap: () {
  //       Navigator.of(context).pushNamed(RoutesName.cartRoute);
  //     },
  //     builder: (hover) {
  //       return Row(
  //         children: [
  //           Icon(
  //             Icons.shopping_cart_rounded,
  //             size: 16,
  //             color: hover ? CustomTheme.blue : CustomTheme.t1,
  //           ),
  //           const SizedBox(width: 3),
  //           BlocBuilder<CartCubit, CartState>(
  //             builder: (context, state) {
  //               return Text(
  //                 'Cart (${state.items.length})',
  //                 style: TextStyle(
  //                   fontSize: 14,
  //                   color: hover ? CustomTheme.blue : CustomTheme.t1,
  //                   fontWeight: FontWeight.w100,
  //                 ),
  //               );
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // Widget _buildLocationDropdown(LayoutType layout) {
  //   double paddingW = 0;
  //   double iconS = 0;
  //   if (layout == LayoutType.x1) {
  //     paddingW = 6;
  //     iconS = 20;
  //   } else if (layout == LayoutType.x2) {
  //     paddingW = 14;
  //     iconS = 34;
  //   } else {
  //     paddingW = 12;
  //     iconS = 30;
  //   }
  //   return Container(
  //     height: layout == LayoutType.x2 ? 38 : 33,
  //     padding: EdgeInsets.only(left: paddingW),
  //     decoration: BoxDecoration(
  //       color: CustomTheme.white,
  //       borderRadius: BorderRadius.circular(4),
  //       border: Border.all(
  //         width: 0.8,
  //         color: CustomTheme.disabled,
  //       ),
  //     ),
  //     child: DropdownButton(
  //       value: location,
  //       menuMaxHeight: 300,
  //       underline: const SizedBox.shrink(),
  //       icon: Container(
  //         height: iconS,
  //         width: iconS,
  //         padding: EdgeInsets.only(left: paddingW * 2 / 3, right: paddingW),
  //         child: Image.asset('assets/images/arrow-pic.png'),
  //       ),
  //       items: [
  //         for (String val in locationList)
  //           DropdownMenuItem<String>(
  //             value: val,
  //             child: Text(
  //               val,
  //               style: TextStyle(
  //                 fontSize: layout == LayoutType.x2 ? 16 : 13,
  //                 color: CustomTheme.t1,
  //               ),
  //             ),
  //           ),
  //       ],
  //       onChanged: (newValue) {
  //         setState(() {
  //           if (newValue != null) {
  //             location = newValue;
  //           }
  //         });
  //       },
  //     ),
  //   );
  // }

  // Widget _buildLanguageDropdown(LayoutType layout) {
  //   double paddingW = 0;
  //   double iconS = 0;
  //   if (layout == LayoutType.x1) {
  //     paddingW = 6;
  //     iconS = 20;
  //   } else if (layout == LayoutType.x2) {
  //     paddingW = 14;
  //     iconS = 34;
  //   } else {
  //     paddingW = 12;
  //     iconS = 30;
  //   }
  //   return Container(
  //     height: layout == LayoutType.x2 ? 38 : 33,
  //     padding: EdgeInsets.only(left: paddingW),
  //     decoration: BoxDecoration(
  //       color: CustomTheme.white,
  //       borderRadius: BorderRadius.circular(4),
  //       border: Border.all(
  //         width: 0.8,
  //         color: CustomTheme.disabled,
  //       ),
  //     ),
  //     child: DropdownButton(
  //       value: language,
  //       menuMaxHeight: 300,
  //       underline: const SizedBox.shrink(),
  //       icon: Container(
  //         height: iconS,
  //         width: iconS,
  //         padding: EdgeInsets.only(left: paddingW * 2 / 3, right: paddingW),
  //         child: Image.asset('assets/images/arrow-pic.png'),
  //       ),
  //       items: [
  //         for (String val in languageList)
  //           DropdownMenuItem<String>(
  //             value: val,
  //             child: Text(
  //               val,
  //               style: TextStyle(
  //                 fontSize: layout == LayoutType.x2 ? 16 : 13,
  //                 color: CustomTheme.t1,
  //               ),
  //             ),
  //           ),
  //       ],
  //       onChanged: (newValue) {
  //         if (newValue != null) {
  //           setState(() {
  //             language = newValue;
  //           });
  //         }
  //       },
  //     ),
  //   );
  // }

  // Widget _buildHeader(BuildContext context) {
  //   return SizedBox(
  //     width: MediaQuery.of(context).size.width,
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: padding),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           SizedBox(
  //             height: 43,
  //             child: Image.asset('assets/images/logo.png'),
  //           ),
  //           const Spacer(),
  //           layout == LayoutType.x5 || layout == LayoutType.x4
  //               ? Row(
  //                   children: [
  //                     SizedBox(width: layout == LayoutType.x5 ? 28 : 21),
  //                     buildHeaderNav(
  //                         label: 'Home', onTap: onTapHome, layout: layout),
  //                     SizedBox(width: layout == LayoutType.x5 ? 32 : 24),
  //                     buildHeaderNav(
  //                         label: 'Doctors',
  //                         onTap: onTapDoctors,
  //                         layout: layout),
  //                     SizedBox(width: layout == LayoutType.x5 ? 28 : 21),
  //                     buildHeaderNav(
  //                         label: 'Diagnostics',
  //                         onTap: onTapDiagnostics,
  //                         layout: layout),
  //                     SizedBox(width: layout == LayoutType.x5 ? 32 : 24),
  //                     buildHeaderNav(
  //                         label: 'Medicines',
  //                         onTap: onTapMedicines,
  //                         layout: layout),
  //                     SizedBox(width: layout == LayoutType.x5 ? 77 : 50),
  //                     _buildCall(),
  //                     SizedBox(width: layout == LayoutType.x5 ? 52 : 32),
  //                     _buildBookAppointment(),
  //                   ],
  //                 )
  //               : layout == LayoutType.x3
  //                   ? const SizedBox.shrink()
  //                   : MediaQuery.of(context).size.width < 250
  //                       ? const SizedBox.shrink()
  //                       : MediaQuery.of(context).size.width < 325
  //                           ? Column(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               children: [
  //                                 _buildLanguageDropdown(layout),
  //                                 const SizedBox(height: 4),
  //                                 _buildLocationDropdown(layout),
  //                               ],
  //                             )
  //                           : Row(
  //                               children: [
  //                                 _buildLanguageDropdown(layout),
  //                                 const SizedBox(width: 5),
  //                                 _buildLocationDropdown(layout),
  //                               ],
  //                             ),
  //           layout != LayoutType.x5 && layout != LayoutType.x4
  //               ? const Spacer()
  //               : const SizedBox.shrink(),
  //           layout != LayoutType.x5 && layout != LayoutType.x4
  //               ? InkWell(
  //                   onTap: () {
  //                     // Open Menu
  //                     showCustomDialog();
  //                   },
  //                   child: SizedBox(
  //                     height: 24,
  //                     width: 24,
  //                     child: Image.asset('assets/images/menu.png'),
  //                   ),
  //                 )
  //               : const SizedBox.shrink(),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // MyInkWell _buildBookAppointment() {
  //   return MyInkWell(
  //     borderRadius: BorderRadius.circular(30),
  //     onTap: onTapBookAppointment,
  //     builder: (hover) {
  //       return AnimatedContainer(
  //         duration: const Duration(milliseconds: 200),
  //         padding: const EdgeInsets.symmetric(vertical: 14.5, horizontal: 26),
  //         decoration: BoxDecoration(
  //           color: hover ? CustomTheme.cyan : CustomTheme.white,
  //           borderRadius: BorderRadius.circular(30),
  //           border: Border.all(color: CustomTheme.cyan, width: 1.6),
  //         ),
  //         child: Text(
  //           'Book Appointment',
  //           style: TextStyle(
  //             fontSize: 16,
  //             color: hover ? CustomTheme.t3 : CustomTheme.cyan,
  //             fontWeight: FontWeight.w800,
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _buildCall() {
  //   return Row(
  //     children: [
  //       SizedBox(
  //         height: 50,
  //         child: Image.asset('assets/images/help-pic.png'),
  //       ),
  //       const SizedBox(width: 4),
  //       MyInkWell(
  //         onTap: onTapCall,
  //         builder: (hover) {
  //           return Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 'Helpline No.',
  //                 style: TextStyle(
  //                   color: CustomTheme.t4,
  //                   fontSize: 14,
  //                 ),
  //               ),
  //               const SizedBox(height: 3),
  //               Text(
  //                 '+234 905 1125',
  //                 style: TextStyle(
  //                   color: hover ? CustomTheme.blue : CustomTheme.t1,
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: layout == LayoutType.x5 ? 18 : 16,
  //                 ),
  //               ),
  //             ],
  //           );
  //         },
  //       ),
  //     ],
  //   );
  // }

  // void showCustomDialog() {
  //   showDialog(
  //     context: context,
  //     barrierColor: CustomTheme.black.withOpacity(0.7),
  //     builder: (context) {
  //       return Scaffold(
  //         backgroundColor: Colors.transparent,
  //         body: Center(
  //           child: Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
  //             child: Column(
  //               children: [
  //                 Container(
  //                   alignment: Alignment.centerRight,
  //                   child: InkWell(
  //                     onTap: () => Navigator.pop(context),
  //                     child: Icon(
  //                       Icons.close,
  //                       size: 24,
  //                       color: CustomTheme.white,
  //                     ),
  //                   ),
  //                 ),
  //                 const SizedBox(height: 10),
  //                 Expanded(
  //                   child: Container(
  //                     padding: const EdgeInsets.all(20),
  //                     color: CustomTheme.white,
  //                     child: SingleChildScrollView(
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           buildHeaderMenuNav(label: 'Home', onTap: onTapHome),
  //                           buildHeaderMenuNav(
  //                               label: 'Doctors', onTap: onTapDoctors),
  //                           buildHeaderMenuNav(
  //                               label: 'Diagnostics', onTap: onTapDiagnostics),
  //                           buildHeaderMenuNav(
  //                               label: 'Medicines', onTap: onTapMedicines),
  //                           _buildCartButton(context),
  //                           const SizedBox(height: 20),
  //                           _buildCall(),
  //                           const SizedBox(height: 20),
  //                           _buildBookAppointment(),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  // void onTapHome() {
  //   // Navigate to Home
  // }

  // void onTapDoctors() {
  //   // Navigate to Doctors
  //   Navigator.of(context).pushNamed(RoutesName.doctorListRoute);
  // }

  // void onTapDiagnostics() {
  //   // Navigate to Diagnostics
  //   Navigator.of(context).pushNamed(RoutesName.diagnosticsListRoute);
  // }

  // void onTapMedicines() {
  //   // Navigate to Medicines
  //   Navigator.of(context).pushNamed(RoutesName.medicineListRoute);
  // }

  // void onTapCall() {
  //   // Handle Call
  // }

  // void onTapBookAppointment() {
  //   // Navigate to Book Appointment
  //   Navigator.of(context).pushNamed(RoutesName.doctorListRoute);
  // }

  // Widget buildHeaderMenuNav({
  //   required String label,
  //   void Function()? onTap,
  // }) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 20),
  //     child: MyInkWell(
  //       onTap: onTap,
  //       builder: (hover) {
  //         return Text(
  //           label,
  //           style: TextStyle(
  //             fontSize: 15,
  //             color: hover ? CustomTheme.blue : CustomTheme.t1,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget buildHeaderNav({
  //   required String label,
  //   void Function()? onTap,
  //   required LayoutType layout,
  // }) {
  //   GlobalKey key = GlobalKey(debugLabel: label);
  //   double width = 0;
  //   return MyInkWell(
  //     onTap: onTap,
  //     builder: (hover) {
  //       if (key.currentContext != null && width == 0) {
  //         final txtBox = key.currentContext!.findRenderObject() as RenderBox;
  //         width = txtBox.size.width;
  //       }
  //       return Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           const SizedBox(height: 10),
  //           Text(
  //             label,
  //             key: key,
  //             style: TextStyle(
  //               fontSize: layout == LayoutType.x5 ? 18 : 16,
  //               color: hover ? CustomTheme.blue : CustomTheme.t1,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           const SizedBox(height: 9),
  //           AnimatedContainer(
  //             curve: Curves.easeInOut,
  //             duration: const Duration(milliseconds: 280),
  //             height: 2.5,
  //             width: hover ? width : 0,
  //             color: CustomTheme.blue,
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // // final List<String> items = [
  // //   'Item1',
  // //   'Item2',
  // //   'Item3',
  // //   'Item4',
  // // ];
  // String? selectedValue;

  // List<DropdownMenuItem<String>> _addDividersAfterItems() {
  //   List<DropdownMenuItem<String>> menuItems = [
  //     _buildDropDownMenuItem('My Profile', 'u1', RoutesName.doctorProfileRoute),
  //     const DropdownMenuItem<String>(
  //       enabled: false,
  //       child: Divider(),
  //     ),
  //     _buildDropDownMenuItem(
  //         'My Appointments', 'u2', RoutesName.myAppointmentsRoute),
  //     const DropdownMenuItem<String>(
  //       enabled: false,
  //       child: Divider(),
  //     ),
  //     _buildDropDownMenuItem('My Orders', 'u3', RoutesName.myOrdersRoute),
  //     const DropdownMenuItem<String>(
  //       enabled: false,
  //       child: Divider(),
  //     ),
  //     _buildDropDownMenuItem(
  //         'My Prescriptions', 'u4', RoutesName.doctorProfileRoute),
  //     const DropdownMenuItem<String>(
  //       enabled: false,
  //       child: Divider(),
  //     ),
  //     _buildDropDownMenuItem('My Tests', 'u5', RoutesName.doctorProfileRoute),
  //     const DropdownMenuItem<String>(
  //       enabled: false,
  //       child: Divider(),
  //     ),
  //     _buildDropDownMenuItem('My Feedback', 'u6', RoutesName.feedbackRoute),
  //     const DropdownMenuItem<String>(
  //       enabled: false,
  //       child: Divider(),
  //     ),
  //     _buildDropDownMenuItem('Logout', 'u7', 'Logout'),
  //   ];
  //   return menuItems;
  // }

  // DropdownMenuItem<String> _buildDropDownMenuItem(
  //     String name, String imageName, String route) {
  //   return DropdownMenuItem<String>(
  //     value: route,
  //     onTap: () async {
  //       // // Navigator.pop(context);

  //       // print(route);
  //       // await Future.delayed(Duration(milliseconds: 500));
  //       // if (!mounted) return;
  //       // Navigator.pushNamed(context, route);
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
  //       child: Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           SizedBox(
  //             width: 18,
  //             height: 18,
  //             child: Image.asset('assets/images/$imageName.png'),
  //           ),
  //           const SizedBox(width: 8),
  //           Text(
  //             name,
  //             style: TextStyle(
  //               fontSize: 14,
  //               color: CustomTheme.t1,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // List<double> _getCustomItemsHeights() {
  //   List<double> itemsHeights = [];
  //   for (var i = 0; i < 13; i++) {
  //     if (i.isEven) {
  //       itemsHeights.add(40);
  //     }
  //     //Dividers indexes will be the odd indexes
  //     if (i.isOdd) {
  //       itemsHeights.add(4);
  //     }
  //   }
  //   return itemsHeights;
  // }
}

class MyHeaderBg extends StatefulWidget {
  final ScrollController controller;

  const MyHeaderBg({
    super.key,
    required this.controller,
  });

  @override
  State<MyHeaderBg> createState() => _MyHeaderBgState();
}

class _MyHeaderBgState extends State<MyHeaderBg> {
  bool atTop = true;

  void _scrollListener() {
    if (widget.controller.offset < 40) {
      if (!atTop) {
        setState(() {
          atTop = true;
        });
      }
    } else if (widget.controller.offset != 0) {
      if (atTop) {
        setState(() {
          atTop = false;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_scrollListener);
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.fastLinearToSlowEaseIn,
          height: atTop ? 46 : 0,
          color: CustomTheme.blue,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          height: atTop ? 86 : 70,
          color: CustomTheme.blue,
        ),
      ],
    );
  }
}
