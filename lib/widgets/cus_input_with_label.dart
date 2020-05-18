import 'package:the_third/index.dart';

typedef OnValidator(String value);

class CusInputWithLabel extends StatefulWidget {
  final String label;
  final TextEditingController textEditingController;
  final OnValidator onValidator;
  final TextInputType keyboardType;
  final bool isSecure;
  CusInputWithLabel(
      {@required this.label,
      @required this.textEditingController,
      @required this.keyboardType,
      @required this.onValidator,
      this.isSecure});

  @override
  _CusInputWithLabelState createState() => _CusInputWithLabelState();
}

class _CusInputWithLabelState extends State<CusInputWithLabel> {
  bool _isSecure = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isSecure = widget.isSecure ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                widget.label,
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),

          /// Input password number
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextFormField(
              controller: widget.textEditingController,
              keyboardType: widget.keyboardType,
              obscureText: this._isSecure ?? false,
              cursorColor: Colors.amber,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.black),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.amber, width: 2)),
                disabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.amber, width: 1),
                ),
                border: OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.red),
                ),
                focusColor: Colors.black,
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _isSecure ?? false
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: mainColor,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _isSecure = !_isSecure ?? false;
                    });
                  },
                ),
              ),
              validator: widget.onValidator,
            ),
          ),
        ],
      ),
    );
  }
}
