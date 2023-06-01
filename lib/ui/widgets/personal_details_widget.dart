import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/Models/widows_Data/widows_card_model.dart';
import '../screens/widows_data/widows_data_model.dart';

class PersonalScreen extends StatelessWidget {
  WidowsDataModel widowsDataModel;
  final WidowsCard selectedWidow;
  PersonalScreen(
      {super.key, required this.selectedWidow, required this.widowsDataModel});

  @override
  Widget build(BuildContext context) {
    final formattedDOB = DateFormat('yyyy-MM-dd').format(selectedWidow.dob);

    return FutureBuilder(
      future: widowsDataModel.fetchCardData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: ClipOval(
                    child: Image.network(
                      selectedWidow.image!,
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Name',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.fullName!,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Date of birth',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      formattedDOB.toString(),
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Address',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.address!,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Phone Number',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.phoneNumber!,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'State',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.state!,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'HomeTown',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.homeTown!,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Local government',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.lga!,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text('Other Personal Details',
                    style: TextStyle(color: Color(0xff602BF8), fontSize: 16)),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Husband Name',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.husbandName!,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Occupation',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      selectedWidow.occupation!,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Year of Marriage',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      selectedWidow.yearOfMarriage.toString(),
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Date of Husband Death',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      selectedWidow.husbandBereavementDate!,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Number of children',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.numberOfChildren.toString(),
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Senetorial district',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.senatorialZone!,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Categories Based on need',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.categoryBasedOnNeeds!,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
              const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 7),
                  child: Divider(
                    thickness: 1,
                  )),
            ],
          );
        }
      },
    );
  }
}
