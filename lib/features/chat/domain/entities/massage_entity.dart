

class MessageEntity {
  final bool isPatient;
  String? content;
  final String senderUserId;
  String? mediaUrl;
  final String sentAt;
  final bool isRead;

  MessageEntity({
    required this.isPatient,
    this.content,
    required this.senderUserId,
    this.mediaUrl,
    required this.sentAt,
    required this.isRead,
  });
}

class ConversationEntity {
  int id;
  String image;
  String name;
  String senderId;
  String receiverId;
  List<MessageEntity> messageListDTO;

  ConversationEntity({
    required this.id,
    required this.image,
    required this.name,
    required this.senderId,
    required this.receiverId,
    required this.messageListDTO,
  });

}
 