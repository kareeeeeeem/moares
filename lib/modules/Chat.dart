import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Services/toast.dart';
import '../Services/MenuDialog.dart';
import '../cubit/bloc.dart';
import '../cubit/states.dart';
import '../modules/colors.dart';
import '../modules/connect.dart';
import 'package:string_similarity/string_similarity.dart';

class Chat extends StatefulWidget {
  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool border = false;

  bool mon = false;

  bool felo = false;

  bool bebo = false;

  int counter = 0;

  int c = 0;

  int child = 0;

  int girl = 0;

  int pro = 0;

  int sis = 0;

  var messagecontroller = TextEditingController();

  var dead = TextEditingController();

  var female = TextEditingController();

  var grandpa = TextEditingController();

  var mother = TextEditingController();

  var scaffoldkey = GlobalKey<ScaffoldState>();

  var formkey = GlobalKey<FormState>();

  Map<String,String> QuestionData = {};


  @override
  void initState() {
    FirebaseFirestore.instance.collection("chatBot").doc("main").get().then((val){
      setState(() {
        QuestionData = Map.from(val["Qustions"]);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates state) {
        if (state is AppInsertDataBase) {
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, AppStates state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          body: Stack(
            children: [
              Image(
                image: const AssetImage('assets/images/Vector.jpg'),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 110,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Image(
                                  image: AssetImage(
                                    'assets/images/back.png',
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                menuDialog(context);
                              },
                              child: Container(
                                height: 45.0,
                                width: 45.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: const Image(
                                  image: AssetImage(
                                    'assets/images/menu.png',
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                        const Center(
                          child: Text(
                            'شات بوت',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                reverse: true,
                                itemBuilder: (ctx, i) => Container(
                                  alignment: AppCubit.get(context).isUsers[AppCubit.get(context).isUsers.length-i-1] ? Alignment.centerRight : Alignment.centerLeft,
                                  width: 160,
                                  child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15 , vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: ! AppCubit.get(context).isUsers[AppCubit.get(context).isUsers.length-i-1] ? Colors.grey[100] : Colors.blue,
                                  ),
                                  
                                  child: Text(AppCubit.get(context).messages[AppCubit.get(context).messages.length-i-1],style:TextStyle(
                                    fontSize: 15,
                                    color: ! AppCubit.get(context).isUsers[AppCubit.get(context).isUsers.length-i-1] ? Colors.black : Colors.white
                                  ))),
                                ),
                                separatorBuilder: (ctx, i) => SizedBox(
                                      height: 16,
                                    ),
                                itemCount: AppCubit.get(context).messages.length),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 75,
                right: 20,
                left: 20,
                child: Container(
                  color: Colors.white,
                  child: InkWell(
                    onTap: (){
                      if(QuestionData.isNotEmpty){
                      List<String> keys = QuestionData.keys.toList();
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.white, 
                        builder: (BuildContext context) { 
                          return Container(
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  
                                  for(int i =0 ; i< QuestionData.length; i++)...[
                                    InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                         AppCubit.get(context).addMessage(keys[i], true);
                                          AppCubit.get(context).addMessage(QuestionData[keys[i]] ?? "لا يمكنني فهم سؤالك" , false);  
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 6),
                                        width: MediaQuery.of(context).size.width-50,
                                        child: Text(keys[i]!,style: TextStyle(color: fontColor , fontSize: 15),textDirection: TextDirection.rtl,),
                                      ),
                                    ),
                                    Divider(thickness: 1,color: Colors.grey,)
                                  ]
                                ],
                              ),
                            ),
                          );
                        }, context: context,
                        
                      );}else{
                        toast("انتظر حتى يتم تحميل الاسئلة من قاعدة البيانات");
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.7),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        children: [
                          Expanded(
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "عرض مقترحات الاسئلة",style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                left: 20,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          List<String> keys = QuestionData.keys.toList();
                          AppCubit.get(context).addMessage(messagecontroller.text , true);
                          String message = messagecontroller.text;
                          messagecontroller = TextEditingController();
                          Future.delayed(Duration(milliseconds: 2000),(){
                            if (message.bestMatch(keys).bestMatch.rating! > 0.35) {
                            AppCubit.get(context).addMessage(QuestionData[keys[message.bestMatch(keys).bestMatchIndex]] ?? "لا يمكنني فهم سؤالك" , false);
                            }else{
                              AppCubit.get(context).addMessage("لا يمكنني فهم سؤالك" , false);
                            }
                          });
                        },
                        child: Container(
                          height: 45.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                            color: fontColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: const Image(
                            image: AssetImage('assets/images/send.png'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: TextFormField(
                              controller: messagecontroller,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'من فضلك اكتب سؤالك'),
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
        );
      },
    );
  }
}
