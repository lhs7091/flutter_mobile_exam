# food_bill

Refer to [dribbble.com](https://dribbble.com/shots/15206307-Food-Bill-Split-App/attachments/6950727?mode=media)  
<img src="https://cdn.dribbble.com/users/758684/screenshots/15206307/media/d0d98f418af6ca5f029c575981d45dc8.jpg" width="400" />  
Refer to [Dream Walker](https://youtu.be/U9IsC3fUrI4)



## SideMenu bar

<p float="left">
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/food_bill/assets/images/1.png" width="150" />
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/food_bill/assets/images/2.png" width="150" /> 
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/food_bill/assets/images/3.png" width="150" />
  <img src="https://github.com/lhs7091/flutter_mobile_exam/blob/main/food_bill/assets/images/4.png" width="150" />
</p>

```
Widget buildSideMenuBar() {
    return Container(
        width: 48,
        height: MediaQuery.of(context).size.height / 1.4,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
                buildSideMenu("WE'RE GOING", 0),
                buildSideMenu("FOOD ITEM", 1),
                buildSideMenu("TOTAL BILLS", 2),
                buildSideMenu("FRIENDS", 3),
            ],
        ),
    );
}

Widget buildSideMenu(String _title, int navTab) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _navTabIndex = navTab;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: _navTabIndex == navTab ? Colors.black : Colors.white,
            border: Border.all(
              color: Colors.grey[400],
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Center(
            child: RotatedBox(
              quarterTurns: 1,
              child: Text(
                _title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: _navTabIndex == navTab ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
```
