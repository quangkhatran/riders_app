import 'package:flutter/material.dart';

import '../global/global.dart';

import '../authentication/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Card makeDashboardItem(String title, IconData iconData, int index) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: index == 0 || index == 3 || index == 4
            ? const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.amber,
                    Colors.cyan,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              )
            : const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.redAccent,
                    Colors.amber,
                  ],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              // new available orders
            }
            if (index == 1) {
              // parcels in progress
            }
            if (index == 2) {
              // not yet delivered
            }
            if (index == 3) {
              // history
            }
            if (index == 4) {
              // total earnings
            }
            if (index == 5) {
              // logout
              firebaseAuth.signOut().then(
                (value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => const AuthScreen()));
                },
              );
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Center(
                child: Icon(
                  iconData,
                  size: 40,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: Text(
          'Welcome ' + sharedPreferences!.getString('name')!,
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.black,
            fontFamily: 'Signatra',
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 1.0,
        ),
        child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(2.0),
            children: [
              makeDashboardItem('New Available Orders', Icons.assignment, 0),
              makeDashboardItem(
                  'Parcels in Progress', Icons.airport_shuttle, 1),
              makeDashboardItem('Not Yet Delivered', Icons.location_history, 2),
              makeDashboardItem('History', Icons.done_all, 3),
              makeDashboardItem('Total Earnings', Icons.monetization_on, 4),
              makeDashboardItem('Logout', Icons.logout, 5),
            ]),
      ),
    );
  }
}
