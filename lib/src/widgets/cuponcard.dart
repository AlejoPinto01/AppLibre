import 'package:applibre/src/models/cupon.dart';
import 'package:flutter/material.dart';

class CuponCard extends StatelessWidget {
  Cupon cupon;

  CuponCard({required this.cupon});

  @override
  Widget build(BuildContext context) {
    final tarjeta = Container(
      child: Column(
        children: [
          Container(
            width: 160,
            height: 130,
            //color: Colors.green,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(cupon.imageURL),
              ),
            ),
          ),
          Container(
            child: Text(cupon.name),
            padding: EdgeInsets.only(top: 20),
          ),
        ],
      ),
    );
    return InkWell(
      child: Container(
        child: ClipRRect(
          child: tarjeta,
          borderRadius: BorderRadius.circular(15.0),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
          color: Colors.white,
        ),
        margin: EdgeInsets.all(10),
      ),
      onTap: () {
        print('kebab');
        _mostarCupon(context);
      },
    );
  }

  void _mostarCupon(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            cupon.name,
            style: TextStyle(fontSize: 20),
          ),
          content: FittedBox(
            child: Column(
              children: [
                Container(
                  width: 300,
                  child: Text(
                    cupon.description,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(cupon.qrCode),
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    cupon.code,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
