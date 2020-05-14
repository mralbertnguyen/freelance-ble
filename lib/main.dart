import 'package:the_third/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, unselectedWidgetColor: Colors.white),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (_) => new HomeScreen(),
        "/verify": (_) => new HomeScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        // ignore: missing_return
        builder: (context, state) {
          if (state is AuthInitial) {
            return SplashScreen();
          }

          if (state is AuthUnAuthenticate) {
            return SplashScreen();
          }

          if (state is AuthAuthenticated) {
            return HomeScreen();
          }
        },
      ),
    );
  }
}
