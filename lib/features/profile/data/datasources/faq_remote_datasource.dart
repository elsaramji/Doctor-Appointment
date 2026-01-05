import 'package:injectable/injectable.dart';
import '../../../../core/helper/api_constants.dart';
import '../../../../core/helper/dio_helper.dart';
import '../models/faq_model.dart';

abstract class FaqRemoteDataSource {
  Future<List<FaqModel>> getFaqs(String token);
}

@LazySingleton(as: FaqRemoteDataSource)
class FaqRemoteDataSourceImpl implements FaqRemoteDataSource {
  final DioHelper dioHelper;

  FaqRemoteDataSourceImpl(this.dioHelper);

  @override
  Future<List<FaqModel>> getFaqs(String token) async {
    final response = await dioHelper.getRequest(
      ApiConstant.faq,
    );

    if (response?.statusCode == 200 && response?.data['success'] == true) {
      final List data = response!.data['data'];
      return data.map((faq) => FaqModel.fromJson(faq)).toList();
    } else {
      throw Exception('Failed to load FAQs');
    }
  }
}
