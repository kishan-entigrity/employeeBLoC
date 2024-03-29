import 'package:flutter/material.dart';
import 'Employee.dart';
import 'EmployeeBlock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final EmployeeBloc _employeeBloc = EmployeeBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    _employeeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee App Bloc'),
      ),
      body: Container(
        child: StreamBuilder<List<Employee>>(
          stream: _employeeBloc.employeeListStream,
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "${snapshot.data![index].id}",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "${snapshot.data![index].name}",
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "₹ ${snapshot.data![index].salary}",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          // builder: (BuildContext context, AsyncSnapshot<int> snapshot) {},
          /*builder: (BuildContext context, AsyncSnapshot<List<Employee>> snapshot)
          {
            */ /*return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){}),*/ /*
          },*/
        ),
      ),
    );
  }
}
