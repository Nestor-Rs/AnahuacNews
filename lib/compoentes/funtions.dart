import 'package:flutter/material.dart';

void changeScreen(BuildContext context, StatelessWidget screen,int typeChange) {
  switch (typeChange) {
    case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));   
      break;
  }
}
