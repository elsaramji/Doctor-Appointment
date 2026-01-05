import 'package:injectable/injectable.dart';

@injectable
class GetAvailableSlotsByDateUseCase {
  Map<String, List<Map<String, dynamic>>> call(List<Map<String, dynamic>> slots) {
    final Map<String, List<Map<String, dynamic>>> slotsByDate = {};

    for (var slot in slots) {
      try {
        if (slot['isBooked'] == true) continue;

        final String? dateIso = slot['date'] as String?;
        final String? startTime = slot['startTime'] as String?;
        final String? endTime = slot['endTime'] as String?;
        final int? slotId = slot['slotId'] as int?;

        if (dateIso == null || startTime == null || endTime == null || slotId == null) {
          continue;
        }

        final date = dateIso.split('T')[0];

        final startParts = startTime.split(':');
        final endParts = endTime.split(':');

        if (startParts.length < 2 || endParts.length < 2) continue;

        final dateParts = date.split('-');

        DateTime startDateTime = DateTime(
          int.parse(dateParts[0]),
          int.parse(dateParts[1]),
          int.parse(dateParts[2]),
          int.parse(startParts[0]),
          int.parse(startParts[1]),
        );

        DateTime endDateTime = DateTime(
          int.parse(dateParts[0]),
          int.parse(dateParts[1]),
          int.parse(dateParts[2]),
          int.parse(endParts[0]),
          int.parse(endParts[1]),
        );

        if (!endDateTime.isAfter(startDateTime)) continue;

        List<String> availableTimes = _getTimesBetween(startDateTime, endDateTime);

        slotsByDate.putIfAbsent(date, () => []);

        for (var t in availableTimes) {
          slotsByDate[date]!.add({
            "time": t,
            "slotId": slotId,
          });
        }

      } catch (e) {
        continue;
      }
    }

    return slotsByDate;
  }

  List<String> _getTimesBetween(DateTime start, DateTime end) {
    List<String> times = [];
    DateTime temp = start;

    while (temp.isBefore(end)) {
      times.add(
        "${temp.hour.toString().padLeft(2, '0')}:${temp.minute.toString().padLeft(2, '0')}",
      );
      temp = temp.add(const Duration(minutes: 30));
    }

    return times;
  }
}
