import 'package:flutter/material.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 0.1,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();

    // Navigate to home screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Detailed Education-related logo with book and pen
                    Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.blue.shade100,
                            Colors.blue.shade200,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(80),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 25,
                            offset: const Offset(0, 15),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Detailed Book
                          Transform.rotate(
                            angle: _rotationAnimation.value,
                            child: Container(
                              width: 90,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 8,
                                    offset: const Offset(2, 4),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  // Book cover
                                  Container(
                                    width: 90,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.blue.shade700,
                                          Colors.blue.shade800,
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Book title lines
                                        Container(
                                          width: 50,
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          width: 40,
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          width: 35,
                                          height: 2,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(height: 8),
                                        // Book spine
                                        Container(
                                          width: 4,
                                          height: 20,
                                          color: Colors.blue.shade900,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Book pages
                                  Positioned(
                                    left: 0,
                                    top: 0,
                                    child: Container(
                                      width: 85,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          bottomLeft: Radius.circular(8),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 8),
                                          Container(
                                            width: 50,
                                            height: 1,
                                            color: Colors.grey.shade300,
                                          ),
                                          const SizedBox(height: 3),
                                          Container(
                                            width: 45,
                                            height: 1,
                                            color: Colors.grey.shade300,
                                          ),
                                          const SizedBox(height: 3),
                                          Container(
                                            width: 40,
                                            height: 1,
                                            color: Colors.grey.shade300,
                                          ),
                                          const SizedBox(height: 3),
                                          Container(
                                            width: 35,
                                            height: 1,
                                            color: Colors.grey.shade300,
                                          ),
                                          const SizedBox(height: 3),
                                          Container(
                                            width: 30,
                                            height: 1,
                                            color: Colors.grey.shade300,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Detailed Pen positioned diagonally
                          Positioned(
                            top: 20,
                            right: 20,
                            child: Transform.rotate(
                              angle: -0.3,
                              child: Container(
                                width: 60,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade600,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.orange.withOpacity(0.3),
                                      blurRadius: 4,
                                      offset: const Offset(1, 2),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    // Pen tip
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Colors.orange.shade800,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    // Pen body
                                    Positioned(
                                      left: 8,
                                      top: 1,
                                      child: Container(
                                        width: 40,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.orange.shade500,
                                              Colors.orange.shade600,
                                            ],
                                          ),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ),
                                    ),
                                    // Pen cap
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        width: 15,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Colors.orange.shade700,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    // Pen clip
                                    Positioned(
                                      right: 2,
                                      top: 2,
                                      child: Container(
                                        width: 8,
                                        height: 6,
                                        decoration: BoxDecoration(
                                          color: Colors.orange.shade800,
                                          borderRadius: BorderRadius.circular(3),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Small notebook lines
                          Positioned(
                            bottom: 25,
                            left: 25,
                            child: Column(
                              children: List.generate(4, (index) => 
                                Container(
                                  width: 25 + (index * 3),
                                  height: 1,
                                  color: Colors.grey.shade400,
                                  margin: const EdgeInsets.only(bottom: 2),
                                ),
                              ),
                            ),
                          ),
                          // Small pencil
                          Positioned(
                            bottom: 15,
                            right: 15,
                            child: Transform.rotate(
                              angle: 0.2,
                              child: Container(
                                width: 25,
                                height: 3,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade600,
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: Stack(
                                  children: [
                                    // Pencil tip
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: Container(
                                        width: 4,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade600,
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                      ),
                                    ),
                                    // Pencil body
                                    Positioned(
                                      left: 3,
                                      top: 0,
                                      child: Container(
                                        width: 18,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Colors.yellow.shade500,
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                      ),
                                    ),
                                    // Pencil eraser
                                    Positioned(
                                      right: 0,
                                      top: 0,
                                      child: Container(
                                        width: 4,
                                        height: 3,
                                        decoration: BoxDecoration(
                                          color: Colors.pink.shade300,
                                          borderRadius: BorderRadius.circular(2),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    // App title
                    Text(
                      'Task Manager',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Subtitle
                    Text(
                      'Manage Your Educational Tasks',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Additional subtitle
                    Text(
                      'Organize • Study • Succeed',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue.shade500,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Loading indicator with custom design
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue.shade600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Loading text
                    Text(
                      'Loading...',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}