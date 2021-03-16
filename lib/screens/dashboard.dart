import 'package:flutter/material.dart';
import 'package:flutter_astrology/model/model.dart';
// import 'package:flutter_astrology/widget/date_picker.dart';
import 'package:flutter_astrology/widget/main_view.dart';
import 'package:intl/intl.dart';
// import 'package:intl/intl.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  DateTime selectedDate = DateTime.now();
  DateTime pickedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AS-Trology'),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today_rounded),
              onPressed: () => _selectDate(context),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FutureBuilder(
                      future: getData(
                        formatDate(selectedDate),
                      ),
                      // ignore: missing_return
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Container(
                            height: 600,
                            child: Center(
                              child: Text(
                                'No data to show'.toUpperCase(),
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error'),
                          );
                        } else if (snapshot.hasData) {
                          return Column(
                            children: [
                              MainView(
                                snapshot.data.title,
                                snapshot.data.imageUrl,
                                snapshot.data.explanation,
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.purpleAccent,
                  child: TextButton(
                    onPressed: () async {
                      print('Getting Data when Tapping');
                      // await getData();
                      setState(() {
                        // selectedDate = pickedDate;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Find',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != selectedDate)
      selectedDate = pickedDate;
    // print(DateFormat('yyyy-mm-dd').parse(pickedDate));
  }

  formatDate(date) {
    print(date.toString());
//  final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    print(formatted);
    return formatted;
  }
}
