import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/entities/chat_entity.dart';

import '../../../../core/helper/api_constants.dart';

@Injectable(as: ChatEntity)
class ChatModel extends ChatEntity {
  ChatModel({
    required super.id,
    required super.doctorId,
    required super.doctorName,
    required super.patientId,
    required super.isFavouriteDoctor,
    required super.patientName,
    super.createdAt,
    required super.unReadMessages,
    super.lastReadAt,
    required super.lastMessageContent,
    required super.isLastMessageSentByPatient,
    required super.img,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}') ?? 0,
      doctorId:
          json['doctorId']?.toString() ??
          json['doctor_id']?.toString() ??
          json['receiverId']?.toString() ??
          '',
      doctorName:
          json['doctorName']?.toString() ??
          json['doctor_name']?.toString() ??
          json['name']?.toString() ??
          '',
      patientId:
          json['patientId']?.toString() ?? json['patient_id']?.toString() ?? '',
      isFavouriteDoctor:
          json['isFavouriteDoctor'] ?? json['is_favourite_doctor'] ?? false,
      patientName:
          json['patientName']?.toString() ??
          json['patient_name']?.toString() ??
          '',
      createdAt:
          json['createdAt']?.toString() ?? json['created_at']?.toString(),
      unReadMessages: json['unReadMessages'] is int
          ? json['unReadMessages']
          : int.tryParse('${json['unReadMessages']}') ?? 0,
      lastReadAt:
          DateTime.tryParse(json['lastReadAt'].toString()) ??
          DateTime.tryParse(json['lastReadAt'].toString()),
      lastMessageContent:
          json['lastMessageContent']?.toString() ??
          json['last_message_content']?.toString() ??
          '',
      isLastMessageSentByPatient:
          json['isLastMessageSentByPatient'] ??
          json['is_last_message_sent_by_patient'] ??
          false,
      img:
          "${ApiConstant.baseUrl}${json['img'] ?? json['image']}", //"json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctorId': doctorId,
      'doctorName': doctorName,
      'patientId': patientId,
      'isFavouriteDoctor': isFavouriteDoctor,
      'patientName': patientName,
      'createdAt': createdAt,
      'unReadMessages': unReadMessages,
      'lastReadAt': lastReadAt,
      'lastMessageContent': lastMessageContent,
      'isLastMessageSentByPatient': isLastMessageSentByPatient,
      'img': img,
    };
  }

  static List<ChatModel> listFromJson(List<dynamic> json) =>
      json.map((e) => ChatModel.fromJson(e)).toList();
}
