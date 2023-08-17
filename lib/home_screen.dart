import 'package:card_animation/widgets/coffee_info.dart';
import 'package:card_animation/data/data.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StarbucksDrinks extends StatefulWidget {
  const StarbucksDrinks({Key? key}) : super(key: key);

  @override
  State<StarbucksDrinks> createState() => _StarbucksDrinksState();
}

class _StarbucksDrinksState extends State<StarbucksDrinks> {
  @override
  void initState() {
    super.initState();
  }

  int activeIndex = 0;

  bool fromBack = false;
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFF006241),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15),
              child: Text(
                "Starbucks Drinks",
                style: themeData.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.grey.shade200,
                ),
              ),
            ),
            SizedBox(
              height: 420,
              width: double.maxFinite,
              child: Swiper(
                onIndexChanged: (value) {
                  if (value > activeIndex) {
                    _pageController.nextPage(
                        duration: 400.ms, curve: Curves.decelerate);
                    fromBack = false;
                  }
                  if (value < activeIndex) {
                    _pageController.previousPage(
                        duration: 400.ms, curve: Curves.decelerate);
                    fromBack = true;
                  }
                  activeIndex = value;
                  setState(() {});
                },
                itemBuilder: (BuildContext context, int index) {
                  return SwipeCard(
                    price: listOfData[index]['price'],
                    isActive: activeIndex == index,
                    fromBack: fromBack,
                    title: listOfData[index]['name'],
                    image: listOfData[index]['image'],
                  );
                },
                itemCount: listOfData.length,
                loop: false,
                index: 0,
                itemWidth: 324.0,
                itemHeight: 400,
                layout: SwiperLayout.STACK,
                physics: const BouncingScrollPhysics(),
              ),
            ),
            SizedBox(
              height: 230,
              child: PageView.builder(
                itemCount: listOfData.length,
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CoffeeInfo(
                    name: listOfData[index]['name'],
                    des: listOfData[index]['des'],
                    price: listOfData[index]['price'],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SwipeCard extends StatefulWidget {
  const SwipeCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.isActive,
    required this.fromBack,
  });
  final String title;
  final String image;
  final String price;

  final bool isActive;
  final bool fromBack;

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  bool isSwiped = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFFDEDEDE),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Visibility(
        visible: widget.isActive,
        child: Image.asset(
          widget.image,
        ),
      )
          .animate(target: widget.isActive ? 1 : 0)
          // coffee will come form left or right
          .moveX(
              begin: widget.fromBack ? -300 : 300,
              delay: 110.ms,
              duration: 250.ms,
              curve: Curves.easeOutCirc)
          .then(delay: 600.ms)
          // then move coffee forward
          .moveX(end: 100)
          .then()
          // then zoom in 2x
          .scaleXY(end: 2, delay: 200.ms, duration: 1000.ms)
          .then()
          // then move while zoomed in 2x
          .moveX(end: -400, duration: 2000.ms)
          .then()
          // then zoomed view end zoom out back to original size
          .scaleXY(end: 0.5, delay: 300.ms, duration: 500.ms)
          .then()
          .moveX(end: 100, duration: 1000.ms),
    );
  }
}
