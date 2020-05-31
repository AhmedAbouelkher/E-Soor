import 'package:E_Soor/services/api.dart';

class Message {
  final OldUser sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool isRead;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.isRead,
  });
}

final OldUser currentUser = OldUser(
  name: 'Omar Yehia',
  username: 'OmarYehiaDev',
  password: '1a3456',
  profileImage:
      'https://drive.google.com/open?id=1Wcu5LK6xGHUMqVdil8H0A3I0pf18528q',
  id: 0,
);
final OldUser greg = OldUser(
  name: 'Greg Watson',
  username: 'gRegwat?',
  password: 'gW6son',
  profileImage: 'https://randomuser.me/api/portraits/men/49.jpg',
  id: 1,
);
final OldUser bravestone = OldUser(
  name: 'Doctor Bravestone',
  username: 'BraveSTONE',
  password: 'rockets',
  profileImage: 'https://randomuser.me/api/portraits/men/8.jpg',
  id: 2,
);
final OldUser ashley = OldUser(
  name: 'Ashley Lamar',
  username: 'SisterOfKendric',
  password: 'davidGuette1',
  profileImage: 'https://randomuser.me/api/portraits/women/51.jpg',
  id: 3,
);
final OldUser harry = OldUser(
  name: 'Harry Potter',
  username: 'thePotter',
  password: 'ginnyWeasley1',
  profileImage: 'https://randomuser.me/api/portraits/men/60.jpg',
  id: 4,
);
final OldUser lily = OldUser(
  name: 'Lilian Piaf',
  username: 'liliPiaf',
  password: 'edithPiaf4',
  profileImage: 'https://randomuser.me/api/portraits/women/49.jpg',
  id: 5,
);
final OldUser lona = OldUser(
  name: 'Lona Fox',
  username: 'Lovnox',
  password: 'Lonafoxxy5',
  profileImage: 'https://randomuser.me/api/portraits/women/4.jpg',
  id: 6,
);
List<OldUser> favorites = [lily, harry, greg, bravestone];
List<Message> chats = [
  Message(
    sender: greg,
    time: '4:37 PM',
    text: 'Hey, how r u man?',
    isLiked: false,
    isRead: true,
  ),
  Message(
    sender: ashley,
    text: 'Let\'s meet today at the cafe :"D',
    time: '2:12 PM',
    isLiked: true,
    isRead: true,
  ),
  Message(
    sender: harry,
    text: 'What about wandring this evening? another bla bla bl',
    time: '10:02 AM',
    isLiked: false,
    isRead: false,
  ),
  Message(
    sender: lily,
    text: 'Wanna hear ma new song?',
    time: '3:40 AM',
    isLiked: false,
    isRead: false,
  ),
  Message(
    sender: bravestone,
    text: 'I wanna smash some heads',
    time: '7:06 PM',
    isLiked: false,
    isRead: true,
  ),
  Message(
    sender: lona,
    text: 'I wanna play tonight ;D',
    time: '11:43 PM',
    isLiked: true,
    isRead: false,
  ),
];
List<Message> messages = [
  Message(
    sender: greg,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    isRead: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Just walked my doge. She was super duper cute. The best pupper!!',
    isLiked: false,
    isRead: true,
  ),
  Message(
    sender: greg,
    time: '3:45 PM',
    text: 'How\'s the doggo?',
    isLiked: false,
    isRead: true,
  ),
  Message(
    sender: greg,
    time: '3:15 PM',
    text: 'All the food',
    isLiked: true,
    isRead: true,
  ),
  Message(
    sender: currentUser,
    time: '2:30 PM',
    text:
        'Nice! What kind of food did you eat today tomorrow after tomorrwo hello evereyone this E-soor it is very amazing and unique and got to hell everyoune smash the heAD?',
    isLiked: false,
    isRead: true,
  ),
  Message(
    sender: greg,
    time: '2:00 PM',
    text: 'I ate so much food today.',
    isLiked: false,
    isRead: true,
  ),
];
