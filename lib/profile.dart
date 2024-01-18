import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            profilePic(),
          ],
        ),
      ),
    );
  }

  Widget profilePic() {
    return Container(
      alignment: Alignment.center,
      child: Image.network(
        'https://cs12.pikabu.ru/post_img/big/2022/03/21/10/164788475811377451.jpg',
        height: 200,
        width: 200,
      ),
    );
  }
}
