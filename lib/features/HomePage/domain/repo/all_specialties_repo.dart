import 'package:round_7_mobile_cure_team4/features/HomePage/domain/Entities/allSpecialtiesEntity.dart';

abstract class AllSpecialtiesRepo {
  Future<List<AllSpecialtiesEntity?>> getAllSpecialties();
}
