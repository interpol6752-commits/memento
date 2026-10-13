import 'package:flutter/material.dart';

void main() {
  runApp(const MementoMobileApp());
}

class MementoMobileApp extends StatelessWidget {
  const MementoMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memento',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F19),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF6366F1),
          secondary: Color(0xFF06B6D4),
          surface: Color(0xFF131B2E),
        ),
        cardTheme: CardTheme(
          color: const Color(0xFF161F37),
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      home: const MementoDashboard(),
    );
  }
}

class MementoDashboard extends StatefulWidget {
  const MementoDashboard({super.key});

  @override
  State<MementoDashboard> createState() => _MementoDashboardState();
}

class _MementoDashboardState extends State<MementoDashboard> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    OverviewPage(),
    VpnProxyPage(),
    IpScannerPage(),
    ConfigsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _pages[_currentIndex],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          border: Border(
            top: BorderSide(color: Colors.white.withOpacity(0.05), width: 1),
          ),
        ),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white70,
              ),
            ),
          ),
          child: NavigationBar(
            backgroundColor: const Color(0xFF111827),
            indicatorColor: const Color(0xFF6366F1).withOpacity(0.3),
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) =>
                setState(() => _currentIndex = index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.dashboard_outlined, color: Colors.white60),
                selectedIcon: Icon(Icons.dashboard, color: Color(0xFF6366F1)),
                label: 'Обзор',
              ),
              NavigationDestination(
                icon: Icon(Icons.vpn_key_outlined, color: Colors.white60),
                selectedIcon: Icon(Icons.vpn_key, color: Color(0xFF06B6D4)),
                label: 'VPN / Core',
              ),
              NavigationDestination(
                icon: Icon(Icons.radar_outlined, color: Colors.white60),
                selectedIcon: Icon(Icons.radar, color: Color(0xFF34D399)),
                label: 'Сканер',
              ),
              NavigationDestination(
                icon: Icon(Icons.tune_outlined, color: Colors.white60),
                selectedIcon: Icon(Icons.tune, color: Color(0xFFF43F5E)),
                label: 'Конфиги',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'MEMENTO',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Mobile Security & Networks',
                  style: TextStyle(fontSize: 13, color: Colors.white60),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF34D399).withOpacity(0.15),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF34D399).withOpacity(0.4),
                ),
              ),
              child: const Text(
                'v3.2.0 Pro',
                style: TextStyle(
                  color: Color(0xFF34D399),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    Icon(Icons.shield, color: Color(0xFF06B6D4), size: 28),
                    SizedBox(width: 12),
                    Text(
                      'Статус туннеля',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Соединение:', style: TextStyle(color: Colors.white70)),
                      Text(
                        'Готово к работе',
                        style: TextStyle(
                          color: Color(0xFF34D399),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Метрики сети',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MetricItem(
                      label: 'Пинг',
                      value: '14 ms',
                      color: Color(0xFF34D399),
                    ),
                    MetricItem(
                      label: 'Пакеты',
                      value: '0% loss',
                      color: Color(0xFF06B6D4),
                    ),
                    MetricItem(
                      label: 'Узлы',
                      value: '4 актив.',
                      color: Color(0xFF6366F1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MetricItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const MetricItem({
    super.key,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.white54),
        ),
      ],
    );
  }
}

class VpnProxyPage extends StatefulWidget {
  const VpnProxyPage({super.key});

  @override
  State<VpnProxyPage> createState() => _VpnProxyPageState();
}

class _VpnProxyPageState extends State<VpnProxyPage> {
  bool _isConnected = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          'Управление VPN / Xray',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Center(
          child: GestureDetector(
            onTap: () => setState(() => _isConnected = !_isConnected),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: _isConnected
                      ? [const Color(0xFF06B6D4), const Color(0xFF6366F1)]
                      : [const Color(0xFF1E293B), const Color(0xFF0F172A)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: (_isConnected
                            ? const Color(0xFF06B6D4)
                            : Colors.black)
                        .withOpacity(0.4),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _isConnected ? Icons.power_settings_new : Icons.power_off,
                    size: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _isConnected ? 'ВКЛЮЧЕНО' : 'ВЫКЛЮЧЕНО',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Card(
          child: ListTile(
            leading: const Icon(Icons.router, color: Color(0xFF6366F1)),
            title: const Text('Узел соединения'),
            subtitle: const Text('Протокол: VLESS + XTLS'),
            trailing: Switch(
              value: _isConnected,
              onChanged: (val) => setState(() => _isConnected = val),
              activeColor: const Color(0xFF06B6D4),
            ),
          ),
        ),
      ],
    );
  }
}

class IpScannerPage extends StatelessWidget {
  const IpScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Сканер сети',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.radar),
          label: const Text('Сканировать сеть'),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF6366F1),
            foregroundColor: Colors.white,
            minimumSize: const Size.fromHeight(50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFF34D399).withOpacity(0.2),
                    child: const Icon(
                      Icons.devices,
                      color: Color(0xFF34D399),
                      size: 20,
                    ),
                  ),
                  title: Text(
                    '192.168.1.${10 + index}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'Активен • Отклик 8ms',
                    style: TextStyle(color: Colors.white60),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.white54,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ConfigsPage extends StatelessWidget {
  const ConfigsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Конфигурации',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView(
            children: [
              Card(
                child: ListTile(
                  leading: const Icon(Icons.settings, color: Color(0xFFF43F5E)),
                  title: const Text('server_config.yaml'),
                  subtitle: const Text('Файл настроек ядра'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit_note, color: Colors.white70),
                    onPressed: () {},
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: const Icon(Icons.file_copy, color: Color(0xFF06B6D4)),
                  title: const Text('routes_table.json'),
                  subtitle: const Text('Таблица маршрутизации'),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit_note, color: Colors.white70),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
