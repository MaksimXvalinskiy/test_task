import 'package:equatable/equatable.dart';
class TodoEntity extends Equatable{
  final double userId;
  final double id;
  final String title;
  final bool completed;
  const TodoEntity({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed
  });
  @override
  List<Object?> get props => [
    userId,
    id,
    title,
    completed
  ];
}