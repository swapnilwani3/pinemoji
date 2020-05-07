import 'package:flutter/cupertino.dart';
import 'package:pinemoji/widgets/health-widget.dart';

class HealthWidgetController extends StatefulWidget {
  final String questionId;
  final Map<String, String> resultMap;
  final List<HealthStatusModel> healthStatusModelList;

  const HealthWidgetController({Key key, this.healthStatusModelList, this.resultMap, this.questionId}) : super(key: key);
  @override
  _HealthWidgetControllerState createState() => _HealthWidgetControllerState();
}

class _HealthWidgetControllerState extends State<HealthWidgetController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: answerList(widget.healthStatusModelList),
    );
  }

  List<Widget> answerList(List<HealthStatusModel> healthStatusModelList) {
    if (widget.resultMap != null) {
      healthStatusModelList.forEach((healthModelWidget) {
        if (healthModelWidget.text == widget.resultMap[widget.questionId] || healthModelWidget.hintText != null) {
          healthModelWidget.isActive = true;
        }
      });
    }
    List<Widget> widgetList = healthStatusModelList.map((healthModelWidget) {
      return Padding(
        padding: const EdgeInsets.all(0),
        child: GestureDetector(
          onTap: () {
            for (var current in healthStatusModelList) current.isActive = false;
            setState(() {
              widget.resultMap[widget.questionId] = healthModelWidget.text;
              healthModelWidget.isActive = true;
            });
          },
          child: HealthStatusContent(
            healthStatusModel: healthModelWidget,
            textEdtingCompleted: (text) {
              widget.resultMap[widget.questionId] = text;
            },
          ),
        ),
      );
    }).toList();
    return widgetList;
  }
}
