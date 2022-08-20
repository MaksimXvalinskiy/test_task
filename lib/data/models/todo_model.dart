import 'package:test_app/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity{
  const TodoModel({
    required userId,
    required id,
    required title,
    required completed}):super(
    userId: userId,
    id: id,
    title: title,
    completed: completed
  );

  factory TodoModel.fromJSON(Map json){
    return TodoModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed']);
  }

  static toJSON(TodoEntity todoEntity){
    return{
      'userId': todoEntity.userId,
      'id': todoEntity.id,
      'title': todoEntity.title,
      'completed': todoEntity.completed
    };
  }
}