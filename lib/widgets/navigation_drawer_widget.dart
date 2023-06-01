import 'package:flutter/material.dart';
import 'package:weather_app/testings.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context){
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Background/rain b.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Center(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 60),
              children: <Widget>[
                const SizedBox(height: 150),
                buildMenuItem(
                  text: "About Us",
                  icon: Icons.info,
                  onClicked: () => selectedItem(context, 0),
                ),
                const SizedBox(height: 0),
                buildMenuItem(
                    text: "Team",
                    icon: Icons.group,
                    onClicked: () => selectedItem(context, 1)
                ),
                const SizedBox(height: 0),
                buildMenuItem(
                    text: "Technologies",
                    icon: Icons.extension,
                    onClicked: () => selectedItem(context, 2)
                ),
                const SizedBox(height: 0),
                buildMenuItem(
                    text: "Contact",
                    icon: Icons.contact_support,
                    onClicked: () => selectedItem(context, 3)
                ),
              ],
            ),
          ),
          Container(color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,

  }) {
    final color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color),),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  testings(),
        ),
        );
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  testings(),
        ),
        );
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  testings(),
        ),
        );
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  testings(),
        ),
        );
        break;
    }
  }
}

