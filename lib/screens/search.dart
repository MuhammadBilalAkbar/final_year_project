import 'package:final_year_project/screens/bookings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../maps/location_current.dart';
import '../providers/users.dart';
import '../maps/place.dart';

class Search extends StatefulWidget {
  final double lat;
  final double long;
  final String type;
  final String address;
  final String description;
  final String username;
  final String phoneNumber;
  final String authToken;
  final String userId;

  Search({
    super.key,
    required this.lat,
    required this.long,
    required this.type,
    required this.address,
    required this.description,
    required this.username,
    required this.userId,
    required this.authToken,
    required this.phoneNumber,
  });

  // static const routeName = '/search';
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  PlaceLocation? _pickedLocation;

  void _selectPlace(double lat, double long) {
    _pickedLocation = PlaceLocation(latitude: lat, longitude: long);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Searching'),
      ),
      body: Container(
        color: Colors.blue[900],
        child: Column(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height) * 0.2,
              decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage('images/splash1.png'),
                    fit: BoxFit.contain),
              ),
            ),
            //SizedBox(height: 30),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 8.0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.67,
                //constraints: BoxConstraints(minHeight: 260),
                width: double.infinity,
                padding: EdgeInsets.all(1.0),
                child: Form(
                  // key: _formKey,
                  child: Column(
                    children: <Widget>[
                      CurrentLocation(_selectPlace),
                      Expanded(
                        child: ListView.builder(
                          itemCount: user.sortedtechnicians.length,
                          itemBuilder: (ctx, i) => Column(children: <Widget>[
                            ListTile(
                              title: Text(user.sortedtechnicians[i].fullName),
                              subtitle:
                                  Text(user.sortedtechnicians[i].techtype),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(user.sortedtechnicians[i].distance
                                          .toString() +
                                      "  KM"),
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Text(user.sortedtechnicians[i].arating
                                          .toString()),
                                      Icon(Icons.star),
                                    ],
                                  )
                                  // Text(user.sortedtechnicians[i].arating.toString() + Icons.star)
                                ],
                              ),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text('Job Request'),
                                          content: Text(
                                              'Do You Want to send technician a job request?'),
                                          actions: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextButton(
                                                  child: Text('Yes'),
                                                  onPressed: () {
                                                    user.addUJobData(
                                                      address: widget.address,
                                                      authToken:
                                                          widget.authToken,
                                                      description:
                                                          widget.description,
                                                      fullName: widget.username,
                                                      phoneNumber:
                                                          widget.phoneNumber,
                                                      lat: widget.lat,
                                                      long: widget.long,
                                                      techId: user
                                                          .sortedtechnicians[i]
                                                          .id,
                                                      techName: user
                                                          .sortedtechnicians[i]
                                                          .fullName,
                                                      techNumber: user
                                                          .sortedtechnicians[i]
                                                          .phoneNumber,
                                                      type: widget.type,
                                                      userId: widget.userId,
                                                    );
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  title: Text(
                                                                      'Job Request'),
                                                                  content: Text(
                                                                      'Request Sent'),
                                                                  actions: <Widget>[
                                                                    TextButton(
                                                                      child: Text(
                                                                          'Okay'),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                BookingsScreen()));
                                                                      },
                                                                    )
                                                                  ],
                                                                ));
                                                  },
                                                ),
                                                TextButton(
                                                  child: Text('No'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        ));
                                // Navigator.of(context).pushNamed(
                                //   PlaceDetailScreen.routeName,
                                //   arguments: greatPlaces.items[i].id,
                                // );
                              },
                            ),
                            Divider(),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
