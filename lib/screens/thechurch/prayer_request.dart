import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:yourdailylight/models/prayer_request_mdl.dart';
import 'package:yourdailylight/screens/thechurch/add_prayer_request.dart';
import 'package:yourdailylight/utils/utils.dart';

import '../../auth/LoginScreen.dart';
import '../../i18n/strings.g.dart';
import '../../models/Userdata.dart';
import '../../providers/AppStateManager.dart';
import '../../providers/PrayerScreensModel.dart';
import '../../utils/my_colors.dart';
import '../../widgets/widget_church.dart';
import '../NoitemScreen.dart';

class PrayerRequest extends StatefulWidget {
  const PrayerRequest({Key? key}) : super(key: key);

  @override
  State<PrayerRequest> createState() => _PrayerRequestState();
}

class _PrayerRequestState extends State<PrayerRequest> {
  late AppStateManager appManager;
  bool isUserLogin = false;
  String mUserEmail = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   // init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Correct: Access Provider here
    //final appState = Provider.of<AppStateManager>(context, listen: false);
    // Perform any setup with appState if needed
    init();
  }


  void init() async {
    //check if user is currently login
    appManager = Provider.of<AppStateManager>(context, listen: false);
    Userdata? userdata = appManager.userdata;
    if(userdata != null && userdata.email != ""){
      isUserLogin = true;
      mUserEmail = userdata.email!;
      print('user is logged in ');
    }else{
      isUserLogin = false;
    }

  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    init();
    return ChangeNotifierProvider(
      create: (context) => PrayerScreensModel(Provider.of<AppStateManager>(context, listen: false).userdata),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(t.prayer_request, style: secondaryTextStyle(color: Colors.white),),
        ),
        body: isUserLogin ? Padding(
          padding: EdgeInsets.only(top: 12),
          child: BookScreenBody(),
        ): Center(
          child: Text(t.login_request, style: TextStyle(fontSize: 18),),
        ),
        bottomNavigationBar:
        isUserLogin ?
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: sSAppButton(
                  color: MyColors.accentDark,
                  context: context,
                  title: 'Create Prayer or Testimony ',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AddPrayerRequest()));
                  },
                ),
              ),
            ],
          ),
        )

            : Container(
          padding: EdgeInsets.only(left: 32, right: 16),
          child: sSAppButton(
            color: MyColors.accentDark,
            context: context,
            title: t.login_request,
            onPressed: () {
              // Navigator.of(context).pop();
              Navigator.pushNamed(
                  context, LoginScreen.routeName);
            },
          ),
        ),

      ),
    );
  }
}


class BookScreenBody extends StatefulWidget {
  @override
  NewsScreenBodyRouteState createState() => new NewsScreenBodyRouteState();
}

class NewsScreenBodyRouteState extends State<BookScreenBody> {
  late PrayerScreensModel prayerScreensModel;
  List<PrayerRequestMdl>? items;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PageController? pageController;
  int pageIndex = 0;



  void _onRefresh() async {
    prayerScreensModel.loadItems();
  }

  void _onLoading() async {
    prayerScreensModel.loadMoreItems();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      Provider.of<PrayerScreensModel>(context, listen: false).loadItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    prayerScreensModel = Provider.of<PrayerScreensModel>(context);
    items = prayerScreensModel.mediaList;
     print('isError --->> ${prayerScreensModel.isError}');

    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      footer: CustomFooter(
        builder: (BuildContext context, LoadStatus? mode) {
          Widget body;
          if (mode == LoadStatus.idle) {
            body = Text(t.pulluploadmore, style: TextStyle(fontSize: 18, color: MyColors.primary),);
          } else if (mode == LoadStatus.loading) {
            body = CupertinoActivityIndicator();
          } else if (mode == LoadStatus.failed) {
            body = Text(t.loadfailedretry);
          } else if (mode == LoadStatus.canLoading) {
            body = Text(t.releaseloadmore, style: TextStyle(fontSize: 18, color: MyColors.primary),);
          } else {
            body = Text(t.nomoredata, style: TextStyle(fontSize: 18, color: MyColors.primary),);
          }
          return Container(
            height: 55.0,
            child: Center(child: body),
          );
        },
      ),
      controller: prayerScreensModel.refreshController,
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      child: (prayerScreensModel.isError == true && items!.length == 0)
          ? NoitemScreen(
          title: t.empty, message: t.send_prayer, onClick: _onRefresh)
          : ListView.builder(
        itemCount: items!.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return PrayerItemTile(
            mediaList: items!,
            index: index,
            object: items![index],
          );
        },
      ),
    );
  }
}



