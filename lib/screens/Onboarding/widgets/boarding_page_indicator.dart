import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.showDot,
  });

  final int currentPageIndex;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    if (!showDot) {
      return const SizedBox.shrink();
    }
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TabPageSelector(
                controller: tabController,
                color: colorScheme.primaryFixed,
                selectedColor: colorScheme.primary,
                borderStyle: BorderStyle.none,
              ),
            ],
          ),
          const SizedBox(
            height: 69,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.sizeOf(context).width,
            height: 62,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  )
              ),
              onPressed: () {
                if (currentPageIndex == 2) {
                  Navigator.pushReplacementNamed(context, '/sign-in');
                }
                onUpdateCurrentPageIndex(currentPageIndex + 1);
              },
              child: Text(currentPageIndex == 2 ? 'Get Started' : 'Next', style: const TextStyle(fontSize: 16, color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
