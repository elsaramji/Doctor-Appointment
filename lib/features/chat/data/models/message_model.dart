import 'package:injectable/injectable.dart';
import 'package:round_7_mobile_cure_team4/core/helper/api_constants.dart';
import 'package:round_7_mobile_cure_team4/features/chat/domain/entities/massage_entity.dart';

@Injectable(as: ConversationEntity)
class ConversationModel extends ConversationEntity {
  ConversationModel({
    required super.id,
    required super.image,
    required super.name,
    required super.senderId,
    required super.receiverId,
    required super.messageListDTO,
  });

  factory ConversationModel.fromJson(Map<String, dynamic> json) {
    return ConversationModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      messageListDTO: json['messageListDTO'],
    );
  }
}

@Injectable(as: MessageEntity)
class MessageModel extends MessageEntity {
  MessageModel({
    required super.isPatient,
    required super.senderUserId,
    required super.sentAt,
    required super.isRead,
    super.content,
    super.mediaUrl,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      isPatient: json['isPatient'],
      content: json['content'],
      mediaUrl: json['mediaUrl'] != null
          ? "${ApiConstant.baseUrl}${json['mediaUrl']}"
          : null,
      senderUserId: json['senderUserId'],
      sentAt: json['sentAt'],
      isRead: json['isRead'],
    );
  }

  toJson() => {
    'isPatient': isPatient,
    'senderUserId': senderUserId,
    'sentAt': sentAt,
    'isRead': isRead,
    'content': content,
    'mediaUrl': mediaUrl,
  };

  static List<MessageModel> listFromJson(List<dynamic> json) =>
      json.map((e) => MessageModel.fromJson(e)).toList();
}
