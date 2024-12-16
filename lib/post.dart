class Post {
  String? pickupLocation; // Místo nakládky
  String? dropoffLocation; // Místo vykládky
  String? date;
  String? vehicleSize; // Velikost auta
  String? description; // Popis
  String? photo; // Odkaz na fotku nebo soubor
  double? supposedPrice;
  double? fee;

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

 @override
  String toString() {
    return 'Post(pickupLocation: $pickupLocation, dropoffLocation: $dropoffLocation, vehicleSize: $vehicleSize, description: $description, photo: $photo, date: $date)';
  }

}

