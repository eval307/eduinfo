import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: BoxDecoration(
        color: const Color(0xFF232D3F),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 5,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(0, Icons.home_rounded, 'Home'),
          _buildNavItem(1, Icons.article_rounded, 'Berita'),
          _buildNavItem(2, Icons.grid_view_rounded, 'Formulir'),
          _buildNavItem(3, Icons.settings_rounded, 'Setting'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    final isSelected = widget.currentIndex == index;

    return GestureDetector(
      onTap: () {
        if (widget.currentIndex != index) {
          _animationController.forward(from: 0);
        }
        widget.onTap(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
        )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: EdgeInsets.all(isSelected ? 8.0 : 0.0),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white.withOpacity(0.15) : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 1.0, end: isSelected ? 1.2 : 1.0),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutBack,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: Icon(
                      icon,
                      color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
                      size: 22,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Contoh implementasi pada Scaffold dengan efek transisi halaman:
class NavBarImplementation extends StatefulWidget {
  const NavBarImplementation({Key? key}) : super(key: key);

  @override
  State<NavBarImplementation> createState() => _NavBarImplementationState();
}

class _NavBarImplementationState extends State<NavBarImplementation> {
  int _currentIndex = 0;

  // Tambahkan halaman-halaman Anda di sini
  final List<Widget> _screens = [
    // HomeScreen(),
    // BeritaScreen(),
    // FormulirScreen(),
    // SettingScreen(),
  ];

  void _navigateToPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _screens.isNotEmpty ? _screens[_currentIndex] : Container(),
      ),
      extendBody: false,
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _navigateToPage,
      ),
    );
  }
}

// Kelas untuk efek transisi halaman
class FadeThroughTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;

  const FadeThroughTransition({
    Key? key,
    required this.child,
    required this.animation,
    required this.secondaryAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final progress = animation.value;
        final opacity = progress > 0.5 ? 1.0 : progress * 2.0;
        final scale = 0.92 + (progress * 0.08);

        return Opacity(
          opacity: opacity,
          child: Transform.scale(
            scale: scale,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}

// Kelas wrapper untuk animasi transisi halaman
class PageTransitionSwitcher extends StatelessWidget {
  final Widget child;
  final Widget Function(Widget, Animation<double>, Animation<double>) transitionBuilder;

  const PageTransitionSwitcher({
    Key? key,
    required this.child,
    required this.transitionBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) {
        final Animation<double> secondaryAnimation = ReverseAnimation(animation);
        return transitionBuilder(child, animation, secondaryAnimation);
      },
      child: child,
    );
  }
}