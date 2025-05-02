import 'package:flutter/material.dart';
import 'package:mobile_me/common/utils/navigation_utils.dart';
import 'package:mobile_me/core/auth/pages/auth_login_page.dart';
import 'package:mobile_me/core/home/pages/home_page.dart';
import 'package:mobile_me/core/posts/pages/posts_page.dart';
import 'package:mobile_me/core/products/pages/products_page.dart';
import 'package:mobile_me/core/recipes/pages/recipes_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.indigo,
            margin: EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Menu',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        iconSize: 28,
                        onPressed: () => _closeDrawer(context),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              NavigationUtils.push(context, HomePage());
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('Posts'),
            onTap: () {
              NavigationUtils.push(context, PostsPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text('Recipes'),
            onTap: () {
              NavigationUtils.push(context, RecipesPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Products'),
            onTap: () {
              NavigationUtils.push(context, ProductsPage());
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            iconColor: Colors.redAccent,
            textColor: Colors.redAccent,
            splashColor: Colors.redAccent[50],
            title: Text('Sign out'),
            onTap: () {
              NavigationUtils.pushAndRemove(context, AuthLoginPage());
            },
          ),
        ],
      ),
    );
  }

  void _closeDrawer(BuildContext context) {
    Navigator.of(context).pop();
  }
}
