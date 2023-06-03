
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'package:tood/constant.dart';
import 'package:flutter/material.dart';
class MyWidget extends StatelessWidget {
    const MyWidget({super.key,
    required this.liveID , 
    this.isHost = false, 
    required this.userID, 
    required this.userName});
  
    
  final String liveID;
  final bool isHost;
  final String userID;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    
    ZegoUIKitPrebuiltLiveStreaming(

      appID: Constants.appId, 
     
      appSign: Constants.appSign, 
   
      userID: userID, 
      userName: userName, 
      liveID: liveID, 
      
      config: isHost ? ZegoUIKitPrebuiltLiveStreamingConfig.host():
      ZegoUIKitPrebuiltLiveStreamingConfig.audience()));
  }
}