class PrayerItemTile extends StatefulWidget {
  final PrayerRequestMdl object;
  final List<PrayerRequestMdl> mediaList;
  final int index;

  const PrayerItemTile({
    Key? key,
    required this.mediaList,
    required this.index,
    required this.object,
  }) : super(key: key);

  @override
  _PryItemTileState createState() => _PryItemTileState();
}

class _PryItemTileState extends State<PrayerItemTile> {
  @override
  Widget build(BuildContext context) {
    PrayerRequestMdl mData = widget.object;
    return Padding(
      padding: EdgeInsets.only(top: 2, bottom: 2, left: 4, right: 4),
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            ListTile(
            //  leading: Icon(Icons.info),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrayerRequestDetails(prayerRequest : mData)));
              },
              title:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.object.title!,style: boldTextStyle(size: 16),).paddingOnly(left: 8.0, right: 8, top: 8),
                  Text(widget.object.content!.length >15? "${widget.object.content!.substring(0,14)}..." : widget.object.content!, style: secondaryTextStyle(),).paddingOnly(left: 8.0, right: 8, top: 8),
                ],
              ),
              subtitle:Text(Utils.kmDateFormatter(widget.object.dmo!), style: secondaryTextStyle(size: 13),).paddingOnly(left: 8.0, right: 8, top: 8),
              trailing: Icon(widget.object.response == ""? Icons.help : Icons.verified, color: widget.object.response == ""? Colors.orange: Colors.green,),

            ).expand(),
          ],
        ).paddingAll(8.0),
      ),
    );


  }
}




class PrayerRequestDetails extends StatelessWidget {
   PrayerRequestDetails({super.key, required this.prayerRequest});
   PrayerRequestMdl prayerRequest;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title:  Text("Details", style: secondaryTextStyle(color: Colors.white),),
      ),
      body:Container(
        color: Colors.white,
        child: Stack(
            children: [
              //BackGroundLayer(name: AppConfigData.backG),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      //mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(height: 16,),

                         Container(
                           padding: EdgeInsets.all(8),
                           decoration: BoxDecoration(
                             border: Border.all(color: MyColors.grey_90, width: 1,)
                           ),
                           child: Column(
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.end,
                                 children: [
                                   Icon(Icons.help,
                                     color:  Colors.orange,),
                                   Center(
                                     child: Text(" Request" ,
                                       style: TextStyle(
                                           color: Colors.orange,
                                           fontSize: 16,
                                           fontWeight: FontWeight.w400
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               SizedBox(height: 16,),
                               Center(
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text(prayerRequest.title??"" ,
                                    style: TextStyle(
                                        color: MyColors.accentDark,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400
                                    ),
                                                               ),
                                 ),
                               ),

                               SizedBox(height: 16,),

                               Center(
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Text(prayerRequest.content??"" ,
                                     style: TextStyle(
                                         color: MyColors.accentDark,
                                         fontSize: 16,
                                         fontWeight: FontWeight.w400
                                     ),
                                   ),
                                 ),
                               ),
                             ],
                           ),
                         ), //Create Account

                        //Create Account
                        SizedBox(height: 16,),

                        Center(child: Text("Date: ${Utils.kmDateFormatter(prayerRequest.dmo!)}"?? "", style: secondaryTextStyle(),)),
                        SizedBox(height: 20,),

                        20.height,
                       /* prayerRequest.response == "" ?
                        Center(child: Text("Requests has not be answer, \n Please Try checking later ", style: TextStyle(color: Colors.red),))
                            :*/
                        Card(
                            elevation: 8,
                            child: Padding(
                                padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                                child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                        Icon(Icons.verified,
                                          color:  Colors.green,),
                                          Center(
                                            child: Text(" Response" ,
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      24.height,
                                       prayerRequest.response == "" ?
                        Center(child: Text("Requests has not be answer, \n Please Try checking later ", style: TextStyle(color: Colors.red),))
                            :
                                    Text(prayerRequest.response??"" ,
                                        style: TextStyle(
                                            color: MyColors.accentDark,
                                            fontSize: 23,
                                            fontWeight: FontWeight.w400
                                        ),),
                                      16.height,

                                      24.height,
                                    ]
                                )
                            )
                        ),



                        SizedBox(height: 40,), //space out

                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: MyColors.accent,
                                        border:
                                        Border.all(color: Colors.white, width: 2)
                                    ),
                                    child:  Text('Back',
                                        textAlign: TextAlign.center,
                                        style:  primaryTextStyle(color: Colors.white) )
                                )
                            ),
                          ),
                        ), //LOGIN BUTTON

                        SizedBox(height:50,), //space out


                      ],
                    ),
                  ),
                ),
              ),
            ]),
      )

    );
  }
}
