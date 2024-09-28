import 'drawer_item.dart';
import 'drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Drawerwidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  const Drawerwidget({
    Key? key,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7), BlendMode.dstATop),
              fit: BoxFit.fill,
              image: const AssetImage('assets/images/rtt.png'))),
      padding: EdgeInsets.only(right: 1.w),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDrawerItems(context),
          ],
        ),
      ),
    );
  }

  // SingleChildScrollView
  Widget buildDrawerItems(BuildContext context) => Column(
        children: DrawerItems.all
            .map(
              (item) => ListTile(
                trailing: item.title != 'دور الــــعـجـلـــــة'
                    ? Icon(
                        item.icon,
                        color: Colors.white,
                        shadows: const <Shadow>[
                          Shadow(
                            offset: Offset(4.0, 6.0),
                            blurRadius: 7.0,
                            color: Colors.black87,
                          ),
                        ],
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black87,
                              spreadRadius: 2,
                              offset: Offset(3.0, 5.0),
                              blurRadius: 7.0, // changes position of shadow
                            ),
                          ],
                        ),
                        child: Image.asset('assets/images/spiner_icon.png',
                            width: 5.5.w)),
                title: Text(
                  item.title,
                  textAlign: TextAlign.right,
                  style: (const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(7.0, 7.0),
                        blurRadius: 7.0,
                        color: Colors.black,
                      ),
                    ],
                  )),
                ),
                onTap: () => onSelectedItem(item),
              ),
            )
            .toList(), // ListTileI
      );
}
