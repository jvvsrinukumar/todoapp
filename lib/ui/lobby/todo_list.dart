

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todoapp/entites/todo_entity.dart';
import 'package:todoapp/resources/assests_manager.dart';
import 'package:todoapp/resources/color_manager.dart';
import 'package:todoapp/resources/font_manager.dart';
import 'package:todoapp/resources/routes_manager.dart';
import 'package:todoapp/resources/style_manager.dart';
import 'package:todoapp/resources/value_manager.dart';
import 'package:todoapp/ui/lobby/servies/todo_service.dart';
import 'package:todoapp/ui/widgets/loader.dart';
import 'package:todoapp/ui/widgets/no_data.dart';

class LobbyPage extends StatefulWidget {
  const LobbyPage({super.key});

  @override
  State<LobbyPage> createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      // AppBar(

      //   elevation: 0.0,
      //   toolbarHeight: 200,
      //   automaticallyImplyLeading: false,
      //   flexibleSpace: FlexibleSpaceBar(
      //     title: SafeArea(
      //       child: Stack(
      //         children: [
      //           Image.asset(
      //             ImageAssets.appBarLogo,
      //             fit: BoxFit.fitWidth,
      //             width: (MediaQuery.of(context).size.width),
      //           ),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Expanded(
      //                 child: Container(
      //                   decoration: BoxDecoration(
      //                     border: Border(
      //                       // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
      //                       bottom: BorderSide(
      //                           width: 4.0, color: ColorManager.buttonColor),
      //                     ),
      //                     //color: ColorManager.appBarBackground,
      //                   ),
      //                   child: Padding(
      //                     padding: const EdgeInsets.symmetric(
      //                         horizontal: 25, vertical: 0),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       mainAxisAlignment: MainAxisAlignment.start,
      //                       children: [
      //                         IconButton(
      //                           onPressed: () {},
      //                           icon: const Icon(Icons.menu_sharp),
      //                           iconSize: 25,
      //                           color: ColorManager.white,
      //                         ),
      //                         const SizedBox(
      //                           height: 10,
      //                         ),
      //                         Text(
      //                           "Your \n Things".toUpperCase(),
      //                           style: getRegularStyle(
      //                               color: ColorManager.primary,
      //                               fontSize: FontSizes.s22),
      //                         ),
      //                         const SizedBox(
      //                           height: 30,
      //                         ),
      //                         Text(
      //                           DateFormat.MMMEd().format(DateTime.now()),
      //                           style: getLightStyle(
      //                               color: ColorManager.primary,
      //                               fontSize: FontSizes.s14),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               Container(
      //                 color: ColorManager.appBarBackground,
      //                 width: (MediaQuery.of(context).size.width) - 230,
      //                 child: Row(
      //                   crossAxisAlignment: CrossAxisAlignment.center,
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.end,
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Text(
      //                             "24".toUpperCase(),
      //                             style: getBoldStyle(
      //                                 color: ColorManager.primary,
      //                                 fontSize: FontSizes.s17),
      //                           ),
      //                           Text(
      //                             "Personal".toUpperCase(),
      //                             style: getSemiBoldStyle(
      //                                 color: ColorManager.primary,
      //                                 fontSize: FontSizes.s10),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.all(8.0),
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.end,
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Text(
      //                             "56".toUpperCase(),
      //                             style: getBoldStyle(
      //                                 color: ColorManager.primary,
      //                                 fontSize: FontSizes.s17),
      //                           ),
      //                           Text(
      //                             "Business".toUpperCase(),
      //                             style: getSemiBoldStyle(
      //                                 color: ColorManager.primary,
      //                                 fontSize: FontSizes.s10),
      //                           ),
      //                         ],
      //                       ),
      //                     )
      //                   ],
      //                 ),
      //               )
      //             ],
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),

      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  ImageAssets.appBarLogo,
                  fit: BoxFit.fitWidth,
                  width: (MediaQuery.of(context).size.width),
                  height: 200,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border(
                            // top: BorderSide(width: 16.0, color: Colors.lightBlue.shade600),
                            bottom: BorderSide(
                                width: 4.0, color: ColorManager.buttonColor),
                          ),
                          // color: ColorManager.appBarBackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.menu_sharp),
                                iconSize: 25,
                                color: ColorManager.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Your \n Things".toUpperCase(),
                                style: getRegularStyle(
                                    color: ColorManager.primary,
                                    fontSize: FontSizes.s22),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                DateFormat.MMMEd().format(DateTime.now()),
                                style: getLightStyle(
                                    color: ColorManager.primary,
                                    fontSize: FontSizes.s14),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: ColorManager.appBarBackground,
                      // width: (MediaQuery.of(context).size.width) - 230,
                      height: 200,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "24".toUpperCase(),
                                      style: getBoldStyle(
                                          color: ColorManager.primary,
                                          fontSize: FontSizes.s15),
                                    ),
                                    Text(
                                      "Personal".toUpperCase(),
                                      style: getSemiBoldStyle(
                                          color: ColorManager.primary,
                                          fontSize: 7),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "56".toUpperCase(),
                                      style: getBoldStyle(
                                          color: ColorManager.primary,
                                          fontSize: FontSizes.s15),
                                    ),
                                    Text(
                                      "Business".toUpperCase(),
                                      style: getSemiBoldStyle(
                                          color: ColorManager.primary,
                                          fontSize: 7),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // const SizedBox(width: 50,),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 30.0, bottom: 25),
                            child: Row(
                              children: [
                                CircularPercentIndicator(
                                  radius: 12.0,
                                  lineWidth: 2.0,
                                  animation: true,
                                  percent: 0.7,
                                  //center: new Text("%"),
                                  progressColor: ColorManager.buttonColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "65% Done",
                                  style: getMediumStyle(
                                      color: ColorManager.primary, fontSize: 9),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            getTodoListBody(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.todoRoute, arguments: {
            "todoTask": null,
            "todoID": null,
          });
        },
        backgroundColor: ColorManager.buttonColor,
        foregroundColor: ColorManager.primary,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: ColorManager.buttonColor.withOpacity(0.2),
                spreadRadius: 6,
                blurRadius: 3,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget getTodoListBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: TodoService().getTodoListOfCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          late Widget child;
          if (snapshot.hasError) {
            child = Center(
              child: Text(
                'Something went wrong',
                style: TextStyle(color: ColorManager.error),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            child = const Expanded(child: LoaderPage());
          } else if (snapshot.data!.size == 0) {
            child = Expanded(
              child: SizedBox(
                height: (MediaQuery.of(context).size.height),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: AppPadding.p10, right: AppPadding.p10),
                  child: NoData(""),
                ),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.size > 0) {
            child = Expanded(
              child: Container(
                //height: 200,
                color: ColorManager.primary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p10, horizontal: AppPadding.p20),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "INBOX".toUpperCase(),
                            style: getSemiBoldStyle(
                                color: ColorManager.lightGrey,
                                fontSize: FontSizes.s10),
                          ),
                          Expanded(
                            child: ListView.builder(
                                primary: false,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (BuildContext context, int index) {
                                  // print(snapshot.data!.docs[index].id);
                                  // print(snapshot.data!.docs[index]["taskName"]);
            
                                  return Card(
                                    elevation: 0.2,
                                    // color: Colors.transparent,
                                    child: ListTile(
                                      leading: FittedBox(
                                        child: CircleAvatar(
                                          radius: 30,
                                          backgroundColor:
                                              ColorManager.circleColor,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 29.5,
                                            child: Icon(
                                              Icons.queue_music_outlined,
                                              color: ColorManager.buttonColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      title: Text(
                                        snapshot.data!.docs[index]["taskName"]
                                            .toUpperCase(),
                                        style: getBoldStyle(
                                            color: snapshot.hasData
                                                ? ColorManager.black
                                                : ColorManager.grey2,
                                            fontSize: FontSizes.s14),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.docs[index]
                                                    ["taskDesc"] +
                                                "\n",
                                            style: getSemiBoldStyle(
                                                color: ColorManager.textColor,
                                                fontSize: FontSizes.s12),
                                          ),
                                          Text(
                                            snapshot.data!.docs[index]["date"],
                                            style: getLightStyle(
                                                color: ColorManager.grey2,
                                                fontSize: FontSizes.s12),
                                          ),
                                        ],
                                      ),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, Routes.todoRoute,
                                                  arguments: {
                                                    "todoTask": ToDo(
                                                        date: snapshot.data!
                                                                .docs[index]
                                                            ["date"],
                                                        taskDesc: snapshot.data!
                                                                .docs[index]
                                                            ["taskDesc"],
                                                        taskName: snapshot.data!
                                                                .docs[index]
                                                            ["taskName"]),
                                                    "taskID": snapshot
                                                        .data!.docs[index].id
                                                  });
                                            },
                                            icon: const Icon(Icons.edit),
                                            iconSize: 20,
                                            color: ColorManager.green,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              TodoService().deleteByID(snapshot
                                                  .data!.docs[index].id);
                                            },
                                            icon: const Icon(Icons.delete),
                                            iconSize: 20,
                                            color: ColorManager.error,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
            
                      Align(
                         alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 25),
                          child: Row(
                            children: [
                              Text(
                                "Completed".toUpperCase() ,
                                style: getSemiBoldStyle(
                                    color: ColorManager.lightGrey,
                                    fontSize: FontSizes.s10),
                              ),
                              const SizedBox(width: 5,),
                            FittedBox(
                                      child: CircleAvatar(
                                        radius: 8,
                                        backgroundColor:
                                            ColorManager.circleColor,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.grey,
                                          radius: 8,
                                         child:  Text(
                                "5".toUpperCase() ,
                                style: getSemiBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSizes.s10),
                              ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return child;
        });
  }
}
