// ignore: file_names
import 'package:diario_das_emocoes/Routes.dart';
import 'package:diario_das_emocoes/shared/models/turma.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/colors.shared.dart';
import '../../../shared/components/list-view.components.dart';
import '../../../shared/constants.shared.dart';
import '../../../shared/state/turmas-list/turma-list.controller.dart';
import '../../../shared/styles.shared.dart';

class TurmaListScreen extends StatefulWidget {
  const TurmaListScreen({Key? key}) : super(key: key);

  @override
  _TurmaListScreenState createState() => _TurmaListScreenState();
}

class _TurmaListScreenState extends State<TurmaListScreen> {
  List<TurmaModel> data = [];
  String title = Constants.turmasListScreen;
  bool _folded = true;
  final searchBar = TextEditingController();

  late final TurmaListController controller =
      context.read<TurmaListController>();

  @override
  void initState() {
    super.initState();

    data = Provider.of<TurmaListController>(context, listen: false).list;
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
            padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
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
            child: Consumer<TurmaListController>(
                builder: (context, controller, child) {
              return ListViewComponent<TurmaModel>(
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
