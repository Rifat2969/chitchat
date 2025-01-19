class User {
  int? id;
  String? name;
  String? email;
  String? avatar;
  String? profession;

  User({this.id, this.name, this.email, this.avatar, this.profession});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    profession = json['profession'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['avatar'] = avatar;
    map['profession'] = profession;
    return map;
  }
}

List<User> ALL_USERS = [
  User(
    id: 1,
    name: 'JohnDoe',
    email: 'johndoe@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/1.jpg',
    profession: 'Software Engineer',
  ),
  User(
    id: 2,
    name: 'JaneSmith',
    email: 'janesmith@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/2.jpg',
    profession: 'Doctor',
  ),
  User(
    id: 3,
    name: 'AliceJohnson',
    email: 'alicejohnson@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/3.jpg',
    profession: 'Designer',
  ),
  User(
    id: 4,
    name: 'BobBrown',
    email: 'bobbrown@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/4.jpg',
    profession: 'Teacher',
  ),
  User(
    id: 5,
    name: 'CathyGreen',
    email: 'cathygreen@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/5.jpg',
    profession: 'Architect',
  ),
  User(
    id: 6,
    name: 'DavidWhite',
    email: 'davidwhite@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/6.jpg',
    profession: 'Lawyer',
  ),
  User(
    id: 7,
    name: 'EmmaBlack',
    email: 'emmablack@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/7.jpg',
    profession: 'Writer',
  ),
  User(
    id: 8,
    name: 'FrankGray',
    email: 'frankgray@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/8.jpg',
    profession: 'Artist',
  ),
  User(
    id: 9,
    name: 'GraceGold',
    email: 'gracegold@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/9.jpg',
    profession: 'Engineer',
  ),
  User(
    id: 10,
    name: 'HenrySilver',
    email: 'henrysilver@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/0.jpg',
    profession: 'Scientist',
  ),
  User(
    id: 11,
    name: 'IvyBlue',
    email: 'ivyblue@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/1.jpg',
    profession: 'Photographer',
  ),
  User(
    id: 12,
    name: 'JackPurple',
    email: 'jackpurple@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/2.jpg',
    profession: 'Musician',
  ),
  User(
    id: 13,
    name: 'KarenRed',
    email: 'karenred@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/3.jpg',
    profession: 'Chef',
  ),
  User(
    id: 14,
    name: 'LeoYellow',
    email: 'leoyellow@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/4.jpg',
    profession: 'Mechanic',
  ),
  User(
    id: 15,
    name: 'MiaPink',
    email: 'miapink@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/5.jpg',
    profession: 'Pilot',
  ),
  User(
    id: 16,
    name: 'NickOrange',
    email: 'nickorange@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/6.jpg',
    profession: 'Nurse',
  ),
  User(
    id: 17,
    name: 'OliviaViolet',
    email: 'oliviaviolet@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/7.jpg',
    profession: 'Developer',
  ),
  User(
    id: 18,
    name: 'PaulIndigo',
    email: 'paulindigo@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/8.jpg',
    profession: 'Consultant',
  ),
  User(
    id: 19,
    name: 'QuinnCyan',
    email: 'quinncyan@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/9.jpg',
    profession: 'Entrepreneur',
  ),
  User(
    id: 20,
    name: 'RubyScarlet',
    email: 'rubyscarlet@example.com',
    avatar: 'https://randomuser.me/api/portraits/lego/0.jpg',
    profession: 'Marketing Manager',
  ),
];
