import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widows_challenge/core/Models/widows_Data/widows_card_model.dart';

import '../screens/widows_data/widows_data_model.dart';

class BankDetails extends StatelessWidget {
  WidowsDataModel widowsDataModel;
  final WidowsCard selectedWidow;
  BankDetails({
    super.key,
    required this.selectedWidow,
    required this.widowsDataModel,
  });

  @override
  Widget build(BuildContext context) {
    final formattedregDate =
        DateFormat('yyyy-MM-dd').format(selectedWidow.registrationDate);
    return FutureBuilder(
      future: widowsDataModel.fetchCardData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Account Number',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.accountNumber.toString(),
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
                      'Bank Name',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.bankName ?? "Unknown",
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
                      'NgoMembership',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.ngoMembership ?? "Unknown",
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
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Ngo Name',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Flexible(
                    child: Text(
                      selectedWidow.ngoName ?? "Unknown",
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
                      'Received By',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      selectedWidow.receivedBy ?? "Unknown",
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
                      'Registration Date',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      formattedregDate,
                      style: const TextStyle(
                          color: Color(0XFF656565), fontSize: 14),
                    ),
                  )
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
