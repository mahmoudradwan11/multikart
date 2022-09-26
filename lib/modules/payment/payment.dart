import 'package:flutter/material.dart';
import 'package:multikart/shared/components/components.dart';

class Payment extends StatelessWidget{
   Payment({Key? key,this.price}) : super(key: key);
   var price;
   TextEditingController visaController = TextEditingController();
   TextEditingController addressController = TextEditingController();
   @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text('Payment',style: TextStyle(fontSize: 25),),
          actions:const[
            Image(image: NetworkImage('https://lofrev.net/wp-content/photos/2016/07/visa_logo_7.jpg'),
            ),
          ],
        ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:[
            const Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation:1.0,
            margin:EdgeInsets.all(0.8),
            child:Image(image: NetworkImage('https://i.pinimg.com/originals/15/32/28/15322896aa670acff31c2e171dcd9bfb.jpg'),)
            ),
              buildTextForm(
                context,
                buttonController: visaController,
                title: 'Visa ',
                MediaQuery.of(context).size.height * 0.07,
              ),
              buildTextForm(
                context,
                buttonController: addressController,
                title: 'Address ',
                MediaQuery.of(context).size.height * 0.07,
              ),
              const SizedBox(height: 190,),
              Container(
                child:Row(
                  children:[
                    Text('\$$price.00',style:const TextStyle(color: Colors.black,fontSize: 20)
                    ),
                  const Spacer(),
                  defButton(function:(){
                    showToast('Order Will Arrived after 24 Hours', ToastStates.SUCCESS);
                  }, text:'Buy now',width: 150),
          ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}