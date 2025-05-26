import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _magnifierController;
  late Animation<Offset> _magnifierSlideAnimation;
  late Animation<double> _magnifierScaleAnimation;
  late Animation<double> _magnifierOpacityAnimation;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  late AnimationController _rotateController;
  late Animation<double> _rotateAnimation;

  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  String _animatedText = '';
  final String _fullText = 'EduInfo';

  @override
  void initState() {
    super.initState();

    // Magnifier animation controller dengan durasi lebih panjang
    _magnifierController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Diperpanjang untuk efek yang lebih halus
    );

    // Scale animation: mulai dari 0, tumbuh ke ukuran normal, lalu mengecil
    _magnifierScaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0)
            .chain(CurveTween(curve: Curves.elasticOut)),
        weight: 30, // 30% dari total durasi untuk pertumbuhan
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        weight: 40, // 40% untuk bergerak dengan ukuran normal
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0)
            .chain(CurveTween(curve: Curves.easeInBack)),
        weight: 30, // 30% untuk mengecil dan menghilang
      ),
    ]).animate(_magnifierController);

    // Slide animation: dari kanan ke kiri
    _magnifierSlideAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(1.5, 0.0), // Mulai dari kanan
          end: const Offset(1.5, 0.0), // Tetap di kanan saat tumbuh
        ),
        weight: 30,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: const Offset(1.5, 0.0), // Dari kanan
          end: const Offset(-1.5, 0.0), // Ke kiri
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 70,
      ),
    ]).animate(_magnifierController);

    // Opacity animation: muncul dan menghilang
    _magnifierOpacityAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        weight: 20, // Fade in cepat
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.0),
        weight: 60, // Terlihat penuh
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 0.0),
        weight: 20, // Fade out
      ),
    ]).animate(_magnifierController);

    // Pulse effect animation
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    ));

    // Rotate animation for aura effect
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _rotateAnimation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(_rotateController);

    // Glow animation
    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(
      begin: 0.5,
      end: 5.0,
    ).animate(_glowController);

    // Start the animations sequence
    _magnifierController.forward().then((_) {
      _showTextEffect();
    });
  }

  void _showTextEffect() async {
    for (int i = 0; i < _fullText.length; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
      if (mounted) {
        setState(() {
          _animatedText += _fullText[i];
        });
      }
    }

    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void dispose() {
    _magnifierController.dispose();
    _pulseController.dispose();
    _rotateController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2B4D),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Epic Outer Aura
            AnimatedBuilder(
              animation: _rotateAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotateAnimation.value,
                  child: Container(
                    width: 280,
                    height: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Colors.blue.withOpacity(0.1),
                          Colors.purple.withOpacity(0.05),
                          Colors.transparent,
                        ],
                        stops: const [0.2, 0.7, 1.0],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Inner Aura
            AnimatedBuilder(
              animation: _rotateAnimation,
              builder: (context, child) {
                return Transform.rotate(
                  angle: -_rotateAnimation.value,
                  child: Container(
                    width: 220,
                    height: 220,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: SweepGradient(
                        colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.indigo.withOpacity(0.2),
                          Colors.purple.withOpacity(0.3),
                          Colors.blue.withOpacity(0.1),
                          Colors.indigo.withOpacity(0.0),
                        ],
                        stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Pulsing Glow Effect
            AnimatedBuilder(
              animation: _glowAnimation,
              builder: (context, child) {
                return Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.5),
                        blurRadius: _glowAnimation.value * 10,
                        spreadRadius: _glowAnimation.value,
                      ),
                    ],
                  ),
                );
              },
            ),

            // Pulsing Globe Image in the center
            AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _pulseAnimation.value,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.public,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),

            // Magnifying glass dengan animasi tumbuh, geser, dan menghilang
            AnimatedBuilder(
              animation: _magnifierController,
              builder: (context, child) {
                return SlideTransition(
                  position: _magnifierSlideAnimation,
                  child: Transform.scale(
                    scale: _magnifierScaleAnimation.value,
                    child: Opacity(
                      opacity: _magnifierOpacityAnimation.value,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            // Text fade in - positioned at bottom
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.25,
              child: AnimatedBuilder(
                animation: _glowAnimation,
                builder: (context, child) {
                  return Text(
                    _animatedText,
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.5,
                      shadows: [
                        Shadow(
                          color: Colors.blue.withOpacity(0.8),
                          blurRadius: _glowAnimation.value * 5,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}