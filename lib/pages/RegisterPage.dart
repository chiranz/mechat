import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechat/blocs/authentication/AuthenticationBloc.dart';
import 'package:mechat/blocs/authentication/Bloc.dart';
import 'package:mechat/config/Palette.dart';
import 'package:mechat/config/Transitions.dart';
import 'package:mechat/pages/GoogleSignInPage.dart';
import 'package:mechat/pages/UserDetailsPage.dart';
import 'package:mechat/widgets/CircleIndicator.dart';
import 'package:mechat/widgets/ConversationPageSlide.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  int currentPage = 0;
  PageController pageController = PageController();
  // Fields related to animation of the gradient.
  Alignment begin = Alignment.center;
  Alignment end = Alignment.bottomRight;
  // Bloc
  AuthenticationBloc authenticationBloc;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    pageController.addListener(() {
      setState(() {
        begin = Alignment(pageController.page, pageController.page);
        end = Alignment(1 - pageController.page, 1 - pageController.page);
      });
    });
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    authenticationBloc.listen((state) {
      print("Current state $state");
      if (state is Authenticated) {
        updatePageState(1);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: begin, end: end, colors: [
              Palette.gradientStartColor,
              Palette.gradientEndColor
            ])),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                AnimatedContainer(
                  duration: Duration(microseconds: 1500),
                  child: PageView(
                    controller: pageController,
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (int page) => updatePageState(page),
                    children: [
                      GoogleSignInPage(
                        updatePageState: updatePageState,
                      ),
                      UserDetailsPage()
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 2; i++)
                        CircleIndicator(i == currentPage)
                    ],
                  ),
                ),
                AnimatedOpacity(
                  opacity: currentPage == 1 ? 1.0 : 0.0,
                  duration: Duration(microseconds: 500),
                  child: Container(
                    margin: EdgeInsets.only(right: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FloatingActionButton(
                          onPressed: () => navigateToHome(),
                          elevation: 0,
                          backgroundColor: Palette.primaryColor,
                          child: Icon(
                            Icons.done,
                            color: Palette.accentColor,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    if (currentPage == 1) {
      pageController.previousPage(
          duration: Duration(microseconds: 300), curve: Curves.easeOut);

      return false;
    }
    return true;
  }

  updatePageState(index) {
    if (index == 1) {
      pageController.nextPage(
          duration: Duration(microseconds: 300), curve: Curves.linear);
    }
    setState(() {
      currentPage = index;
    });
  }

  navigateToHome() {
    Navigator.push(context, SlideLeftRoute(page: ConversationPageSlide()));
  }
}
