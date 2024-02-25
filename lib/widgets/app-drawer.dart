import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text('Hello Friend'),
          automaticallyImplyLeading: false,
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.shop),
          title: const Text('shop'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.payment),
          title: const Text('orders'),
          onTap: () {
          //  Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
            // Navigator.of(context)
            //     .pushReplacement(CustomRoute(builder: (ctx) => OrdersScreen()));
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Manage Products'),
          onTap: () {
           // Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
          },
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.exit_to_app),
          title: const Text('Logout'),
          onTap: () {
            // Navigator.of(context)
            //     .pushReplacementNamed(UserProductsScreen.routeName);
            Navigator.of(context).pop();
      //      Provider.of<Auth>(context, listen: false).logout();
          },
        ),
      ]),
    );
  }
}
