import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:widows_challenge/ui/screens/personal/personal_details_view.dart';
import 'package:widows_challenge/ui/screens/widows_data/widows_data_model.dart';
import '../../../core/Models/widows_Data/widows_card_model.dart';

class WidowsDataView extends StatelessWidget {
  const WidowsDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WidowsDataModel>.reactive(
      viewModelBuilder: () => WidowsDataModel(),
      onViewModelReady: (viewModel) => viewModel.fetchCardData(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                FutureBuilder(
                    future: viewModel.fetchCardData(),
                    builder: (context, snapshot) {
                      bool isLoading =
                          snapshot.connectionState == ConnectionState.waiting;
                      return Expanded(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                const Center(
                                  child: Text(
                                    'Widows Data',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Expanded(
                                  child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 12.0,
                                      mainAxisSpacing: 12,
                                      mainAxisExtent: 300,
                                    ),
                                    itemCount: viewModel.widowsCard.length,
                                    itemBuilder: (context, index) {
                                      WidowsCard card =
                                          viewModel.widowsCard[index];
                                      final formattedDOB =
                                          DateFormat('yyyy-MM-dd')
                                              .format(card.dob);
                                      return GestureDetector(
                                        onTap: isLoading
                                            ? () {}
                                            : () {
                                                viewModel.selectedWidow = card;
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          PersonalDetailsScreen(
                                                        widowsDataModel:
                                                            viewModel,
                                                      ),
                                                    ));
                                              },
                                        child: Card(
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
                                                borderRadius:
                                                    BorderRadius.circular(7.0),
                                              ),
                                              child: Column(
                                                children: [
                                                  Flexible(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      16.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      16)),
                                                      child: isLoading
                                                          ? Image.asset(
                                                              'asset/images/loading.png')
                                                          : Image.network(
                                                              card.image!,
                                                            ),
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        'Name',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const Spacer(),
                                                      Flexible(
                                                        child: isLoading
                                                            ? const Text(
                                                                'loading')
                                                            : Text(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                card.fullName!,
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            16),
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Dob',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const Spacer(),
                                                      Flexible(
                                                        child: isLoading
                                                            ? const Text(
                                                                'loading')
                                                            : Text(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                formattedDOB
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            16),
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'Address',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const Spacer(),
                                                      Flexible(
                                                        child: isLoading
                                                            ? const Text(
                                                                'loading')
                                                            : Text(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                card.address!,
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            16),
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Flexible(
                                                        child: Text(
                                                          'Phone number',
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: isLoading
                                                            ? const Text(
                                                                'loading')
                                                            : Text(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                card.phoneNumber!,
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            16),
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      const Text(
                                                        'State',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      const Spacer(),
                                                      Flexible(
                                                        child: isLoading
                                                            ? const Text(
                                                                'loading')
                                                            : Text(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                card.state!,
                                                                style:
                                                                    const TextStyle(
                                                                        fontSize:
                                                                            16),
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'view details',
                                                        style: TextStyle(
                                                            color: isLoading
                                                                ? Colors.grey
                                                                : const Color(
                                                                    0xff602BF8),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                      Flexible(
                                                        child: Icon(
                                                          Icons.chevron_right,
                                                          color: isLoading
                                                              ? Colors.grey
                                                              : const Color(
                                                                  0xff602BF8),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60, right: 50, top: 30),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: const Color(0xff939393)
                                                .withOpacity(0.3))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.arrow_back),
                                          onPressed: () {
                                            viewModel.previousPage();
                                          },
                                        ),
                                        if (viewModel.currentPage > 3)
                                          const Text('...'),
                                        for (var i = viewModel.currentPage - 2;
                                            i <= viewModel.currentPage;
                                            i++)
                                          if (i > 0)
                                            GestureDetector(
                                              onTap: () =>
                                                  viewModel.goToPage(i),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  color: viewModel
                                                              .currentPage ==
                                                          i
                                                      ? const Color(0xff602BF8)
                                                      : Colors.transparent,
                                                ),
                                                child: Text(
                                                  i.toString(),
                                                  style: TextStyle(
                                                    color:
                                                        viewModel.currentPage ==
                                                                i
                                                            ? Colors.white
                                                            : Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                        IconButton(
                                          icon: const Icon(Icons.arrow_forward),
                                          onPressed: () {
                                            if (viewModel.canLoadNextPage) {
                                              viewModel.nextPage();
                                            }
                                          },
                                        ),
                                        Flexible(
                                          child: IconButton(
                                              onPressed: () async {
                                                await viewModel
                                                    .showGoToPageDialog();
                                              },
                                              icon: const Icon(Icons
                                                  .arrow_forward_ios_outlined)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: isLoading,
                              child: Container(
                                color: Colors.black.withOpacity(0.7),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
