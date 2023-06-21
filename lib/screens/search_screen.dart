import 'package:brahma/services/api_services.dart';
import 'package:brahma/utils/colors.dart';
import 'package:brahma/widgets/search_footer.dart';
import 'package:brahma/widgets/search_header.dart';
import 'package:brahma/widgets/search_result_component.dart';
import 'package:brahma/widgets/search_tabs.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final String start;
  final String searchQuery;

  const SearchScreen(
      {super.key, required this.start, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Title(
      color: Colors.blue,
      title: searchQuery,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //web headeer
              const SearchHeader(),
              //tabs for nexs,maps,images etc
              Padding(
                padding: EdgeInsets.only(left: size.width <= 820 ? 10 : 200),
                child: const SearchTabs(),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Divider(
                  height: 0,
                  thickness: 0.3,
                ),
              ),
              //search result

              FutureBuilder(
                future: ApiService().fetchData(querTerm: searchQuery),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    final searchInformation = data?['searchInformation'];
                    final formattedTotalResults =
                        searchInformation?['formattedTotalResults'];
                    final formattedSearchTime =
                        searchInformation?['formattedSearchTime'];
                    final items = data?['items'];

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: size.width <= 820 ? 10 : 200, top: 12),
                          child: Text(
                            'About $formattedTotalResults results ($formattedSearchTime seconds)',
                            style: const TextStyle(
                                fontSize: 15, color: Color(0xFF70757a)),
                          ),
                        ),
                        ListView.builder(
                          itemCount: items?.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = items?[index];
                            final snippet = item?['snippet'];
                            final itemLinkToGo = item?['link'];
                            final itemLink = item?['formattedUrl'];
                            final itemText = item?['title'];

                            return Padding(
                              padding: EdgeInsets.only(
                                  left: size.width <= 820 ? 10 : 200, top: 10),
                              child: SearchResultComponent(
                                desc: snippet ?? '',
                                linkToGo: itemLinkToGo ?? '',
                                link: itemLink ?? '',
                                text: itemText ?? '',
                              ),
                            );
                          },
                        ),

                        //pagination buttons
                        SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  if (start != "0") {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => SearchScreen(
                                            start: (int.parse(start) - 10)
                                                .toString(),
                                            searchQuery: searchQuery),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  '< Prev',
                                  style:
                                      TextStyle(fontSize: 15, color: blueColor),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => SearchScreen(
                                          start: (int.parse(start) + 10)
                                              .toString(),
                                          searchQuery: searchQuery),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Next >',
                                  style:
                                      TextStyle(fontSize: 15, color: blueColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const SearchFooter(),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
