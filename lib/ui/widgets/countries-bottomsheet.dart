import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paytrybe/constant/country-providers.dart';
import 'package:paytrybe/constant/palette.dart';
import 'package:paytrybe/ui/widgets/input.dart';
import 'package:paytrybe/utils/string-extensions.dart';
import 'package:paytrybe/utils/widget_extensions.dart';

class CountriesBottomSheet extends StatelessWidget {
  final Function(CountryProvider) onSelected;
  final CountryProvider? value;

  CountriesBottomSheet({
    Key? key,
    required this.onSelected,
    required this.value,
  }) : super(key: key);

  late ValueNotifier<List<CountryProvider>> items =
      ValueNotifier(List.from(countryList));

  search(String query) {
    items.value = [];
    if (query.isNotEmpty) {
      for (var e in countryList) {
        if (e.name!.toLowerCase().contains(query.toLowerCase())) {
          items.value.add(e);
        }
      }
    } else {
      items.value.addAll(countryList);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          height: height(context) / 1.4,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Select your Country",
                              style: TextStyle(
                                color: primaryDarkColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.0.sbH,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Input(
                      prefixWidget: Icon(
                        Icons.search,
                        color: grey,
                      ),
                      autofocus: false,
                      labelText: "Search Country",
                      onChanged: (v) => search(v),
                    ),
                  ),
                  20.sbH,
                  ValueListenableBuilder(
                    valueListenable: items,
                    builder: (context, value, child) => Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: value.length,
                          itemBuilder: (BuildContext context, int i) {
                            return GestureDetector(
                                onTap: () {
                                  onSelected(value[i]);
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  value[i].name!.png),
                                              backgroundColor:
                                                  Colors.transparent,
                                              radius: 10,
                                            ),
                                            12.sbW,
                                            Text(
                                              value[i]
                                                  .name!
                                                  .capitalizeFirstOfEach,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.sp,
                                                  color: primaryDarkColor),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Expanded(child: Container()),
                                            Text(
                                              value[i].prefix!,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        Divider(
                                          color: grey,
                                        )
                                      ],
                                    )));
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

showCountriesBottomSheet(BuildContext context,
    {Function(CountryProvider)? onCountrySelected, CountryProvider? value}) {
  showModalBottomSheet(
      enableDrag: true,
      isDismissible: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return CountriesBottomSheet(
          value: value,
          onSelected: (v) => onCountrySelected!(v),
        );
      });
}
