class User{
  int id;
  String description, date;

  User({this.id,this.description, this.date});
  //conver user to json
  Map<String, dynamic> toMap() => {
    'id': id,
    'description': description,
    'date': date,
  };  

  //extract json to user
  factory User.fromMap(Map<String, dynamic> maps) => new User(
    id: maps['id'],
    description: maps['description'],
    date: maps['date'],
  );
}