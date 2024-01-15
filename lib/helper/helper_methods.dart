import 'dart:convert';

class Helper {
  static String encodeData(Map<String, dynamic> data) {
    return jsonEncode(data);
  }

  static String formatPostDate(DateTime inputDate) {
    // Parse the input date string
    // DateTime postDate = DateTime.parse(inputDate);

    // Get the current date and time
    DateTime now = DateTime.now();

    // Calculate the difference in time
    Duration difference = now.difference(inputDate);

    if (difference.inDays >= 7) {
      // If more than a week, format as "x weeks ago"
      return '${(difference.inDays / 7).floor()} week${(difference.inDays / 7).floor() > 1 ? 's' : ''} ago';
    } else if (difference.inDays >= 1) {
      // If more than a day, format as "x days ago"
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours >= 1) {
      // If more than an hour, format as "x hours ago"
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes >= 1) {
      // If more than a minute, format as "x minutes ago"
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      // If less than a minute, format as "just now"
      return 'just now';
    }
  }
}
