import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Services/MenuDialog.dart';
import '../Services/pdf.dart';
import '../Services/toast.dart';
import '../modules/Chat.dart';
import '../modules/colors.dart';
import '../modules/connect.dart';

class Solution extends StatefulWidget {
  final int husband;
  final int wives;
  final int sons;
  final int daughters;
  final bool father;
  final bool grandfather;
  final bool mother;
  final int grandSons;
  final int grandDaughters;
  final double wealth;
  final int fullSister;
  final int fullBrother;
  final String name;
  final int paternalGrandMother; // ام الاب
  final int maternalGrandMother; // ام الام
  final int paternalBrothers; // اخ من الاب
  final int paternalSisters; // اخت من الاب
  final int maternalBrothers; // اخ من الام
  final int maternalSisters; // اخت من الام
  final int fullNephews; // ابناء الاخ
  final int paternalNephews; // ابن الاخ من الاب
  final int fullPaternalUncles; //عم شقيق
  final int paternalPaternalUncles; // عم لأب
  final int fullCousins; // اولاد عم شقيق
  final int paternalCousins; // اولاد عم لاب
  final bool history;
  Solution(
    this.wealth,
    this.husband,
    this.wives,
    this.sons,
    this.daughters,
    this.father,
    this.mother,
    this.grandfather,
    this.grandSons,
    this.grandDaughters,
    this.fullSister,
    this.fullBrother,
    this.name, [
    this.paternalGrandMother = 0,
    this.maternalGrandMother = 0,
    this.paternalBrothers = 0,
    this.paternalSisters = 0,
    this.maternalBrothers = 0,
    this.maternalSisters = 0,
    this.fullNephews = 0,
    this.paternalNephews = 0,
    this.fullPaternalUncles = 0,
    this.paternalPaternalUncles = 0,
    this.fullCousins = 0,
    this.paternalCousins = 0,
    this.history = false
  ]);

  @override
  State<Solution> createState() => _SolutionState();
}

class _SolutionState extends State<Solution> {
  List<double> percent = [];
  List<String> type = [];
  List<double> money = [];
  List<int> swra = [];
  Map<int, String> ayat = {
    11: "يُوصِيكُمُ اللَّهُ فِي أَوْلادِكُمْ لِلذَّكَرِ مِثْلُ حَظِّ الأُنثَيَيْنِ فَإِن كُنَّ نِسَاء فَوْقَ اثْنَتَيْنِ فَلَهُنَّ ثُلُثَا مَا تَرَكَ وَإِن كَانَتْ وَاحِدَةً فَلَهَا النِّصْفُ وَلأَبَوَيْهِ لِكُلِّ وَاحِدٍ مِّنْهُمَا السُّدُسُ مِمَّا تَرَكَ إِن كَانَ لَهُ وَلَدٌ فَإِن لَّمْ يَكُن لَّهُ وَلَدٌ وَوَرِثَهُ أَبَوَاهُ فَلأُمِّهِ الثُّلُثُ فَإِن كَانَ لَهُ إِخْوَةٌ فَلأُمِّهِ السُّدُسُ مِن بَعْدِ وَصِيَّةٍ يُوصِي بِهَا أَوْ دَيْنٍ آبَاؤُكُمْ وَأَبْنَاؤُكُمْ لاَ تَدْرُونَ أَيُّهُمْ أَقْرَبُ لَكُمْ نَفْعًا فَرِيضَةً مِّنَ اللَّهِ إِنَّ اللَّهَ كَانَ عَلِيمًا حَكِيمًا (النساء ١١)",
    12: "وَلَكُمْ نِصْفُ مَا تَرَكَ أَزْوَاجُكُمْ إِن لَّمْ يَكُن لَّهُنَّ وَلَدٌ فَإِن كَانَ لَهُنَّ وَلَدٌ فَلَكُمُ الرُّبُعُ مِمَّا تَرَكْنَ مِن بَعْدِ وَصِيَّةٍ يُوصِينَ بِهَا أَوْ دَيْنٍ وَلَهُنَّ الرُّبُعُ مِمَّا تَرَكْتُمْ إِن لَّمْ يَكُن لَّكُمْ وَلَدٌ فَإِن كَانَ لَكُمْ وَلَدٌ فَلَهُنَّ الثُّمُنُ مِمَّا تَرَكْتُم مِّن بَعْدِ وَصِيَّةٍ تُوصُونَ بِهَا أَوْ دَيْنٍ وَإِن كَانَ رَجُلٌ يُورَثُ كَلالَةً أَو امْرَأَةٌ وَلَهُ أَخٌ أَوْ أُخْتٌ فَلِكُلِّ وَاحِدٍ مِّنْهُمَا السُّدُسُ فَإِن كَانُواْ أَكْثَرَ مِن ذَلِكَ فَهُمْ شُرَكَاء فِي الثُّلُثِ مِن بَعْدِ وَصِيَّةٍ يُوصَى بِهَا أَوْ دَيْنٍ غَيْرَ مُضَارٍّ وَصِيَّةً مِّنَ اللَّهِ وَاللَّهُ عَلِيمٌ حَلِيمٌ (النساء ١٢)",
    176:
        "يَسْتَفْتُونَكَ قُلِ اللَّهُ يُفْتِيكُمْ فِي الْكَلالَةِ إِنِ امْرُؤٌ هَلَكَ لَيْسَ لَهُ وَلَدٌ وَلَهُ أُخْتٌ فَلَهَا نِصْفُ مَا تَرَكَ وَهُوَ يَرِثُهَا إِن لَّمْ يَكُن لَّهَا وَلَدٌ فَإِن كَانَتَا اثْنَتَيْنِ فَلَهُمَا الثُّلُثَانِ مِمَّا تَرَكَ وَإِن كَانُواْ إِخْوَةً رِّجَالاً وَنِسَاء فَلِلذَّكَرِ مِثْلُ حَظِّ الأُنثَيَيْنِ يُبَيِّنُ اللَّهُ لَكُمْ أَن تَضِلُّواْ وَاللَّهُ بِكُلِّ شَيْءٍ عَلِيمٌ (النساء ١٧٦)"
  };

