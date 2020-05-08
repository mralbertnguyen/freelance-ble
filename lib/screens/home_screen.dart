import 'package:the_third/index.dart';

//import 'package:flutter_sms/flutter_sms.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _title = "Trang chủ";

  static TextEditingController _device1TextController =
      new TextEditingController();
  static TextEditingController _device2TextController =
      new TextEditingController();
  static TextEditingController _device3TextController =
      new TextEditingController();
  static TextEditingController _device4TextController =
      new TextEditingController();

  static var initDeviceData = [
    {
      "name": "1",
      "is_on": false,
      "is_delay": false,
      "delay_time": 0,
      "text_controller": _device1TextController
    },
    {
      "name": "2",
      "is_on": false,
      "is_delay": false,
      "delay_time": 0,
      "text_controller": _device2TextController
    },
    {
      "name": "3",
      "is_on": false,
      "is_delay": false,
      "delay_time": 0,
      "text_controller": _device3TextController
    },
    {
      "name": "4",
      "is_on": false,
      "is_delay": false,
      "delay_time": 0,
      "text_controller": _device4TextController
    }
  ];

  static List<DeviceType> listDevices =
      initDeviceData.map((i) => DeviceType.fromJson(i)).toList();

  DeviceType _deviceTest = listDevices.first;

  _sendSms(String deviceName, String status, int delayTime) async {
    print("Device: $deviceName - Status:$status - Delay time: $delayTime");

    String _messageContent = "";

//    String _result =
//        await sendSMS(message: _messageContent, recipients: [PHONE_NUMBER])
//            .catchError((onError) {
//      print(onError);
//    });

//    print(_result);
  }

  void _sendSMS(String message, List<String> recipents) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarHome(_title),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: <Widget>[
              for (DeviceType device in listDevices)
                Row(
                  children: <Widget>[
                    // TODO: Device name
                    Text(
                      "Thiết bị ${device.name}: ",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    // TODO: Button on off
                    Switch(
                      value: device.isOn,
                      onChanged: (value) {
                        setState(() {
                          device.isOn = value;
                          print("Device is on ${device.isOn}");
                        });
                      },
                      inactiveThumbColor: Colors.red,
                      activeTrackColor: Colors.lightGreenAccent,
                      activeColor: Colors.green,
                    ),

                    // TODO: Checkbox enable delay time
                    Checkbox(
                      value: device.isDelay,
                      onChanged: (isChecked) {
                        setState(() {
                          device.isDelay = isChecked;
                        });
                      },
                    ),

                    // TODO: Input delay time
                    if (device.isDelay)
                      Container(
                        height: 50,
                        width: 100,
                        child: TextField(
                          controller: _device1TextController,
                          decoration: InputDecoration(),
                          onChanged: (v) {
                            setState(() {
                              device.delayTime = int.parse(v);
                            });
                          },
                        ),
                      ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
