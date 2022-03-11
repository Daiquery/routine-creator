import 'package:organization_app/classes/routine.dart';
import 'package:organization_app/classes/task.dart';

var task1 = new Task("Brush Teeth", Duration(minutes: 4), false);
var task2 = new Task("Shower - Wash", Duration(minutes: 5), false);
var task3 = new Task("Shower - Rinse", Duration(minutes: 3), false);
var task4 = new Task("Dry Off", Duration(minutes: 2), false);
var task5 = new Task("Get Dressed", Duration(minutes: 5), false);
var routine1 = new Routine("Morning Routine", Duration(minutes: 19), 5,
    [task1, task2, task3, task4, task5]);

final List routines = [routine1];
