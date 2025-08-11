class HinoModel {
  final String hino;
  final String coro;
  final Map<String, String> verses;

  HinoModel({required this.hino, required this.coro, required this.verses});

  factory HinoModel.fromJson(Map<String, dynamic> json) {
    return HinoModel(
      hino: json['hino'],
      coro: json['coro'],
      verses: Map<String, String>.from(json['verses']),
    );
  }
}
