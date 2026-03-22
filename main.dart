import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GamePage(),
    );
  }
}

class Pipe {
  double x;
  double height;
  bool scored;
  Pipe(this.x, this.height, {this.scored = false});
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  // Madár koordináták
  double birdY = 0;
  double velocity = 0;
  double gravity = 800; // pixels/sec^2
  double jumpVelocity = -250; // pixels/sec
  late Timer gameTimer;

  // Képernyő méretek
  late double screenWidth;
  late double screenHeight;

  bool gameStarted = false;
  int score = 0;

  // Csövek
  List<Pipe> pipes = [];
  double pipeWidth = 60;
  double pipeGap = 200; // elég széles rés a csövek között
  double pipeSpeed = 150; // pixels/sec

  double birdSize = 40;

  @override
  void initState() {
    super.initState();
  }

  void startGame() {
    gameStarted = true;
    birdY = screenHeight / 2 - birdSize / 2;
    score = 0;

    // Csövek inicializálása
    pipes = [
      Pipe(screenWidth + 100, randomPipeHeight()),
      Pipe(screenWidth + 300, randomPipeHeight()),
      Pipe(screenWidth + 500, randomPipeHeight()),
    ];

    gameTimer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      double dt = 0.016; // 16ms
      velocity += gravity * dt;
      birdY += velocity * dt;

      // Csövek mozgatása
      for (var pipe in pipes) {
        pipe.x -= pipeSpeed * dt;
        if (pipe.x < -pipeWidth) {
          pipe.x = screenWidth;
          pipe.height = randomPipeHeight();
          pipe.scored = false;
        }
      }

      // Hitbox ellenőrzés
      Rect birdRect = Rect.fromLTWH(screenWidth / 4, birdY, birdSize, birdSize);
      for (var pipe in pipes) {
        Rect topPipe = Rect.fromLTWH(pipe.x, 0, pipeWidth, pipe.height);
        Rect bottomPipe = Rect.fromLTWH(pipe.x, pipe.height + pipeGap, pipeWidth, screenHeight - pipe.height - pipeGap);
        if (birdRect.overlaps(topPipe) || birdRect.overlaps(bottomPipe)) {
          timer.cancel();
          gameOver();
        }

        // Pontszám
        if (!pipe.scored && pipe.x + pipeWidth < screenWidth / 4) {
          score++;
          pipe.scored = true;
        }
      }

      // Képernyő alja/felső széle
      if (birdY < 0 || birdY + birdSize > screenHeight) {
        timer.cancel();
        gameOver();
      }

      setState(() {});
    });
  }

  double randomPipeHeight() {
    return 50 + Random().nextDouble() * (screenHeight - pipeGap - 100);
  }

  void jump() {
    velocity = jumpVelocity;
  }

  void gameOver() {
    gameStarted = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        content: Text("Score: $score"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text("Restart"),
          )
        ],
      ),
    );
  }

  Widget buildPipe(Pipe pipe) {
    return Stack(
      children: [
        Positioned(
          left: pipe.x,
          top: 0,
          width: pipeWidth,
          height: pipe.height,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        Positioned(
          left: pipe.x,
          top: pipe.height + pipeGap,
          width: pipeWidth,
          height: screenHeight - pipe.height - pipeGap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBird() {
    return Positioned(
      left: screenWidth / 4,
      top: birdY,
      child: Container(
        width: birdSize,
        height: birdSize,
        decoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        if (gameStarted) {
          jump();
        } else {
          startGame();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4FC3F7), Color(0xFF81D4FA)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            ...pipes.map(buildPipe).toList(),
            buildBird(),
            Positioned(
              top: 50,
              left: 20,
              child: Text("Score: $score", style: const TextStyle(fontSize: 30, color: Colors.white)),
            ),
            if (!gameStarted)
              const Center(
                child: Text("TAP TO START", style: TextStyle(fontSize: 24, color: Colors.white)),
              ),
          ],
        ),
      ),
    );
  }
}