import 'package:equatable/equatable.dart';

class Pdf extends Equatable {
  final bool? isAvailable;
  final String? acsTokenLink;

  const Pdf({this.isAvailable, this.acsTokenLink});

  factory Pdf.fromJson(Map<String, dynamic> json) =>
      Pdf(isAvailable: json['isAvailable'] as bool?);

  Map<String, dynamic> toJson() => {'isAvailable': isAvailable};

  @override
  List<Object?> get props => [isAvailable];
}
