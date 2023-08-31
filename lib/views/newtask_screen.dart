import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoapp_project/components/customRadio_widget.dart';
import 'package:todoapp_project/components/customTextField_widget.dart';
import 'package:todoapp_project/components/textStyle_widget.dart';
import 'package:todoapp_project/utils/constants.dart';

class NewTaskScreen extends StatelessWidget {
  NewTaskScreen({super.key});

  final TextEditingController addTaskNameController = TextEditingController();
  final TextEditingController addDescripctionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(30),
      height: screenHight * 0.70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(12),
          SizedBox(
              width: double.infinity,
              child: TextStyleWidget(
                value: "New Task Todo",
                textAlign: TextAlign.center,
              )),
          Divider(),
          TextStyleWidget(value: "Title task"),
          const Gap(6),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade300,
            ),
            child: customTextField(
                hintText: "Add task name", conntroller: addTaskNameController),
          ),
          Gap(10),
          TextStyleWidget(
            value: "New Task Todo",
            textAlign: TextAlign.center,
          ),
          Gap(6),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: customTextField(
              hintText: "Add descripction",
              conntroller: addDescripctionController,
              maxLine: 5,
            ),
          ),
          Gap(10),
          TextStyleWidget(value: "Category"),
          Row(
            children: [
              Expanded(
                child: CustomRadioWidget(
                  catColor: Colors.green,
                  radioTitle: "Learning",
                ),
              ),
              Expanded(
                child: CustomRadioWidget(
                  catColor: Colors.blue,
                  radioTitle: "Working",
                ),
              ),
              Expanded(
                child: CustomRadioWidget(
                  catColor: Colors.orange,
                  radioTitle: "General",
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyleWidget(value: "Date"),
                    Gap(20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.calendar),
                          Gap(10),
                          TextStyleWidget(value: "dd/mm/yy")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextStyleWidget(value: "Time"),
                    Gap(20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          Icon(CupertinoIcons.clock),
                          Gap(10),
                          TextStyleWidget(value: "hh : mm")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(20),
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
                        
                      },
                      child: TextStyleWidget(value: "Cancel"))),
              Gap(30),
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      onPressed: () {},
                      child: TextStyleWidget(value: "Create")))
            ],
          )
        ],
      ),
    );
  }
}
