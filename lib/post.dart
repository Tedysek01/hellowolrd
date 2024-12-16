class Post {
  String? pickupLocation; // Místo nakládky
  String? dropoffLocation; // Místo vykládky
  String? date; // Datum
  String? vehicleSize; // Velikost auta
  String? description; // Popis
  String? photo; // Odkaz na fotku nebo soubor
  double? supposedPrice; // Odhadovaná cena
  double? fee; // Poplatek

  Post({
    this.pickupLocation,
    this.dropoffLocation,
    this.date,
    this.vehicleSize,
    this.description,
    this.photo,
    this.supposedPrice,
    this.fee,
  });

  // Převod Post na Mapu pro Firestore
  Map<String, dynamic> toMap() {
    return {
      'pickupLocation': pickupLocation,
      'dropoffLocation': dropoffLocation,
      'date': date,
      'vehicleSize': vehicleSize,
      'description': description,
      'photo': photo,
      'supposedPrice': supposedPrice,
      'fee': fee,
    };
  }

  // Vytvoření Post z Firestore dokumentu
  factory Post.fromFirestore(Map<String, dynamic> data) {
    return Post(
      pickupLocation: data['pickupLocation'],
      dropoffLocation: data['dropoffLocation'],
      date: data['date'],
      vehicleSize: data['vehicleSize'],
      description: data['description'],
      photo: data['photo'],
      supposedPrice: (data['supposedPrice'] as num?)?.toDouble(),
      fee: (data['fee'] as num?)?.toDouble(),
    );
  }
}
