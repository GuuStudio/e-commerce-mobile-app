import 'package:flutter/material.dart';

import 'boarding_page_indicator.dart';

class BoardingSwiper extends StatefulWidget {
  const BoardingSwiper({super.key});

  @override
  State<BoardingSwiper> createState() => _BoardingSwiperState();
}

class _BoardingSwiperState extends State<BoardingSwiper> with TickerProviderStateMixin {
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: MediaQuery.sizeOf(context).height - 150,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            children: <Widget>[
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset('assets/images/onboarding/onboarding_01.png'),
                  const SizedBox(
                    height: 63,
                  ),
                  const Text(
                    'All your favorites',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                     child: RichText(
                       textAlign: TextAlign.center,
                       text: const TextSpan(
                         text: 'Get all your loved foods in one once place, you just place the orer we do the rest',
                         style: TextStyle(color: Colors.black, fontSize: 16,),
                       ),
                     ) ,
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset('assets/images/onboarding/onboarding_02.png'),
                  const SizedBox(
                    height: 63,
                  ),
                  const Text(
                    'Order from choosen chef',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'Get all your loved foods in one once place, you just place the orer we do the rest',
                        style: TextStyle(color: Colors.black, fontSize: 16,),
                      ),
                    ) ,
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset('assets/images/onboarding/onboarding_03.png'),
                  const SizedBox(
                    height: 63,
                  ),
                  const Text(
                    'Free delivery offers',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: 'Get all your loved foods in one once place, you just place the orer we do the rest',
                        style: TextStyle(color: Colors.black, fontSize: 16,),
                      ),
                    ) ,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: PageIndicator(
              tabController: _tabController,
              currentPageIndex: _currentPageIndex,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              showDot: true,
            ),
          ),
        ],
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }
}
