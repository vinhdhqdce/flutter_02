/*
Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
RaisedButton(
onPressed: () {
Navigator.of(context).popUntil((route) => route.isFirst);
},
child: Text('Go to 1'),
),
RaisedButton(
onPressed: () {
var count = 0;
Navigator.of(context).popUntil((route) => count++ == 2);

// Navigator.of(context).popUntil((route){
//   return route.settings.name == 'zxc';
// });
},
child: Text('Go to 2'),
),
],
),*/
