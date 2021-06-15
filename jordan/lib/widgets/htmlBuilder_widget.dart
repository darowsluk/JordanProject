import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:jordan/extras/statics.dart';

class BuildHtml extends StatelessWidget {
  BuildHtml({
    Key key,
    this.data,
  }) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(8),
      child: HtmlWidget(
        data,
        customStylesBuilder: (element) {
          if (element.classes.contains('title')) {
            return {
              'color': 'orange',
            };
          }
          return null;
        },
        textStyle: TextStyle(fontSize: AppTextStyle.defaultTextSize),
      ),
    );
  }
}

/*
List<Widget> buildHtmlWidget({String data}) {
  List<Widget> htmlWidgets = [];
  if (data.isNotEmpty) {
    var i = 0;
    var parsedDocument = parse(data);
    // Iterate on the flat level only for now
    var myListIter = parsedDocument.body.children.iterator;
    while (myListIter.moveNext()) {
      switch (myListIter.current.toString()) {
        case "<html h1>":
          htmlWidgets.add(Text(
            myListIter.current.text,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.highlightText,
              fontSize: 22,
            ),
          ));
          break;
        case "<html h3>":
          htmlWidgets.add(Text(
            myListIter.current.text,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: AppColors.regularText,
              fontStyle: FontStyle.italic,
              fontSize: 18,
            ),
          ));
          break;
        case "<html div>":
          htmlWidgets.add(
            Text(
              myListIter.current.text,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: AppColors.regularText,
                fontStyle: FontStyle.normal,
                fontSize: 16,
                // letterSpacing: 2,
              ),
            ),
          );
          break;
        case "<html br>":
          htmlWidgets.add(Text(""));
          break;
        default:
          htmlWidgets.add(Text(""));
      }
      print(i++);
      print(myListIter.current.toString());
    }
    return htmlWidgets;
  } else {
    return null;
  }
}
*/
/*
void loop(final Iterable<int> list) {
  if (list.isNotEmpty) {
    print(list.first);
    loop(list.skip(1));
  }
}
*/
/*
parseData(){
  var document = parse("""
    <div class="weather-item now"><!-- now  -->
   <span class="time">Now</span>
   
    <div class="temp">19.8<span>℃</span>
        <small>(23℃)</small>
    </div>
   
   <table>
       <tr>
           <th><i class="icon01" aria-label="true"></i></th>
           <td>93%</td>
       </tr>
       <tr>
           <th><i class="icon02" aria-label="true"></i></th>
           <td>south 2.2km/h</td>
       </tr>
       <tr>
           <th><i class="icon03" aria-label="true"></i></th>
           <td>-</td>
       </tr>
   </table>
</div>
  """);

  //declaring a list of String to hold all the data.
  List<String> data = [];

  data.add(document.getElementsByClassName("time")[0].innerHtml);

  //declaring variable for temp since we will be using it multiple places
  var temp  = document.getElementsByClassName("temp")[0];
  data.add(temp.innerHtml.substring(0, temp.innerHtml.indexOf("<span>")));
  data.add(temp.getElementsByTagName("small")[0].innerHtml.replaceAll(RegExp("[(|)|℃]"), ""));

  //We can also do document.getElementsByTagName("td") but I am just being more specific here.
  var rows = document.getElementsByTagName("table")[0].getElementsByTagName("td");

  //Map elememt to its innerHtml,  because we gonna need it. 
  //Iterate over all the table-data and store it in the data list
  rows.map((e) => e.innerHtml).forEach((element) {
    if(element != "-"){
      data.add(element);
    }
  });

  //print the data to console.
  print(data);
  
}
*/
