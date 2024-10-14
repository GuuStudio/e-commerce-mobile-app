import 'package:e_commerce_app/apps/constants.dart';
import 'package:flutter/material.dart';

class DetailDescription extends StatefulWidget {
  const DetailDescription({super.key, required this.text});

  final String text;

  @override
  State<DetailDescription> createState() => _DetailDescriptionState();
}

class _DetailDescriptionState extends State<DetailDescription> {
  int currentSelected = 0;
  final List<String> titles = ['Description', 'Specifications', 'Reviews'];

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            titles.length,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  currentSelected = index;
                });
              },
              child: Container(
                height: 40,
                width: MediaQuery.sizeOf(context).width / 3 - 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: currentSelected == index ? themeData.primaryColor : kcontentColor,
                ),
                child: Center(
                  child: Text(
                    titles[index],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: currentSelected == index ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
