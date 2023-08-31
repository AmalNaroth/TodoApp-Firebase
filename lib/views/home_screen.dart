import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_project/components/textStyle_widget.dart';
import 'package:todoapp_project/utils/constants.dart';
import 'package:todoapp_project/view_models/auth_viewmodel.dart';
import 'package:todoapp_project/views/newtask_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              backgroundColor: whiteColor,
              foregroundColor: blackColor,
              elevation: 0,
              title: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage(
                      "assets/images/joshua-rawson-harris-PcNSEwbXGBw-unsplash.jpg"),
                ),
                title: TextStyleWidget(
                  value: "Hello User",
                  fontWeight: FontWeight.w500,
                  textSize: 17,
                  textColor: Colors.grey,
                ),
                subtitle: TextStyleWidget(
                    value: "User name",
                    fontWeight: FontWeight.w500,
                    textSize: 15,
                    textColor: blackColor),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<LogoutProvider>().logoutFunction(context);
                    },
                    icon: Icon(Icons.logout_rounded))
              ],
            )
          ],
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  child: Column(
                    children: [
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextStyleWidget(
                                  value: "Today's task",
                                  textSize: 25,
                                  fontWeight: FontWeight.bold),
                              Gap(10),
                              TextStyleWidget(
                                value: "Wednesday 11 May",
                                textSize: 15,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                useRootNavigator: true,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                context: context,
                                builder: (context) => StatefulBuilder(builder: (context, setState) => NewTaskScreen(),),
                              );
                            },
                            child: TextStyleWidget(value: "+ New Task"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey,
                        blurRadius: 3,
                        blurStyle: BlurStyle.normal,
                        offset: Offset(5, 5)),

                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Meeting with Mohammad Mnvn",style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 18,fontWeight: FontWeight.bold
                                ),),
                                SizedBox(height: 10),
                                TextStyleWidget(
                                    value: "Resizing motion graphics"),
                                SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  height: 1,
                                  color: Colors.black,
                                ),
                                Gap(10),
                                Row(
                                  children: [
                                    TextStyleWidget(value: "Today"),
                                    Gap(20),
                                    TextStyleWidget(value: " 10:30 AM"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Transform.scale(
                          scale: 1.2,
                          child: Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),activeColor: Colors.blue,
                            value: true, onChanged: (value) {}),
                        ),
                      ],
                    ),
                  ),
                  childCount: 20,
                ),
              ),
            ],
          ),
        ));
  }
}
