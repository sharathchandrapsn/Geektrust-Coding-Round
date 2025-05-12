class ToDoModel{
  int? id;
  String? name;
  ToDoModel({this.id, this.name});

  @override
  String toString(){
    return "ToDoModel(id: $id, name: $name)";
  }
}