import 'package:binary_brains/models/rive_asset.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CustomListTile extends StatelessWidget {
  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final bool isActive;

  const CustomListTile({
    super.key,
    required this.menu,
    required this.press,
    required this.riveOnInit,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24.0),
          child: Divider(
              // color: Colors.white10,
              ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 250),
              height: 56,
              width: isActive ? 288 : 0,
              left: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                height: 34,
                width: 34,
                child: RiveAnimation.asset(
                  menu.src,
                  artboard: menu.artboard,
                  onInit: riveOnInit,
                ),
              ),
              title: Text(
                menu.title,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    // color: isActive ? Colors.orange : Colors.white,
                    ),
                // style: kTextStyle.copyWith(
                // color: isActive ? kWhiteColor : kWhiteColor.withOpacity(0.8),
                // ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
