import 'package:flutter/material.dart';
import 'package:practice_firebase/view/get_value.dart';
import 'package:practice_firebase/view/routes.dart';
import 'package:practice_firebase/view/shakti_view.dart';

class RouteGenerator{

static Route<dynamic>generateRoute(RouteSettings settings ){

  switch(settings.name){
    case Routes.loginRoute:
    return MaterialPageRoute(builder: ((_)=>ShaktiMan()));
  
  case Routes.notificationRoute:
  return MaterialPageRoute(builder: ((_)=>GetValue()));
default:
return MaterialPageRoute(builder: (_)=>Text("no route found"));


  }


}


}