import 'package:eqraa_book_store/core/constants/constants.dart';
import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Profile",
          style: StylesManager.textStyle24px.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
            ),
            const SizedBox(height: 10),
            Text(
              "Willie 👋🏻",
              style: StylesManager.textStyle24px,
            ),
            const Text(
              "willie@example.com",
              style: StylesManager.textStyle15px,
            ),
            const SizedBox(height: 30),
            _buildProfileOption(
              icon: Icons.shopping_bag_outlined,
              title: "My Orders",
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.favorite_outline,
              title: "Wishlist",
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.settings_outlined,
              title: "Settings",
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.help_outline,
              title: "Help Center",
              onTap: () {},
            ),
            _buildProfileOption(
              icon: Icons.logout,
              title: "Logout",
              titleColor: Colors.red,
              iconColor: Colors.red,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? titleColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Constants.mainColor),
      title: Text(
        title,
        style: StylesManager.optionLogin20px.copyWith(
          color: titleColor ?? Colors.black,
          fontSize: 18,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
