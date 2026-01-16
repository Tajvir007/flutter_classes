import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/app.dart';

import 'counter_provider.dart';

void main() {
  runApp(

    /**
     * 1. ChangeNotifierProvider: Provider প্যাকেজের একটা widget. কাজ হচ্ছে state (data + logic) পুরো widget tree-তে শেয়ার করা।
     *    provider setup করে
     * 2. _ মানে: BuildContext আছে, কিন্তু এখানে দরকার নাই
     * 3. CounterProvider() = তোমার state class
     * 4. এই object টা memory তে থাকবে যতক্ষণ widget tree alive থাকে
     */

  ChangeNotifierProvider(
        create: (_) => CounterProvider(), // এখানে CounterProvider এর একটা object তৈরি করা হচ্ছে
      child: ProviderCounter(),
    )
  );
}

