import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:widows_challenge/ui/screens/widows_data/widows_data_model.dart';

class WidowsDataView extends StatelessWidget {
  const WidowsDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WidowsDataModel>.reactive(
      viewModelBuilder: () => WidowsDataModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Widows Data',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 350,
                    ),
                    itemCount: viewModel.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.white,
                                  blurRadius: 7.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(7.0),
                            ),
                            child: Column(
                              children: [
                                Flexible(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(16.0),
                                        topRight: Radius.circular(16)),
                                    child: Image.network(
                                      '${viewModel.data[index]['image']}',
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Name',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${viewModel.data[index]['name']}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Date',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${viewModel.data[index]['date']}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Address',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${viewModel.data[index]['address']}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Flexible(
                                      child: Text(
                                        'Phone number',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        overflow: TextOverflow.ellipsis,
                                        '${viewModel.data[index]['phoneNumber']}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'State',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '${viewModel.data[index]['state']}',
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'view details',
                                          style: TextStyle(
                                              color: Color(0xff602BF8),
                                              fontWeight: FontWeight.w400),
                                        )),
                                    const Icon(
                                      Icons.chevron_right,
                                      color: Color(0xff602BF8),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
