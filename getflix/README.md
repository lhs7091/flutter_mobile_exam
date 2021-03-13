# getflix

Netflix Clone Project.

- [Design Reference: Sopheamen Van](https://youtu.be/zaPLWwWpZlM)
- [Movie API: The Movie DB](https://developers.themoviedb.org/) 

## BottomNavigation 

A material widget that's displayed at the bottom of an app for selecting among a small number of views, typically between three and five.

When I change screen through this navigation bar,   
we can use IndexedStack Widget.

<p float="left">
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/getflix/result/home1.png" width="150" />
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/getflix/result/coming1.png" width="150" /> 
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/getflix/result/search1.png" width="150" />
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/getflix/result/download1.png" width="150" />
</p>

- [IndexedStack Widget](https://api.flutter.dev/flutter/widgets/IndexedStack-class.html)

```
IndexedStack(
    index: activeTab,
    children: [
        HomeScreen(),
        Center(
            child: Text('coming soon screen',
                style: TextStyle(color: Colors.white))),
        Center(
            child:
                Text('search screen', style: TextStyle(color: Colors.white))),
        Center(
            child: Text('downloads screen',
                style: TextStyle(color: Colors.white))),
    ],
);
```


