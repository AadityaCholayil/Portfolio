import 'package:my_portfolio/shared/improved_scroll/improved_scrolling.dart';
import 'package:my_portfolio/shared/web_wrapper/header.dart';
import 'package:my_portfolio/themes/theme.dart';
import 'package:flutter/material.dart';

enum LayoutType { x5, x4, x3, x2, x1 }

class WebWrapper extends StatefulWidget {
  final Widget Function(LayoutType layout, double padding) builder;

  const WebWrapper({super.key, required this.builder});

  @override
  State<WebWrapper> createState() => _WebWrapperState();
}

class _WebWrapperState extends State<WebWrapper> {
  late ScrollController _controller;
  double padding = 20;

  LayoutType layout = LayoutType.x4;

  void setParameters(double width) {
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
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double dividerHeight = (250 - (height % 250)) / 2 + 125;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: MyFloatingActionButton(controller: _controller),
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
          scrollController: _controller,
          child: Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  setParameters(constraints.maxWidth);
                  return ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context)
                        .copyWith(scrollbars: false),
                    child: SingleChildScrollView(
                      physics: layout == LayoutType.x1
                          ? const ClampingScrollPhysics()
                          : const NeverScrollableScrollPhysics(),
                      controller: _controller,
                      child: widget.builder(layout, padding),
                    ),
                  );
                },
              ),
              const MyHeader(),
            ],
          ),
        ),
      ),
    );
  }
}

class MyScrollbar extends StatefulWidget {
  final ScrollController controller;
  final LayoutType layout;

  const MyScrollbar(
      {super.key, required this.controller, required this.layout});

  @override
  State<MyScrollbar> createState() => _MyScrollbarState();
}

class _MyScrollbarState extends State<MyScrollbar> {
  double _offset = 0;
  double height = 0;
  double maxHeight = 0;
  double barHeight = 0;
  LayoutType layout = LayoutType.x1;

  void setParameters() {
    double width = MediaQuery.of(context).size.width;
    if (width > 1200) {
      layout = LayoutType.x5;
    } else if (width > 992) {
      layout = LayoutType.x4;
    } else if (width > 768) {
      layout = LayoutType.x3;
    } else if (width > 576) {
      layout = LayoutType.x2;
    } else {
      layout = LayoutType.x1;
    }
  }

  void _scrollListener() {
    if (mounted) {
      double offset =
          (widget.controller.offset / maxHeight) * (height - barHeight);
      setState(() {
        if (offset != 0 && offset + barHeight < height) {
          _offset = offset;
        }
      });
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.controller.hasClients) {
        setState(() {
          height = MediaQuery.of(context).size.height;
          maxHeight = widget.controller.position.maxScrollExtent;
          barHeight = height * (height / maxHeight);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        setParameters();
        bool showBar = true;
        height = MediaQuery.of(context).size.height;
        maxHeight = widget.controller.position.maxScrollExtent;
        barHeight = height * (height / maxHeight);
        if (layout == LayoutType.x1 || maxHeight < height) {
          showBar = false;
        }
        return Container(
          alignment: Alignment.centerRight,
          height: MediaQuery.of(context).size.height,
          width: 16,
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width - 16),
          color: !showBar ? Colors.transparent : Colors.black.withOpacity(0.06),
          child: Container(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              child: Container(
                height: barHeight,
                width: 10,
                margin: EdgeInsets.only(
                    left: layout == LayoutType.x1 ? 8 : 3.2,
                    right: 3.2,
                    top: _offset > 0
                        ? _offset < maxHeight
                            ? _offset
                            : maxHeight
                        : 0),
                decoration: BoxDecoration(
                  color: !showBar ? Colors.transparent : Colors.grey[400],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onVerticalDragUpdate: (dragUpdate) {
                double newOffset = (maxHeight / (height - barHeight)) *
                    dragUpdate.globalPosition.dy;
                if (newOffset > 0 ||
                    newOffset < widget.controller.position.maxScrollExtent) {
                  widget.controller.position.moveTo(newOffset);
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class MyFloatingActionButton extends StatefulWidget {
  final ScrollController controller;

  const MyFloatingActionButton({
    super.key,
    required this.controller,
  });

  @override
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  bool atTop = true;

  void _scrollListener() {
    if (widget.controller.offset < 90) {
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
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SizedBox(
        height: 40,
        width: 40,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 250),
          opacity: atTop ? 0 : 1,
          child: SizedBox(
            child: FloatingActionButton(
              backgroundColor: CustomTheme.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
              onPressed: () {
                widget.controller.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn);
                setState(() {});
              },
              child: const Icon(
                Icons.arrow_upward_rounded,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
