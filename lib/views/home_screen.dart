import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:todoapp_project/components/textStyle_widget.dart';
import 'package:todoapp_project/utils/constants.dart';
import 'package:todoapp_project/view_models/auth_viewmodel.dart';
import 'package:todoapp_project/views/newtask_screen.dart';

class HomeScreen extends StatelessWidget {
  final CollectionReference todolistsnap=FirebaseFirestore.instance.collection("TodoUserList").doc(FirebaseAuth.instance.currentUser!.uid).collection("TodoItems");
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: todolistsnap.snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.hasData){
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
                      value: "YOUR TO DO",
                      fontWeight: FontWeight.w500,
                      textSize: 17,
                      textColor: blackColor),
                ),
                actions: [
                 TextButton.icon(onPressed: (){
                  context.read<LogoutProvider>().logoutFunction(context);
                 }, icon: Icon(Icons.logout), label: TextStyleWidget(value: "Logout"))
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
                                  value: "Friday 01 Sep",
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
                    (context, index) {
                      final DocumentSnapshot todosnap=snapshot.data.docs[index];
                      return Container(
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
                                  Text(todosnap['taskTitle'],style: TextStyle(
                                    fontSize: 20,fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(height: 10),
                                  TextStyleWidget(
                                      value: todosnap['taskDescripction'],textSize: 17,fontWeight: FontWeight.w500),
                                  SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                          Transform.scale(
                            scale: 1.2,
                            child: IconButton(onPressed: (){
                              todolistsnap.doc(todosnap.id).delete();
                            }, icon: Icon(Icons.delete))
                          ),
                          Gap(10)
                        ],
                      ),
                    );
                    },
                    childCount: snapshot.data.docs.length,
                  ),
                ),
              ],
            ),
          ));
        }
        return Container(
          color: Colors.white,
          child: Center(child: CircularProgressIndicator(),),
        );
  });
      }
  }