  bool border = false;
  bool mon = false;
  bool felo = false;
  bool bebo = false;
  int husband = 0;
  int wives = 0;
  int sons = 0;
  int daughters = 0;
  bool father = false;
  bool grandfather = false;
  bool mother = false;
  int grandSons = 0;
  int grandDaughters = 0;
  double wealth = 0;
  int fullSister = 0;
  int fullBrother = 0;
  double total = 1;
  bool error = false;

  int paternalGrandMother = 0; // ام الاب
  int maternalGrandMother = 0; // ام الام
  int paternalBrothers = 0; // اخ من الاب
  int paternalSisters = 0; // اخت من الاب
  int maternalBrothers = 0; // اخ من الام
  int maternalSisters = 0; // اخت من الام
  int fullNephews = 0; // ابناء الاخ
  int paternalNephews = 0; // ابن الاخ من الاب
  int fullPaternalUncles = 0; //عم شقيق
  int paternalPaternalUncles = 0; // عم لأب
  int fullCousins = 0; // اولاد عم شقيق
  int paternalCousins = 0; // اولاد عم لاب

  @override
  void initState() {
    husband = widget.husband;
    wives = widget.wives;
    sons = widget.sons;
    daughters = widget.daughters;
    father = widget.father;
    grandfather = widget.grandfather;
    mother = widget.mother;
    grandSons = widget.grandSons;
    grandDaughters = widget.grandDaughters;
    wealth = widget.wealth;
    fullSister = widget.fullSister;
    fullBrother = widget.fullBrother;

    paternalGrandMother = widget.paternalGrandMother; // ام الاب
    maternalGrandMother = widget.maternalGrandMother; // ام الام
    paternalBrothers = widget.paternalBrothers; // اخ من الاب
    paternalSisters = widget.paternalSisters; // اخت من الاب
    maternalBrothers = widget.maternalBrothers; // اخ من الام
    maternalSisters = widget.maternalSisters; // اخت من الام
    fullNephews = widget.fullNephews; // ابناء الاخ
    paternalNephews = widget.paternalNephews; // ابن الاخ من الاب
    fullPaternalUncles = widget.fullPaternalUncles; //عم شقيق
    paternalPaternalUncles = widget.paternalPaternalUncles; // عم لأب
    fullCousins = widget.fullCousins; // اولاد عم شقيق
    paternalCousins = widget.paternalCousins; // اولاد عم لاب

    mwareth();
    if(FirebaseAuth.instance.currentUser != null && !widget.history){
      FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("History").add({
        "name" : widget.name,
        "husband" : husband,
        "wives" : wives,
        "sons" : sons,
        "daughters" : daughters,
        "father" : father,
        "grandfather" : grandfather,
        "mother" : mother,
        "grandSons" : grandSons,
        "grandDaughters" : grandDaughters,
        "wealth" : wealth,
        "fullSister" : fullSister,
        "fullBrother" : fullBrother,
        "paternalGrandMother" : paternalGrandMother,
        "maternalGrandMother" : maternalGrandMother,
        "paternalBrothers" : paternalBrothers,
        "paternalSisters" : paternalSisters,
        "maternalBrothers" : maternalBrothers,
        "maternalSisters" : maternalSisters,
        "fullNephews" : fullNephews,
        "paternalNephews" : paternalNephews,
        "fullPaternalUncles" : fullPaternalUncles,
        "paternalPaternalUncles" : paternalPaternalUncles,
        "fullCousins" : fullCousins,
        "paternalCousins" : paternalCousins
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage('assets/images/Vector.jpg'),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: double.infinity,
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
                            child: Image(
                              image: AssetImage(
                                'assets/images/back.png',
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
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
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'حل المسئلة',
                      style: TextStyle(
                          fontFamily: "Cairo",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      width: 342.0,
                      height: 119.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(40.0),
                        border: Border.all(color: fontColor),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'مقدار التركة',
                            style: TextStyle(
                                fontFamily: "Cairo",
                                color: fontColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          Text(
                            '$wealth',
                            style: TextStyle(
                                fontFamily: "Cairo",
                                color: fontColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      'نسبة النصيب',
                      style: TextStyle(
                          fontFamily: "Cairo",
                          color: fontColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                children: [
                                  for (int i = 0; i < type.length; i++) ...[
                                    Container(
                                      height: 48.0,
                                      width: 342.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: fontColor),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Center(
                                              child: Text(
                                                type[i],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: fontColor,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Center(
                                              child: Text(
                                                "${(percent[i] * 100).toPrecision(2)} %",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                  ]
                                ],
                              ),
                              Text(
                                'قيمة النصيب',
                                style: TextStyle(
                                    fontFamily: "Cairo",
                                    color: fontColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Column(
                                children: [
                                  for (int i = 0; i < money.length; i++) ...[
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 6, bottom: 6),
                                      width: 341.0,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 30),
                                      height: 78.0,
                                      decoration: BoxDecoration(
                                        color: fontColor,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            type[i],
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                money[i]
                                                    .toPrecision(2)
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ]
                                ],
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Text(
                                'الآيات الخاصة بالفتوى',
                                style: TextStyle(
                                    fontFamily: "Cairo",
                                    color: fontColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Column(children: [
                                for (int i = 0; i < swra.length; i++) ...[
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: fontColor),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width-85,
                                            child: Text(
                                              ayat[swra[i]]!,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: fontColor,
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                ],
                              ]),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                height: 50.0,
                                width: 335.0,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  border: Border.all(color: fontColor),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (FirebaseAuth.instance.currentUser != null) {
                                      pagePdf(widget.name, wealth, type, money,
                                        percent);
                                    }else{
                                      toast("سجل الدخول لاستخراج ملف الpdf");
                                    }
                                    
                                  },
                                  child: Text(
                                    'Export Pdf',
                                    style: TextStyle(
                                        fontFamily: "Cairo",
                                        color: fontColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  blocked() {
    if (sons > 0) {
      grandSons = 0;
      grandDaughters = 0;
      fullBrother = 0;
      fullSister = 0;
      paternalBrothers = 0;
      paternalSisters = 0;
      maternalBrothers = 0;
      maternalSisters = 0;
      fullNephews = 0;
      paternalNephews = 0;
      fullPaternalUncles = 0;
      paternalPaternalUncles = 0;
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (grandSons > 0) {
      fullBrother = 0;
      fullSister = 0;
      paternalBrothers = 0;
      paternalSisters = 0;
      maternalBrothers = 0;
      maternalSisters = 0;
      fullNephews = 0;
      paternalNephews = 0;
      fullPaternalUncles = 0;
      paternalPaternalUncles = 0;
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (father) {
      grandfather = false;
      paternalGrandMother = 0;
      fullBrother = 0;
      fullSister = 0;
      paternalBrothers = 0;
      paternalSisters = 0;
      maternalBrothers = 0;
      maternalSisters = 0;
      fullNephews = 0;
      paternalNephews = 0;
      fullPaternalUncles = 0;
      paternalPaternalUncles = 0;
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (mother) {
      paternalGrandMother = 0;
      maternalGrandMother = 0;
    }
    if (grandfather) {
      fullNephews = 0;
      paternalNephews = 0;
      fullPaternalUncles = 0;
      paternalPaternalUncles = 0;
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (fullBrother > 0) {
      paternalBrothers = 0;
      paternalSisters = 0;
      fullNephews = 0;
      paternalNephews = 0;
      fullPaternalUncles = 0;
      paternalPaternalUncles = 0;
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (fullSister > 0 && (daughters > 0 || grandDaughters > 0)) {
      paternalBrothers = 0;
      paternalSisters = 0;
      fullNephews = 0;
      paternalNephews = 0;
      fullPaternalUncles = 0;
      paternalPaternalUncles = 0;
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (paternalSisters > 0 &&
        (fullSister > 0 ||
            paternalSisters > 1 ||
            daughters > 0 ||
            grandDaughters > 0)) {
      fullNephews = 0;
      paternalNephews = 0;
      fullPaternalUncles = 0;
      paternalPaternalUncles = 0;
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (paternalBrothers > 0) {
      fullNephews = 0;
      paternalNephews = 0;
      fullPaternalUncles = 0;
      paternalPaternalUncles = 0;
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (fullNephews > 0) {
      paternalNephews = 0;
      fullPaternalUncles = 0;
      paternalPaternalUncles = 0;
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (paternalNephews > 0) {
      fullPaternalUncles = 0;
      paternalPaternalUncles = 0;
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (fullPaternalUncles > 0) {
      paternalPaternalUncles = 0;
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (paternalPaternalUncles > 0) {
      fullCousins = 0;
      paternalCousins = 0;
    }
    if (fullCousins > 0) {
      paternalCousins = 0;
    }
  }

  tasib([int flag = 0]) {
    double members = daughters / 2 + sons;
    double grandMembers = grandDaughters / 2 + grandSons;
    double fullMembers = fullSister / 2 + fullBrother;
    double paternalMembers = paternalSisters / 2 + paternalBrothers;
    if (total > 0) {
      if (sons > 0) {
        for (int i = 0; i < sons; i++) {
          print(
              "son $i : ${((total) / members)} it's about ${((total / members) * wealth)} of total");
          type.add("ابن ${i + 1}");
          percent.add(((total) / members));
          money.add(((total) / members) * wealth);
        }
        for (int i = 0; i < daughters; i++) {
          print(
              "daughter $i : ${((total) / members) / 2} it's about ${(((total / members) * wealth) / 2)} of total");
          type.add("ابنة ${i + 1}");
          percent.add(((total) / members) / 2);
          money.add(((total) / members) / 2 * wealth);
        }
        swra.contains(11) ? print("") : swra.add(11);
        total = 0;
      } else if (grandSons > 0) {
        for (int i = 0; i < grandSons; i++) {
          print(
              "grandSons $i : ${((total) / grandMembers)} it's about ${((total / grandMembers) * wealth)} of total");
          type.add("ابن الابن ${i + 1}");
          percent.add(((total) / grandMembers));
          money.add(((total) / grandMembers) * wealth);
        }
        for (int i = 0; i < grandDaughters; i++) {
          print(
              "grandDaughters $i : ${((total) / grandMembers) / 2} it's about ${(((total / grandMembers) * wealth) / 2)} of total");
          type.add("بنت الابن ${i + 1}");
          percent.add(((total) / grandMembers) / 2);
          money.add(((total) / grandMembers) / 2 * wealth);
        }
        swra.contains(11) ? print("") : swra.add(11);
        total = 0;
      } else if (father) {
        print("father: ${((total))} it's about ${((total) * wealth)} of total");
        type.add("الاب");
        percent.add(((total)));
        money.add(((total)) * wealth);
        total = 0;
        swra.contains(11) ? print("") : swra.add(11);
      } else if (fullBrother > 0) {
        for (int i = 0; i < fullBrother; i++) {
          print(
              "fullBrother $i : ${((total) / fullMembers)} it's about ${((total / fullMembers) * wealth)} of total");
          type.add("اخ شقيق ${i + 1}");
          percent.add(((total) / fullMembers));
          money.add(((total) / fullMembers) * wealth);
        }
        for (int i = 0; i < fullSister; i++) {
          print(
              "fullSister $i : ${((total) / fullMembers) / 2} it's about ${(((total / fullMembers) * wealth) / 2)} of total");
          type.add("اخت شقيقة ${i + 1}");
          percent.add(((total) / fullMembers) / 2);
          money.add(((total) / fullMembers) / 2 * wealth);
        }
        swra.contains(176) ? print("") : swra.add(176);
        total = 0;
      } else if (paternalBrothers > 0) {
        for (int i = 0; i < paternalBrothers; i++) {
          print(
              "paternalBrothers $i : ${((total) / paternalMembers)} it's about ${((total / paternalMembers) * wealth)} of total");
          type.add("اخ لأب ${i + 1}");
          percent.add(((total) / paternalMembers));
          money.add(((total) / paternalMembers) * wealth);
        }
        for (int i = 0; i < paternalSisters; i++) {
          print(
              "paternalSisters $i : ${((total) / paternalMembers) / 2} it's about ${(((total / paternalMembers) * wealth) / 2)} of total");
          type.add("اخت لأب ${i + 1}");
          percent.add(((total) / paternalMembers) / 2);
          money.add(((total) / paternalMembers) / 2 * wealth);
        }
        swra.contains(176) ? print("") : swra.add(176);
        total = 0;
      } else if (grandfather) {
        print(
            "grandfather: ${((total))} it's about ${((total) * wealth)} of total");
        type.add("الجد");
        percent.add(((total)));
        money.add(((total)) * wealth);
        total = 0;
      } else if (fullNephews > 0) {
        for (int i = 0; i < fullNephews; i++) {
          print(
              "fullNephews $i : ${((total) / fullNephews)} it's about ${((total / fullNephews) * wealth)} of total");
          type.add("ابن الاخ ${i + 1}");
          percent.add(((total) / fullNephews));
          money.add(((total) / fullNephews) * wealth);
        }
        swra.contains(176) ? print("") : swra.add(176);
        total = 0;
      } else if (paternalNephews > 0) {
        for (int i = 0; i < paternalNephews; i++) {
          print(
              "paternalNephews $i : ${((total) / paternalNephews)} it's about ${((total / paternalNephews) * wealth)} of total");
          type.add("ابن اخ لأب ${i + 1}");
          percent.add(((total) / paternalNephews));
          money.add(((total) / paternalNephews) * wealth);
        }
        swra.contains(176) ? print("") : swra.add(176);
        total = 0;
      } else if (fullPaternalUncles > 0) {
        for (int i = 0; i < fullPaternalUncles; i++) {
          print(
              "fullPaternalUncles $i : ${((total) / fullPaternalUncles)} it's about ${((total / fullPaternalUncles) * wealth)} of total");
          type.add("عم شقيق ${i + 1}");
          percent.add(((total) / fullPaternalUncles));
          money.add(((total) / fullPaternalUncles) * wealth);
        }
        swra.contains(176) ? print("") : swra.add(176);
        total = 0;
      } else if (paternalPaternalUncles > 0) {
        for (int i = 0; i < paternalPaternalUncles; i++) {
          print(
              "paternalPaternalUncles $i : ${((total) / paternalPaternalUncles)} it's about ${((total / paternalPaternalUncles) * wealth)} of total");
          type.add("عم لأب ${i + 1}");
          percent.add(((total) / paternalPaternalUncles));
          money.add(((total) / paternalPaternalUncles) * wealth);
        }
        swra.contains(176) ? print("") : swra.add(176);
        total = 0;
      } else if (fullCousins > 0) {
        for (int i = 0; i < fullCousins; i++) {
          print(
              "fullCousins $i : ${((total) / fullCousins)} it's about ${((total / fullCousins) * wealth)} of total");
          type.add("ابن عم شقيق ${i + 1}");
          percent.add(((total) / fullCousins));
          money.add(((total) / fullCousins) * wealth);
        }
        swra.contains(176) ? print("") : swra.add(176);
        total = 0;
      } else if (paternalCousins > 0) {
        for (int i = 0; i < paternalCousins; i++) {
          print(
              "paternalCousins $i : ${((total) / paternalCousins)} it's about ${((total / paternalCousins) * wealth)} of total");
          type.add("ابن عم لأب ${i + 1}");
          percent.add(((total) / paternalCousins));
          money.add(((total) / paternalCousins) * wealth);
        }
        total = 0;
      }
    } else if (total == 0) {
    } else {
      if (flag == 0) {
        mwareth((1 - total), 1);
      }
    }
  }

  mwareth([double val = 1, flag = 0]) {
    type = [];
    percent = [];
    money = [];
    total = 1;
    if ((husband != 0 && wives != 0) || husband > 1 || wives > 4) {
      error = true;
      print("input Error");
    }

    if (!error) {
      blocked();
      if (husband > 0) {
        if (sons < 1 && daughters < 1 && grandSons < 1 && grandDaughters < 1) {
          print(
              "husband : ${((1 / 2) / val)} it's about ${((1 / 2) / val) * wealth} of total");
          total -= ((1 / 2) / val);
          type.add("زوج");
          percent.add((1 / 2) / val);
          money.add((1 / 2) / val * wealth);
        } else {
          print(
              "husband : ${((1 / 4) / val)} it's about ${((1 / 4) / val) * wealth} of total");
          total -= ((1 / 4) / val);
          type.add("زوج");
          percent.add((1 / 4) / val);
          money.add((1 / 4) / val * wealth);
        }
        swra.contains(12) ? print("") : swra.add(12);
      }
      if (wives > 0) {
        if (sons < 1 && daughters < 1 && grandSons < 1 && grandDaughters < 1) {
          for (int i = 0; i < wives; i++) {
            print(
                "wife $i : ${((1 / 4) / wives) / val} it's about ${((1 / 4) / wives) / val * wealth} of total");
            total -= ((1 / 4) / wives) / val;
            type.add("زوجة ${i + 1}");
            percent.add(((1 / 4) / wives) / val);
            money.add(((1 / 4) / wives) / val * wealth);
          }
          swra.contains(12) ? print("") : swra.add(12);
        } else {
          for (int i = 0; i < wives; i++) {
            print(
                "wife $i : ${((1 / 8) / wives) / val} it's about ${((1 / 8) / wives) / val * wealth} of total");
            total -= ((1 / 8) / wives) / val;
            type.add("زوجة ${i + 1}");
            percent.add(((1 / 8) / wives) / val);
            money.add(((1 / 8) / wives) / val * wealth);
          }
          swra.contains(12) ? print("") : swra.add(12);
        }
      }
      if (daughters > 0) {
        if (sons < 1 && daughters == 1) {
          for (int i = 0; i < daughters; i++) {
            print(
                "daughter $i : ${((1 / 2) / daughters) / val} it's about ${(((1 / 2 / daughters) / val * wealth))} of total");
            total -= (((1 / 2) / daughters) / val);
            type.add("ابنة ${i + 1}");
            percent.add(((1 / 2) / daughters) / val);
            money.add(((1 / 2) / daughters) / val * wealth);
          }
        } else if (daughters > 1 && sons < 1) {
          for (int i = 0; i < daughters; i++) {
            print(
                "daughter $i : ${((2 / 3) / daughters) / val} it's about ${(((2 / 3 / daughters) / val * wealth))} of total");
            total -= (((2 / 3) / daughters) / val);
            type.add("ابنة ${i + 1}");
            percent.add(((2 / 3) / daughters) / val);
            money.add(((2 / 3) / daughters) / val * wealth);
          }
        }
        swra.contains(11) ? print("") : swra.add(11);
      }
      if (grandDaughters > 0) {
        if (sons < 1 && daughters < 1 && grandSons < 1 && grandDaughters == 1) {
          for (int i = 0; i < grandDaughters; i++) {
            print(
                "grandDaughters $i : ${((1 / 2) / grandDaughters) / val} it's about ${(((1 / 2 / grandDaughters) / val * wealth))} of total");
            total -= (((1 / 2) / grandDaughters) / val);
            type.add("ابنة الابن ${i + 1}");
            percent.add(((1 / 2) / grandDaughters) / val);
            money.add(((1 / 2) / grandDaughters) / val * wealth);
          }
        } else if (sons < 1 &&
            daughters < 1 &&
            grandSons < 1 &&
            grandDaughters == 2) {
          for (int i = 0; i < grandDaughters; i++) {
            print(
                "grandDaughters $i : ${((2 / 3) / grandDaughters) / val} it's about ${(((2 / 3 / grandDaughters) / val * wealth))} of total");
            total -= (((2 / 3) / grandDaughters) / val);
            type.add("ابنة الابن ${i + 1}");
            percent.add(((2 / 3) / grandDaughters) / val);
            money.add(((2 / 3) / grandDaughters) / val * wealth);
          }
        } else if (sons < 1 && daughters == 1 && grandSons < 1) {
          for (int i = 0; i < grandDaughters; i++) {
            print(
                "grandDaughters $i : ${((1 / 6) / grandDaughters) / val} it's about ${(((1 / 6 / grandDaughters) / val * wealth))} of total");
            total -= (((1 / 6) / grandDaughters) / val);
            type.add("ابنة الابن ${i + 1}");
            percent.add(((1 / 6) / grandDaughters) / val);
            money.add(((1 / 6) / grandDaughters) / val * wealth);
          }
        }
        swra.contains(11) ? print("") : swra.add(11);
      }
      if (father) {
        print(
            "father : ${((1 / 6) / val)} it's about ${((1 / 6) / val) * wealth} of total");
        total -= ((1 / 6) / val);
        type.add("الاب");
        percent.add(((1 / 6) / val));
        money.add(((1 / 6) / val) * wealth);
        swra.contains(11) ? print("") : swra.add(11);
      }
      if (mother) {
        print(
            "mother : ${((1 / 6) / val)} it's about ${((1 / 6) / val) * wealth} of total");
        total -= ((1 / 6) / val);
        type.add("الام");
        percent.add(((1 / 6) / val));
        money.add(((1 / 6) / val) * wealth);
        swra.contains(11) ? print("") : swra.add(11);
      }
      if (grandfather && !father) {
        print(
            "Grand Father : ${((1 / 6) / val)} it's about ${((1 / 6) / val) * wealth} of total");
        total -= ((1 / 6) / val);
        type.add("الجد");
        percent.add(((1 / 6) / val));
        money.add(((1 / 6) / val) * wealth);
        swra.contains(11) ? print("") : swra.add(11);
      }
      if (paternalGrandMother == 1) {
        if (!mother && !father && maternalGrandMother == 1) {
          print(
              "paternalGrandMother : ${((1 / 12) / val)} it's about ${((1 / 12) / val) * wealth} of total");
          total -= ((1 / 12) / val);
          type.add("ام الاب");
          percent.add(((1 / 12) / val));
          money.add(((1 / 12) / val) * wealth);
        } else if (!mother && !father && maternalGrandMother < 1) {
          print(
              "paternalGrandMother : ${((1 / 6) / val)} it's about ${((1 / 6) / val) * wealth} of total");
          total -= ((1 / 6) / val);
          type.add("ام الاب");
          percent.add(((1 / 6) / val));
          money.add(((1 / 6) / val) * wealth);
        }
        swra.contains(11) ? print("") : swra.add(11);
      }
      if (maternalGrandMother == 1) {
        if (!mother && !father && paternalGrandMother == 1) {
          print(
              "maternalGrandMother : ${((1 / 12) / val)} it's about ${((1 / 12) / val) * wealth} of total");
          total -= ((1 / 12) / val);
          type.add("ام الام");
          percent.add(((1 / 12) / val));
          money.add(((1 / 12) / val) * wealth);
        } else if (!mother) {
          print(
              "maternalGrandMother : ${((1 / 6) / val)} it's about ${((1 / 6) / val) * wealth} of total");
          total -= ((1 / 6) / val);
          type.add("ام الام");
          percent.add(((1 / 6) / val));
          money.add(((1 / 6) / val) * wealth);
        }
        swra.contains(11) ? print("") : swra.add(11);
      }
      if (fullSister > 0) {
        if (fullSister == 1 &&
            sons < 1 &&
            daughters < 1 &&
            grandSons < 1 &&
            grandDaughters < 1 &&
            fullBrother < 1 &&
            paternalBrothers < 1) {
          print(
              "fullSister : ${((1 / 2) / val)} it's about ${((1 / 2) / val) * wealth} of total");
          total -= ((1 / 2) / val);
          type.add("اخت شقيقة");
          percent.add(((1 / 2) / val));
          money.add(((1 / 2) / val) * wealth);
          swra.contains(176) ? print("") : swra.add(176);
        } else if (fullSister > 1 &&
            sons < 1 &&
            daughters < 1 &&
            grandSons < 1 &&
            grandDaughters < 1 &&
            fullBrother < 1 &&
            paternalBrothers < 1) {
          for (int i = 0; i < fullSister; i++) {
            print(
                "fullSister : ${((2 / 3) / fullSister / val)} it's about ${((2 / 3) / fullSister / val) * wealth} of total");
            total -= ((2 / 3) / fullSister) / val;
            type.add("اخت شقيقة ${i + 1}");
            percent.add(((2 / 3) / fullSister) / val);
            money.add(((2 / 3) / fullSister) / val * wealth);
          }
          swra.contains(176) ? print("") : swra.add(176);
        }
      }
      if (paternalSisters > 0) {
        if (paternalSisters == 1 &&
            sons < 1 &&
            daughters < 1 &&
            grandSons < 1 &&
            grandDaughters < 1 &&
            fullBrother < 1 &&
            fullSister < 1 &&
            paternalBrothers < 1) {
          print(
              "paternalSisters : ${((1 / 2) / val)} it's about ${((1 / 2) / val) * wealth} of total");
          total -= ((1 / 2) / val);
          type.add("اخت لأب");
          percent.add(((1 / 2) / val));
          money.add(((1 / 2) / val) * wealth);
          swra.contains(176) ? print("") : swra.add(176);
        } else if (paternalSisters > 1 &&
            sons < 1 &&
            daughters < 1 &&
            grandSons < 1 &&
            grandDaughters < 1 &&
            fullBrother < 1 &&
            fullSister < 1 &&
            paternalBrothers < 1) {
          for (int i = 0; i < paternalSisters; i++) {
            print(
                "paternalSisters : ${((2 / 3) / paternalSisters) / val} it's about ${((2 / 3) / paternalSisters) / val * wealth} of total");
            total -= ((2 / 3) / paternalSisters / val);
            type.add("اخت لأب ${i + 1}");
            percent.add(((2 / 3) / paternalSisters / val));
            money.add(((2 / 3) / paternalSisters / val) * wealth);
          }
          swra.contains(176) ? print("") : swra.add(176);
        } else if (fullSister == 1 &&
            sons < 1 &&
            daughters < 1 &&
            grandSons < 1 &&
            grandDaughters < 1 &&
            fullBrother < 1 &&
            paternalBrothers < 1) {
          for (int i = 0; i < paternalSisters; i++) {
            print(
                "paternalSisters : ${((1 / 6) / paternalSisters) / val} it's about ${((1 / 6) / paternalSisters) / val * wealth} of total");
            total -= ((1 / 6) / paternalSisters / val);
            type.add("اخت لأب ${i + 1}");
            percent.add((1 / 6) / paternalSisters / val);
            money.add((1 / 6) / paternalSisters / val * wealth);
          }
          swra.contains(176) ? print("") : swra.add(176);
        }
      }

      if (maternalBrothers > 0 || maternalSisters > 0) {
        if (maternalBrothers + maternalSisters == 1 &&
            grandSons == 0 &&
            sons == 0) {
          if (maternalBrothers == 1) {
            print(
                "maternalBrothers : ${((1 / 6) / val)} it's about ${((1 / 6) / val) * wealth} of total");
            total -= ((1 / 6) / val);
            type.add("اخ لأم");
            percent.add(((1 / 6) / val));
            money.add(((1 / 6) / val) * wealth);
          } else {
            print(
                "maternalSisters : ${((1 / 6) / val)} it's about ${((1 / 6) / val) * wealth} of total");
            total -= ((1 / 6) / val);
            type.add("اخت لأم");
            percent.add(((1 / 6) / val));
            money.add(((1 / 6) / val) * wealth);
          }
          swra.contains(12) ? print("") : swra.add(12);
        } else if (maternalBrothers + maternalSisters > 1 &&
            grandSons == 0 &&
            sons == 0) {
          for (int i = 0; i < maternalBrothers; i++) {
            print(
                "maternalBrothers : ${((1 / 3) / (maternalBrothers + maternalSisters) / val)} it's about ${((1 / 3) / (maternalBrothers + maternalSisters) / val) * wealth} of total");
            total -= ((1 / 3) / (maternalBrothers + maternalSisters) / val);
            type.add("اخ لأم ${i + 1}");
            percent.add(((1 / 3) / (maternalBrothers + maternalSisters) / val));
            money.add(((1 / 3) / (maternalBrothers + maternalSisters) / val) *
                wealth);
          }
          for (int i = 0; i < maternalSisters; i++) {
            print(
                "maternalSisters : ${((1 / 3) / (maternalBrothers + maternalSisters) / val)} it's about ${((1 / 3) / (maternalBrothers + maternalSisters) / val) * wealth} of total");
            total -= ((1 / 3) / (maternalBrothers + maternalSisters) / val);
            type.add("اخت لأم ${i + 1}");
            percent.add(((1 / 3) / (maternalBrothers + maternalSisters) / val));
            money.add(((1 / 3) / (maternalBrothers + maternalSisters) / val) *
                wealth);
          }
          swra.contains(12) ? print("") : swra.add(12);
        }
      }
      if (flag == 0) {
        tasib();
      }
    } else {
      print("ERROR!");
    }
  }
}

extension Ex on double {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
