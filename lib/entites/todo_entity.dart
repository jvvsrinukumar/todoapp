

class ToDo {

    ToDo({
        required this.date,
        required this.taskDesc,
        required this.taskName,
    });

    String date;
    String taskDesc;
    String taskName;

    factory ToDo.fromJson(Map<String, dynamic> json) => ToDo(
        date: json["date"],
        taskDesc: json["taskDesc"],
        taskName: json["taskName"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "taskDesc": taskDesc,
        "taskName": taskName,
    };
}