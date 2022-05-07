import 'package:diario_das_emocoes/shared/models/student.model.dart';
import 'package:diario_das_emocoes/shared/models/turma.model.dart';
import 'package:diario_das_emocoes/shared/state-enum/state.enum.dart';
import 'package:flutter/material.dart';
import '../colors.shared.dart';

class ListViewComponent<T> extends StatelessWidget {
  final List<T> data;
  final String title;
  final StateEnum state;
  final String routeName;

  const ListViewComponent(
      {Key? key,
      required this.data,
      required this.title,
      required this.state,
      required this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 90, 0),
            child: state == StateEnum.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColors.tertiaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, routeName);
                        },
                        child: ListTile(
                          title: Text(getParameter(index)),
                          trailing: const Icon(Icons.keyboard_arrow_right),
                          leading: Icon(Icons.person),
                        ),
                      );
                    },
                    itemCount: data.length,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.white,
                      );
                    },
                  ),
          ),
        ),
      ],
    );
  }

  String getParameter(int index) {
    if (data.elementAt(index) is StudentModel) {
      StudentModel element = data.elementAt(index) as StudentModel;
      return element.name;
    }
    if (data.elementAt(index) is TurmaModel) {
      TurmaModel element = data.elementAt(index) as TurmaModel;
      return element.name;
    }
    return '';
  }
}
