import 'package:flutter/material.dart';
import 'package:task/Screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

//user data list
List<UserDetials> userlist = <UserDetials>[
  UserDetials(uicon:Icons.account_circle_sharp, det:"First Name", udet:u_name.split(" ")[0]),
  UserDetials(uicon: Icons.account_circle_sharp, det:"Last Name", udet:u_name.split(" ")[1]),
  UserDetials(uicon: Icons.email_outlined, det:"Email ID", udet:u_email),
  UserDetials(uicon: Icons.wifi_calling_3, det:"Phone", udet:u_phone),

];


class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:30),
              child: ListTile(
                title: const Text('Log Out',style: TextStyle(fontSize: 20),),
                onTap: () {
                  /// Clearing all Data
                  p_det.clear();
                  u_token = '';
                  u_name = '';
                  u_email = '';
                  u_available = '';
                  u_earned = '';
                  u_expiring = '';
                  u_redeemed = '';
                  u_phone = '';

                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Text("Tap on Log Out to return login screen"),
            )
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text("User Profile",style: TextStyle(color: Colors.black),),
      ),

      body: Column(
        children: [
          //Profile Pic
          Padding(
            padding: const EdgeInsets.only(top:20,bottom: 20),
            child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/img_1.png')),
          ),

          //Listview
          SizedBox(
            height:279,
            child: ListView.builder(
              physics:NeverScrollableScrollPhysics(),
                itemCount: userlist.length,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom:8),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right:10),
                                  child: Icon(userlist[index].uicon,size:45,color: Colors.grey,),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(userlist[index].det,style: TextStyle(fontSize:16),),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Text(userlist[index].udet,style: TextStyle(fontSize:20),),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 2,
                            thickness: 1,
                            color: Colors.grey[400],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),

          //Static Container
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom:8),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:10,right:10),
                          child: Icon(Icons.lock_outline,size:45,color: Colors.grey,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Change Password",style: TextStyle(fontSize:20),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:86,right: 10),
                    child: Divider(
                      height: 2,
                      thickness: 1,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Login Button
          Container(
            padding: EdgeInsets.fromLTRB(10,46, 10,10),
            width: double.infinity,
            child: ElevatedButton(
              child: Text('Submit'
                ,style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),),
              onPressed: () {
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
        ],
      ),
    );
  }
}

class UserDetials {
  UserDetials({required this.uicon,required this.det, required this.udet});
  final IconData uicon;
  final String det;
  final String udet;
}
