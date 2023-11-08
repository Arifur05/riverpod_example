import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/app/home_screen/provider/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {  

              return  Column(
                children: [
                  TextFormField(controller: ref.watch(homeProvider.notifier).emailController,),
                  const SizedBox(height: 10,),
                  TextFormField(controller: ref.watch(homeProvider.notifier).passwordController,),
                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    ref.watch(homeProvider.notifier).getEmails(ref.read(homeProvider.notifier).emailController.text);
                    ref.watch(homeProvider.notifier).getPassword(ref.read(homeProvider.notifier).passwordController.text);
                    ref.watch(homeProvider.notifier).submitUser();
                  }, style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                      child: Text('Add', style: TextStyle(color: Colors.white),)),
                  ref.read(homeProvider).email != null ?
                  Column(children: [
                    Text(ref.watch(homeProvider).email!,style: TextStyle(color: Colors.black)),
                    Text(ref.watch(homeProvider).password!),
                  ],): SizedBox()
                ],
              );
            },
         
          ),
        ),
      ),
    );
  }

}