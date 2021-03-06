import 'package:flutter/material.dart';
import 'package:letsdotest/models/project.dart';
import 'package:letsdotest/test/singletest.dart';
import 'package:provider/provider.dart';

class PagedTest extends StatefulWidget {
  PageController ctrl;

  @override
  _PagedTestState createState() => _PagedTestState();

  PageController getPageController() {
    return ctrl;
  }
  void setPageController(PageController c) {
    debugPrint("Imposto il page controller ${c}");
    ctrl = c;
  }
}

class _PagedTestState extends State<PagedTest> {
  PageController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = new PageController(
      initialPage: 0,
    );
    widget.setPageController(_ctrl);
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Selector<Project, int>(
        selector: (buildContext, prj) => prj.getCurrentTest().getNumDomande(),
        builder: (context, numDomande, child) {
        List<SingleTestWidget> widgetArray = [];
        for (int i = 0; i < numDomande; i++) {
          widgetArray.add(SingleTestWidget(i));
        }
        return Container(
          child: PageView(
            controller: _ctrl,
            children: widgetArray,
          ),
        );
      }
    );
  }
}
