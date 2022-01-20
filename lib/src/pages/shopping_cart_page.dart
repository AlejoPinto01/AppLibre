//ignore_for_file: unnecessary_new, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, sized_box_for_whitespace
import 'package:applibre/src/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'delivery_page.dart';

class ShoppingPage extends StatefulWidget {
  ShoppingPage({this.includeMarkAsDoneButton = true});

  final bool includeMarkAsDoneButton;

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: compruebaLista(),
      bottomNavigationBar: Container(
        color: Colors.red[900],
        height: 35,
        width: 200,
        child: Center(
          child: compruebaPrecio(),
        ),
      ),
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: Text(
          'Cesta de la compra',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[900],
      ),
      body: Stack(
        children: [
          compruebaListView(),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [Colors.black.withOpacity(0.3), Colors.transparent],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getTotal() {
    double total = 0;
    for (int i = 0; i < getPedido().length; i++) {
      total += (getPedido()[i].price * cantidad[getPedido()[i].name]!);
    }
    return total.toStringAsFixed(2);
  }

  compruebaLista() {
    if (getPedido().isNotEmpty) {
      return Container(
        width: 190,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green,
        ),
        child: TextButton(
          child: Row(
            children: [
              Text(
                'Realizar pedido',
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
                size: 30,
              )
            ],
          ),
          onPressed: () {
            final route = MaterialPageRoute(builder: (context) {
              return DeliveryPage();
            });
            Navigator.push(context, route);
          },
        ),
      );
    }
  }

  compruebaPrecio() {
    if (getPedido().isNotEmpty) {
      return Text(
        'Total: ${getTotal()}€',
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      );
    } else {
      return Text(
        'Vuelve cuando sepas que comer!',
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      );
    }
  }

  compruebaListView() {
    if (getPedido().isNotEmpty) {
      return new ListView.builder(
        itemCount: getPedido().length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.yellow[100],
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  child: Container(
                    child: Image.asset(
                      getPedido()[index].image,
                      fit: BoxFit.cover,
                    ),
                    width: 130,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: 100,
                      child: Text(
                        getPedido()[index].name,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          height: 2,
                        ),
                      ),
                    ),
                    Text(
                      '${getPedido()[index].price}€',
                      style: GoogleFonts.montserrat(),
                    ),
                  ],
                ),
                Container(
                  width: 150,
                  child: Row(
                    children: [
                      TextButton(
                        child: Text(
                          '-',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            int actual = cantidad[getPedido()[index].name]!;
                            if (actual != 0) {
                              cantidad[getPedido()[index].name] = actual - 1;
                            }
                            if (cantidad[getPedido()[index].name] == 0) {
                              deleteDish(getPedido()[index]);
                            }
                          });
                        },
                      ),
                      Text(
                        '${cantidad[getPedido()[index].name]}',
                        style: GoogleFonts.montserrat(),
                      ),
                      TextButton(
                        child: Text(
                          '+',
                          style: GoogleFonts.montserrat(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            int actual = cantidad[getPedido()[index].name]!;
                            cantidad[getPedido()[index].name] = actual + 1;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 40,
                  child: Icon(Icons.arrow_right),
                  color: Colors.yellow[200],
                ),
                Container(
                  width: 70,
                  color: Colors.yellow[200],
                  child: Center(
                    child: Text(
                      '${calcularPrecio(index, cantidad[getPedido()[index].name]!)}€',
                      style: GoogleFonts.montserrat(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      return Center(
        child: Text(
          'No hay nada :(',
          style: GoogleFonts.montserrat(fontSize: 30, color: Colors.brown[700]),
        ),
      );
    }
  }
}
