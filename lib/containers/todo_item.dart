class Todo {
  // final로 정의된 필드는 선언단계나 생성자를 통해 초기화해야함
  final String title;
  final String description;

  Todo(this.title, this.description); // 생성자로 필드 초기화
}