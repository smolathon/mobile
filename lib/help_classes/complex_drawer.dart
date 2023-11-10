import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smolathon_mobile/help_classes/exports.dart';
import 'package:smolathon_mobile/router/router.dart';
import 'package:smolathon_mobile/widgets/exports.dart';

class ComplexDrawer extends StatefulWidget {
  const ComplexDrawer({Key? key}) : super(key: key);

  @override
  _ComplexDrawerState createState() => _ComplexDrawerState();
}

class _ComplexDrawerState extends State<ComplexDrawer> {
  int selectedIndex = -1;

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      child: row(),
      color: Colors.transparent,
    );
  }

  Widget row() {
    return Row(children: [
      isExpanded ? blackIconTiles() : blackIconMenu(),
      invisibleSubMenus(),
    ]);
  }

  Widget blackIconTiles() {
    return Container(
      width: 200,
      color: MyColor.complexDrawerBlueGrey,
      child: Column(
        children: [
          controlTile(),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (BuildContext context, int index) {
                  CDM cdm = cdms[index];
                  bool selected = selectedIndex == index;
                  return ExpansionTile(
                    onExpansionChanged: (z) {
                      setState(() {
                        selectedIndex = z ? index : -1;
                        if (cdms[index].submenus.isEmpty) {
                          //изменить и делать действия если нет subMenu (раскрытое меню)
                          if (cdms[index].title == 'Dashboard') {
                            //что то
                          }
                        } else {
                          //пупупу
                        }
                      });
                    },
                    leading: Icon(cdm.icon, color: Colors.white),
                    title: Text(
                      cdm.title,
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: cdm.submenus.isEmpty
                        ? null
                        : Icon(
                            selected
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.white,
                          ),
                    children: cdm.submenus.map((subMenu) {
                      return subMenuButton(subMenu, false, cdm.title);
                    }).toList(),
                  );
                }),
          ),
          accountContainer(),
        ],
      ),
    );
  }

  Widget controlTile() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: CustomSvgIcon(
        //Лого у раскрытом меню
        imagePath: 'assets/svg/istoki_logo_with_text.svg',
        onTap: expandOrShrinkDrawer,
        color: Colors.white,
      ),
    );
  }

  Widget blackIconMenu() {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: 100,
      color: MyColor.complexDrawerBlueGrey,
      child: Column(
        children: [
          controlButton(),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (contex, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        if (cdms[index].submenus.isEmpty) {
                          //изменить и делать действия если нет subMenu (сдвинутое меню)
                          if (cdms[index].title == 'Dashboard') {
                            //что то
                          }
                        } else {
                          //пупупу
                        }
                      });
                    },
                    child: Container(
                      height: 45,
                      alignment: Alignment.center,
                      child: Icon(cdms[index].icon, color: Colors.white),
                    ),
                  );
                }),
          ),
          accountButton(),
        ],
      ),
    );
  }

  Widget invisibleSubMenus() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: isExpanded ? 0 : 125,
      color: Colors.transparent,
      child: Column(
        children: [
          Container(height: 95),
          Expanded(
            child: ListView.builder(
                itemCount: cdms.length,
                itemBuilder: (context, index) {
                  CDM cmd = cdms[index];
                  bool selected = selectedIndex == index;
                  bool isValidSubMenu = selected && cmd.submenus.isNotEmpty;
                  return subMenuWidget(
                      [cmd.title]..addAll(cmd.submenus), isValidSubMenu);
                }),
          ),
        ],
      ),
    );
  }

  Widget controlButton() {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 30),
      child: InkWell(
        onTap: expandOrShrinkDrawer,
        child: Container(
          height: 45,
          alignment: Alignment.center,
          child: CustomSvgIcon(
            //Лого в закрытом меню
            imagePath: 'assets/svg/istoki_logo.svg',
            color: Colors.white,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }

  Widget subMenuWidget(List<String> submenus, bool isValidSubMenu) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: isValidSubMenu ? submenus.length.toDouble() * 37.5 : 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isValidSubMenu
              ? MyColor.complexDrawerBlueGrey
              : Colors.transparent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: ListView.builder(
          padding: EdgeInsets.all(6),
          itemCount: isValidSubMenu ? submenus.length : 0,
          itemBuilder: (context, index) {
            String subMenu = submenus[index];
            return subMenuButton(subMenu, index == 0, submenus[0]);
          }),
    );
  }

  void expandOrShrinkDrawer() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  Widget subMenuButton(String subMenu, bool isTitle, String menuTitle) {
    return InkWell(
      onTap: () {
        //делать в категориях
        if (menuTitle == 'Профиль') {
          if (subMenu == 'Регистрация') {
            AutoRouter.of(context).replace(SignUpRoute());
          } else if (subMenu == 'Вход') {
            AutoRouter.of(context).replace(SignInRoute());
          }
        }
        if (menuTitle == 'Category' && subMenu == "HTML & CSS") {
          //что то
        } else if (menuTitle == 'Category' && subMenu == "Javascript") {
          AutoRouter.of(context).replace(SecondRoute());
        } else if (menuTitle == 'Posts' && subMenu == "Add") {
          // Обработка нажатия на "Add" в разделе "Posts"
        } else {
          // Добавьте дополнительные условия для других элементов меню
        }
        if (menuTitle == 'Dashboard') {
          //что то
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          subMenu,
          style: TextStyle(
            fontSize: isTitle ? 17 : 14,
            color: isTitle ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget accountButton({bool usePadding = true, VoidCallback? onTap}) {
    return Padding(
      padding: EdgeInsets.all(usePadding ? 8 : 0),
      child: InkWell(
        onTap: () {
          AutoRouter.of(context).replace(ProfileRoute());
        }, // Передаем функцию обратного вызова для обработки нажатия
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            color: Colors.white70,
            image: DecorationImage(
              image: NetworkImage(
                  'https://i.ytimg.com/vi/OgGGaX7rOpw/maxresdefault.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }

  Widget accountContainer() {
    return Container(
      color: MyColor.complexDrawerBlueGrey,
      child: InkWell(
        child: ListTile(
          leading: accountButton(
            usePadding: false,
          ),
          title: Text(
            "Костя",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            "Программист от бога",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          AutoRouter.of(context).replace(ProfileRoute());
        },
      ),
    );
  }

  static List<CDM> cdms = [
    // CDM(Icons.grid_view, "Control", []),

    CDM(Icons.face, "Профиль", ["Регистрация", "Вход"]),
    CDM(Icons.grid_view, "Dashboard", []),
    CDM(Icons.subscriptions, "Category",
        ["HTML & CSS", "Javascript", "PHP & MySQL"]),
    CDM(Icons.markunread_mailbox, "Posts", ["Add", "Edit", "Delete"]),
    CDM(Icons.pie_chart, "Analytics", []),
    CDM(Icons.trending_up, "Chart", []),

    CDM(Icons.power, "Plugins",
        ["Ad Blocker", "Everything Https", "Dark Mode"]),
    CDM(Icons.explore, "Explore", []),
    CDM(Icons.settings, "Setting", []),
  ];
}
