

// class SpecialtyModel {
//   final String name;
//   final String iconPath;

//   const SpecialtyModel({required this.name, required this.iconPath});
// }
// const List<SpecialtyModel> specialties = [
//   SpecialtyModel(name: "Dentist", iconPath: SvgAssets.dentalTooth),
//   SpecialtyModel(name: "Cardiologist", iconPath: SvgAssets.anatomicalHeart),
//   SpecialtyModel(name: "ENT", iconPath: SvgAssets.nose),
//   SpecialtyModel(name: "General Practitioner", iconPath: SvgAssets.brain),
//   SpecialtyModel(name: "Gastroenterologist", iconPath: SvgAssets.digestion),
//   SpecialtyModel(name: "Orthopedic", iconPath: SvgAssets.boneBroken),
//   SpecialtyModel(name: "Psychiatrist", iconPath: SvgAssets.quillUserSad),
//   SpecialtyModel(name: "Endocrinologist", iconPath: SvgAssets.bloodBag),
//   SpecialtyModel(name: "Pulmonologist", iconPath: SvgAssets.biLungs),
//   SpecialtyModel(name: "Oncologist", iconPath: SvgAssets.dna),
//   SpecialtyModel(name: "Neurologist", iconPath: SvgAssets.fluentEmoji),
//   SpecialtyModel(name: "Ophthalmologist", iconPath: SvgAssets.faRegularEye),
// ];
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';

class FakeData {
  static final List<Map<String, dynamic>> doctors = [
    {
      "name": "Robert Johnson",
      "specialty": "Orthopedic",
      "address": "El-Nasr Hospital",
      "rating": 4.8,
      "startDate": "9:30am",
      "endDate": "8:00pm",
      "imagePath": ImageAssets.fakeDoctorImage1,
    },
    {
      "name": "Emily Smith",
      "specialty": "Cardiology",
      "address": "Cairo Clinic",
      "rating": 4.6,
      "startDate": "10:00am",
      "endDate": "6:00pm",
      "imagePath": ImageAssets.fakeDoctorImage2,
    },
    {
      "name": "John Doe",
      "specialty": "Pediatrics",
      "address": "Health Center",
      "rating": 4.9,
      "startDate": "9:00am",
      "endDate": "5:00pm",
      "imagePath": ImageAssets.fakeDoctorImage3,
    },
  ];
}
