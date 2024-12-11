class Post {
  String? pickupLocation; // Místo nakládky
  String? dropoffLocation; // Místo vykládky
  String? vehicleSize; // Velikost auta
  String? description; // Popis
  String? photo; // Odkaz na fotku nebo soubor

  Post({
    this.pickupLocation,
    this.dropoffLocation,
    this.vehicleSize,
    this.description,
    this.photo,
  });
}
