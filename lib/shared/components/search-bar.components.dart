import 'package:diario_das_emocoes/shared/colors.shared.dart';
import "package:flutter/material.dart";

import '../constants.shared.dart';
import '../styles.shared.dart';

class SearchBarComponent extends StatefulWidget {
  const SearchBarComponent({Key? key}) : super(key: key);

  @override
  State<SearchBarComponent> createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  final searchBar = TextEditingController();
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                onChanged: (value) {},
                controller: searchBar,
                decoration: const InputDecoration(
                    hintText: Constants.search,
                    hintStyle: AppStyles.studentName,
                    border: InputBorder.none),
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  _folded ? Icons.search : Icons.close,
                  color: AppColors.primaryColor,
                ),
              ),
              onTap: () {
                setState(() {
                  _folded = !_folded;
                });
              },
            ),
          )
        ],
      ),
      duration: const Duration(milliseconds: 400),
      width: _folded ? 56 : 200,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
        boxShadow: kElevationToShadow[3],
      ),
    );
  }
}
