import 'package:flutter/material.dart';

class CuponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(7, (index) {
          return Center(
            child: _generateCard2(context),
          );
        }),
      ),
    );
  }

  _generateCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      child: InkWell(
        splashColor: Colors.brown.withAlpha(500),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: const SizedBox(
          width: 160,
          height: 190,
          child: Text('asdf'),
        ),
      ),
    );
  }

  _generateCard2(BuildContext context) {
    final tarjeta = Container(
      //clipBehavior: Clip.antiAlias,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            width: 160,
            height: 130,
            //color: Colors.green,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://saborgourmet.com//wp-content/uploads/el-kebab-tipico-de-turquia-istock.jpg'),
              ),
            ),
          ),
          Container(
            child: Text('Kebab'),
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
            'Código promoción',
            style: TextStyle(fontSize: 15),
          ),
          content: Container(
            child: Text(
              'D369',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
