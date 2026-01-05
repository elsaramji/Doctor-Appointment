
class ChatEntity {
  final int id;
  final String doctorId;
  final String doctorName;
  final String patientId;
  final bool isFavouriteDoctor;
  final String patientName;
  String? createdAt; // Note: call back end to get this.
  final int unReadMessages;
  DateTime? lastReadAt;
  final String lastMessageContent;
  final bool isLastMessageSentByPatient;
  final String img;

  ChatEntity({
    required this.id,
    required this.doctorId,
    required this.doctorName,
    required this.patientId,
    required this.isFavouriteDoctor,
    required this.patientName,
    this.createdAt,
    required this.unReadMessages,
    this.lastReadAt,
    required this.lastMessageContent,
    required this.isLastMessageSentByPatient,
    required this.img,
  });
}
