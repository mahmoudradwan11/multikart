import 'package:flutter/material.dart';
import 'package:multikart/shared/styles/colors.dart';

class ApplyCoupon extends StatelessWidget {
  const ApplyCoupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'Coupons',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
                Container(
          color: Colors.grey[100],
            height:50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Apply Coupons',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  prefixIcon: Icon(Icons.discount),
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children:[
                          const Text(
                            'MULTIKART10',style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Jannah'
                          ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.grey[100],
                            child: const Text('Save20%'),
                          ),
                          const Spacer(),
                          MaterialButton(onPressed:(){},child:const Text('APPLY',style: TextStyle(color: defaultColor),),)

                        ],
                      ),
                      Text('Use code MULTIKART10 to get flat 10% off on minimum order of \$200.00. Offer valid for first time users only'
                        ,style: TextStyle(fontFamily: 'Jannah',color: Colors.grey[500]),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                height: 10,
              ),
                Container(
                  height: 1,
                  color: Colors.grey[200],
                ),
                Container(
                child: Column(
                  children: [
                    Row(
                      children:[
                        const Text(
                          'WELCOME',style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Jannah'
                        ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Colors.grey[100],
                          child: const Text('Save22%'),
                        ),
                        const Spacer(),
                        MaterialButton(onPressed:(){},child:const Text('APPLY',style: TextStyle(color: defaultColor),),)

                      ],
                    ),
                    Text(
                  'Use code WELCOME to get flat 10% off on minimum order of \$220.00. Offer valid for first time users only',
                      style: TextStyle(fontFamily: 'Jannah',color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
                const SizedBox(
                height: 10,
              ),
                Container(
                height: 1,
                color: Colors.grey[200],
              ),
                Container(
                child: Column(
                  children: [
                    Row(
                      children:[
                        const Text(
                          'LUCKY50',style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Jannah'
                        ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Colors.grey[100],
                          child: const Text('Save32%'),
                        ),
                        const Spacer(),
                        MaterialButton(onPressed:(){},child:const Text('APPLY',style: TextStyle(color: defaultColor),),)

                      ],
                    ),
                    Text(
                      'Use code LUCKY50 to get flat 10% off on minimum order of \$320.00. Offer valid for first time users only',
                      style: TextStyle(fontFamily: 'Jannah',color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
                const SizedBox(
                height: 10,
              ),
                Container(
                height: 1,
                color: Colors.grey[200],
              ),
                Container(
                child: Column(
                  children: [
                    Row(
                      children:[
                        const Text(
                          'SUMMERSALE',style: TextStyle(
                            fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'Jannah'
                        ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          color: Colors.grey[100],
                          child: const Text('Save15%'),
                        ),
                        const Spacer(),
                        MaterialButton(onPressed:(){},child:const Text('APPLY',style: TextStyle(color: defaultColor),),)

                      ],
                    ),
                    Text(
                      'Use code SUMMERSALE to get flat 10% off on minimum order of \$150.00. Offer valid for first time users only',
                      style: TextStyle(fontFamily: 'Jannah',color: Colors.grey[500]),
                    )
                  ],
                ),
              ),
                const SizedBox(
                height: 10,
              ),
                Container(
                height: 1,
                color: Colors.grey[200],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
