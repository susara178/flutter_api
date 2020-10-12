


class Band{
 String id;
  String name;
  int votes;

  Band({
    this.id,
    this.name,
    this.votes,

  });
  
  factory Band.formMap(Map<String, dynamic> obj)
  => Band(
    id: obj['name'],
    votes: obj['votes']
    );
  


}