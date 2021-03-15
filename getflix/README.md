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

## Provider

[Simple app state management](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple)

Now that you know about declarative UI programming and the difference between ephemeral and app state, you are ready to learn about simple app state management.

On this page, we are going to be using the provider package. If you are new to Flutter and you don’t have a strong reason to choose another approach (Redux, Rx, hooks, etc.), this is probably the approach you should start with. The provider package is easy to understand and it doesn’t use much code. It also uses concepts that are applicable in every other approach.

That said, if you have a strong background in state management from other reactive frameworks, you can find packages and tutorials listed on the options page.


Contents needs to live in MyApp. Whenever it changes, it rebuilds MyCart from above (more on that later). Because of this, MyCart doesn’t need to worry about lifecycle—it just declares what to show for any given contents. When that changes, the old MyCart widget disappears and is completely replaced by the new one.

<img src="https://flutter.dev/assets/development/data-and-backend/state-mgmt/simple-widget-tree-with-cart-7665e5a1a8bfdc2c04f2cb6dcb59dabbf0291dc44b8b7f08f6a2e798e6080c9c.png" width="500" />
