import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class ViewHasLoading extends StatefulWidget {
   bool isLoading;
  final Widget childrenWidget;
  final Widget appBar;
  final Color loadingColor;

 ViewHasLoading({@required this.isLoading, @required this.loadingColor, @required this.childrenWidget, this.appBar}) : assert(childrenWidget != null);

  @override
  _ViewHasLoadingState createState() => _ViewHasLoadingState();
}

class _ViewHasLoadingState extends State<ViewHasLoading> {
  bool _isLoading ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _isLoading = widget.isLoading;
    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: null,
      body: Builder(
        builder: (context) {
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: IndexedStack(
                index: 1,
                children: <Widget>[
                  widget.childrenWidget,
                  if(widget.isLoading) _loadingAnim(widget.loadingColor)
                ],
              ),
            ),
          );
        },
      ),
    );
  }



  Widget _loadingAnim(Color _color){
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: SpinKitCircle(
        color: _color,
        size: 50.0,
      ),
    );
  }

}
