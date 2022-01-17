class Cupon {
  String name;
  String description;
  String code;
  String imageURL;
  String qrCode;

  Cupon({
    required this.name,
    required this.description,
    required this.code,
    required this.imageURL,
    this.qrCode =
        'https://latam.kaspersky.com/content/es-mx/images/repository/isc/2020/9910/a-guide-to-qr-codes-and-how-to-scan-qr-codes-2.png',
  });
}
