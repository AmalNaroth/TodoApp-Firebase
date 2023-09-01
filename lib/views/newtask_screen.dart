import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_project/components/customTextField_widget.dart';
import 'package:todoapp_project/components/textStyle_widget.dart';
import 'package:todoapp_project/utils/constants.dart';
import 'package:todoapp_project/view_models/addDataFirebase_viewmodel.dart.dart';

class NewTaskScreen extends StatefulWidget {
  NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final addToFirebaseProvider = context.watch<AddToFireBaseProvider>();
    return Container(
        padding: EdgeInsets.all(30),
        height: screenHight * 0.55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(12),
            SizedBox(
                width: double.infinity,
                child: TextStyleWidget(
                  value: "New Task Todo",
                  textAlign: TextAlign.center,
                  textColor: blackColor,
                  textSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            Divider(),
            TextStyleWidget(
                value: "Title task", fontWeight: FontWeight.bold, textSize: 16),
            const Gap(6),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: customTextField(
                  hintText: "Add task name",
                  conntroller: addToFirebaseProvider.taskTitleControllerGet),
            ),
            Gap(10),
            TextStyleWidget(
                value: "New Task Todo",
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
                textSize: 16),
            Gap(6),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: customTextField(
                hintText: "Add descripction",
                conntroller:
                    addToFirebaseProvider.taskDescripctionControllerGet,
                maxLine: 5,
              ),
            ),
            Gap(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: whiteColor,
                        foregroundColor: blackColor,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: blackColor))),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: TextStyleWidget(value: "Cancel"),
                  ),
                ),
                Gap(30),
                Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        onPressed: () {
                          addToFirebaseProvider.addToFirebase(context);
                        },
                        child: TextStyleWidget(value: "Create")))
              ],
            )
          ],
        ));
  }
}
