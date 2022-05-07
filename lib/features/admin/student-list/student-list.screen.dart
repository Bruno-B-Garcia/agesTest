// ignore: file_names
import 'package:diario_das_emocoes/shared/models/student.model.dart';
import 'package:diario_das_emocoes/shared/state/student-list/student-list.controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Routes.dart';
import '../../../shared/colors.shared.dart';
import '../../../shared/components/list-view.components.dart';
import '../../../shared/constants.shared.dart';
import '../../../shared/styles.shared.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({Key? key}) : super(key: key);

  @override
  _StudentListScreenState createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<StudentModel> data = [];
  String title = Constants.studantListScreen;
  bool _folded = true;
  final searchBar = TextEditingController();

  late final StudentListController controller =
      context.read<StudentListController>();

  @override
  void initState() {
    super.initState();

    data =
        Provider.of<StudentListController>(context, listen: false).filteredList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: TextButton(
              child: const Text(Constants.returnText),
              onPressed: () {
                Navigator.pop(context);
              },
              style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith(
                    (states) => AppStyles.className),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            child: Row(
              children: [
                Text(
                  title,
                  style: AppStyles.className,
                ),
                const SizedBox(
                  width: 250,
                ),
                AnimatedContainer(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            onChanged: (value) {
                              controller.filterListByStudentName(value);
                            },
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
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<StudentListController>(
                builder: (context, controller, child) {
              return ListViewComponent<StudentModel>(
                  routeName: Routes.studentScreen,
                  data: controller.filteredList,
                  state: controller.state,
                  title: title);
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 30),
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
