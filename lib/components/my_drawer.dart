import 'package:flutter/material.dart';
import 'package:wallpaper_app/components/my_drawer_tile.dart';
import 'package:wallpaper_app/view/home.dart';
import 'package:wallpaper_app/view/my_settings.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 42),
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
          color: Theme.of(context).colorScheme.inverseSurface),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Ahmad Younis",
                    style: TextStyle(
                        color: Colors.blueGrey, fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueGrey
                    ),
                      child: Icon(
                    Icons.person,
                    size: 50,
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Divider(
              indent: 12,
              endIndent: 12,
              color: Theme.of(context).colorScheme.secondary,
            ),
            MyDrawerTile(title: "Home", iconData: Icons.home, onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const Home()));
            }),
            Divider(
              indent: 12,
              endIndent: 12,
              color: Theme.of(context).colorScheme.secondary,
            ),
            MyDrawerTile(title: "Settings", iconData: Icons.settings, onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const MySettings()));
            }),
          ],
        ),
      ),
    );
  }
}
