import 'package:chit_chat/Model/user.dart';

class ChatBuddy {
  int? id;
  User? user;
  String? message;
  String? date;
  int? timeInSec;

  ChatBuddy({this.id, this.timeInSec, this.user, this.message});

  ChatBuddy.fromJson(json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    message = json['msg'];
    timeInSec = json['time_in_sec'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (user != null) map['user'] = user?.toJson();
    map['msg'] = message;
    map['time_in_sec'] = timeInSec;
    return map;
  }
}

List<ChatBuddy> CHAT_BUDDIES = [
  ChatBuddy(id: 1, user: ALL_USERS[0], message: "Hey, how's it going?", timeInSec: 32851),
  ChatBuddy(id: 2, user: ALL_USERS[1], message: 'Just finished a project!', timeInSec: 42921),
  ChatBuddy(id: 3, user: ALL_USERS[2], message: 'Can we meet later?', timeInSec: 30012),
  ChatBuddy(id: 4, user: ALL_USERS[3], message: 'I had a great weekend!', timeInSec: 62548),
  ChatBuddy(id: 5, user: ALL_USERS[4], message: 'Working on something exciting!', timeInSec: 48101),
  ChatBuddy(id: 6, user: ALL_USERS[5], message: 'Looking forward to our next meeting.', timeInSec: 19802),
  ChatBuddy(id: 7, user: ALL_USERS[6], message: "Hope you're doing well!", timeInSec: 67321),
  ChatBuddy(id: 8, user: ALL_USERS[7], message: 'Catch up later?', timeInSec: 47290),
  ChatBuddy(id: 9, user: ALL_USERS[8], message: "What's up?", timeInSec: 54300),
  ChatBuddy(id: 10, user: ALL_USERS[9], message: 'Got any plans for tonight?', timeInSec: 10234),
  ChatBuddy(id: 11, user: ALL_USERS[10], message: 'How can I help you today?', timeInSec: 28132),
  ChatBuddy(id: 12, user: ALL_USERS[11], message: 'Exciting times ahead!', timeInSec: 30013),
  ChatBuddy(id: 13, user: ALL_USERS[12], message: "Let's collaborate!", timeInSec: 47023),
  ChatBuddy(id: 14, user: ALL_USERS[13], message: "I'll send the details over.", timeInSec: 53821),
  ChatBuddy(id: 15, user: ALL_USERS[14], message: 'Can we reschedule?', timeInSec: 27190),
  ChatBuddy(id: 16, user: ALL_USERS[15], message: 'Any updates on the project?', timeInSec: 48132),
  ChatBuddy(id: 17, user: ALL_USERS[16], message: 'Thanks for the heads up!', timeInSec: 30213),
  ChatBuddy(id: 18, user: ALL_USERS[17], message: 'Happy to help!', timeInSec: 50832),
  ChatBuddy(id: 19, user: ALL_USERS[18], message: "I'm wrapping up this task.", timeInSec: 67120),
  ChatBuddy(id: 20, user: ALL_USERS[19], message: "Let's catch up tomorrow.", timeInSec: 22819),
];
