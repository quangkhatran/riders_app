import 'package:flutter/material.dart';
import 'package:riders_app/splashScreen/splash_screen.dart';

class ShipmentScreen extends StatefulWidget {
  String? purchaserId;
  String? sellerId;
  String? getOrderID;
  String? purchaserAddress;
  double? purchaserLat;
  double? purchaserLng;

  ShipmentScreen({
    this.purchaserId,
    this.sellerId,
    this.getOrderID,
    this.purchaserAddress,
    this.purchaserLat,
    this.purchaserLng,
  });

  @override
  State<ShipmentScreen> createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/confirm1.png',
            width: 350,
          ),
          const SizedBox(
            height: 5.0,
          ),
          GestureDetector(
            onTap: () {
              // show location from rider current location towards seller location
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/restaurant.png',
                  width: 50,
                ),
                const SizedBox(
                  width: 7.0,
                ),
                Column(
                  children: const [
                    SizedBox(
                      height: 12.0,
                    ),
                    Text('Show Cafe/Restaurant Location',
                        style: TextStyle(
                          fontFamily: 'Signatra',
                          fontSize: 18.0,
                          letterSpacing: 2.0,
                        )),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: InkWell(
                onTap: () {
                  // confirmed - that rider has picked parcel from seller
                },
                child: Container(
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
                  width: MediaQuery.of(context).size.width - 90.0,
                  height: 50.0,
                  child: const Center(
                    child: Text(
                      'Order has been Picked - Confirmed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
