import 'package:flutter/material.dart';

class IconDetail extends StatelessWidget {
  const IconDetail(
      {super.key, required this.title, required this.subtitle, this.imgUrl});
  final String? imgUrl;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        imgUrl == null
            ? Padding(padding: EdgeInsets.symmetric(horizontal: 8))
            : Image.asset(
                imgUrl!,
                scale: 8,
              ),
        SizedBox(
          height: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              subtitle,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        )
      ],
    );
  }
}
