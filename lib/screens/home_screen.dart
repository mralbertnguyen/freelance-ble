import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_third/index.dart';

//import 'package:flutter_sms/flutter_sms.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _title = "Trang chủ";

  bool isLoading = false;

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

  void _sendSMS(DeviceType device) async {
    String _messageContent =
        "${device.name}${device.isOn ? 'B' : 'T'}${device.isDelay ? '.${device.delayTime}' : ''}";

    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(milliseconds: 300), () {
      print("Message will send $_messageContent");

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    initDeviceData.clear();
    _device1TextController.dispose();
    _device2TextController.dispose();
    _device3TextController.dispose();
    _device4TextController.dispose();

    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarHome(_title),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            children: <Widget>[

              /// Title
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20 , left: 30, right: 30),
                child: Text("AT04 - GSM CONTROLLER",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold
                ),),
              ),

              /// Devices
              for (DeviceType device in listDevices)
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20 , left: 30, right: 30),
                  padding: EdgeInsets.only(top: 20, bottom: 20 , left: 30, right: 30),
                  decoration: BoxDecoration(
//                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Colors.amberAccent)),
                  child: Row(
                    children: <Widget>[
                      // TODO: Device name
                      Column(
                        children: <Widget>[
                          Text(
                            "Thiết bị ${device.name}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          // TODO: Button on off
                          Switch(
                            value: device.isOn,
                            onChanged: (value) {
                              setState(() {
                                device.isOn = value;
                                _sendSMS(device);
                              });
                            },
                            inactiveThumbColor: Colors.red,
                            activeTrackColor: Colors.lightGreenAccent,
                            activeColor: Colors.green,
                            inactiveTrackColor: Colors.red.withOpacity(0.5),
                          )
                        ],
                      ),

                      // TODO: Checkbox enable delay time
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          children: <Widget>[
                           SvgPicture.asset(icCalendar,
                             height: 20,
                             width: 20,),
                            Checkbox(
                              value: device.isDelay,
                              checkColor: Colors.white,
                              activeColor: Colors.black,
                              onChanged: (isChecked) {
                                setState(() {
                                  device.isDelay = isChecked;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      // TODO: Input delay time
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Text("0 ~ 9999", style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                              ),),
                              Container(
                                width: 200,
                                child: TextField(
                                  cursorColor: Colors.white,
                                  keyboardType: TextInputType.number,

                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.white, width: 3)
                                    ),
                                    disabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.grey, width: 2),
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: const BorderSide(color: Colors.white, width: 2),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.white),
                                    ),
                                    focusColor: Colors.white,

                                    contentPadding:
                                    EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  enabled: device.isDelay,
                                  controller: device.textController,
                                  onChanged: (v) {
                                    setState(() {
                                      device.delayTime = int.parse(v);
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
