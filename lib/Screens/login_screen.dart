import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import '../DataClassModels/userdatamodel.dart';
import 'home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

var login_url = "http://52.138.102.35:10895/api/login/authenticate";
var product_url ="http://52.138.102.35:10895/api/commonAPI/productMst_list";

List <Product> p_det = <Product>[];

var u_name = '';
var u_email = '';
var u_available = '';
var u_earned = '';
var u_expiring = '';
var u_redeemed = '';
var u_phone='';

///token
var u_token = '';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // I have named username as email
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String email_input = '';
  String password_input = '';

  //User api call
  Future fetchUserData() async{
    final response = await http.post(Uri.parse(login_url),
    body: {
      "UserName":email_input,
      "Password":password_input,
      "UserType":"C",
      "DeviceType":"android",
      "DeviceToken":"d9dEBLEnW7c:APA91bHgumnxZUtIO-a75R2Lhil5Se5BCmtSSOlObvYHDDb56Y7KJG70E8Knie4-P7s2w0ga5e-FqAT6LRd5JydVdJZKlNl2C1holrqAUW6jCk316odO7CFCHcqrRJLHd70Z8iDqII-t"
      }
    );
    if(response.statusCode == 200){
      Welcome list =  Welcome.fromJson(jsonDecode(response.body));

      //Storing api data to global var
      u_name =((list.data[0].firstName) +" "+ (list.data[0].lastName)).toString() ;
      u_email = list.data[0].email.toString();
      u_available = list.data[0].totalPointsAvailable.toString();
      u_earned =list.data[0].totalPointsEarned.toString();
      u_expiring = list.data[0].totalPointsExpiring.toString();
      u_redeemed = list.data[0].totalPointsRedeemed.toString();
      u_phone= list.data[0].contactNo.toString();
      u_token = list.token.toString();

      Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
    else{
      Fluttertoast.showToast(
        msg: 'Please input login details properly',
        backgroundColor: Colors.grey,
      );
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 5,left: 5),
          child: IconButton(
            iconSize: 30,
            icon: Icon(Icons.arrow_back,
              color:Color(0xFFF5CC00),
            ),
            onPressed: () {},
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text("User Login",
            style: TextStyle(
              color: Color(0xFFF5CC00),
              fontSize: 25,
            ),),
        ),
      ),

      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 35,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //Login Text
              Text('Login',
                style: TextStyle(
                  color: Color(0xFFF5CC00),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),),

              SizedBox(height: 40,),

              //Username Block
              TextField(
                  controller: email,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_sharp, color: Color(0xFFF5CC00),),
                    labelText: "User Name",
                    labelStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),textInputAction: TextInputAction.next
              ),

              SizedBox(height: 20,),

              //Password Block
              TextField(
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Color(0xFFF5CC00),),
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: Colors.grey[600],
                    ),
                    enabledBorder: myinputborder(),
                    focusedBorder: myfocusborder(),
                  ),textInputAction: TextInputAction.done,
              ),

              SizedBox(height: 20,),

              //Login Button
              Container(
                padding: EdgeInsets.symmetric(vertical: 25),
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('LOGIN'
                    ,style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                  onPressed: () {

                    ///Calling user api
                    email_input = email.text;
                    password_input = password.text;
                    fetchUserData();
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    padding: EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    primary: Color(0xFFF5CC00),

                  ),

                ),
              ),

              //Decoration for UI
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? ",
                    style: TextStyle(
                      color:Colors.grey[600],
                    ),),
                  Text("Create Account",
                    style: TextStyle(
                      //decoration: TextDecoration.underline,
                      color:Color(0xFFF5CC00),
                    ),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Decoration for UI
OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
  return OutlineInputBorder( //Outline border type for TextFeild
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color:Color(0xFF0091E2),
        width: 1,
      )
  );
}

OutlineInputBorder myfocusborder(){
  return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color:Color(0xFF0091E2),
        width: 1,
      )
  );
}

//Product details class
class Product{
  Product({required this.p_name,required this.p_image,required this.p_points});
  final String p_points;
  final String? p_name;
  final String? p_image;
}