import 'package:the_third/index.dart';

class DeviceType {
  String name;
  bool isOn;
  bool isDelay;
  int delayTime;
  TextEditingController textController;

  DeviceType(
      {@required this.name,
      @required this.isOn,
      @required this.textController,
      this.isDelay,
      this.delayTime})
      : assert(name != null),
        assert(isOn != null),
        assert(textController != null);

  DeviceType.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    isOn = json["is_on"];
    isDelay = json["is_delay"];
    delayTime = json["delay_time"];
    textController = json["text_controller"];
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "is_on": isOn,
        "is_delay": isDelay,
        "delay_time": delayTime,
        "text_controller": textController
      };
}
