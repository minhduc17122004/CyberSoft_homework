import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final _textController = TextEditingController();
  String _childResult = 'Chưa nhận dữ liệu từ màn hình con';

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _openKeyLab(BuildContext context) {
    Navigator.pushNamed(context, '/key-lab');
  }

  void _openExample(BuildContext context) {
    Navigator.pushNamed(context, '/example');
  }

  void _openExampleWithArguments(BuildContext context) {
    final text = _textController.text.trim();

    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hãy nhập text trước khi navigate.')),
      );
      return;
    }

    final arguments = NavigationArguments(
      title: 'Arguments động',
      message: text,
      count: text.length,
    );

    Navigator.pushNamed(context, '/arguments', arguments: arguments);
  }

  Future<void> _openChildAndReceiveResult() async {
    final result =
        await Navigator.pushNamed(context, '/child-result') as String?;

    if (result != null) {
      setState(() => _childResult = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Navigation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Màn hình test',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Chọn một nút để thực hành chuyển màn hình.'),
            const SizedBox(height: 24),
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Nhập text muốn truyền',
                hintText: 'Ví dụ: Xin chào màn hình mới',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () => _openKeyLab(context),
              icon: const Icon(Icons.science_outlined),
              label: const Text('Đi tới Key Lab'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () => _openExample(context),
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Mở màn hình ví dụ'),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () => _openExampleWithArguments(context),
              icon: const Icon(Icons.send),
              label: const Text('Gửi text qua arguments'),
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: _openChildAndReceiveResult,
              icon: const Icon(Icons.input),
              label: const Text('Mở con và nhận kết quả'),
            ),
            const SizedBox(height: 12),
            Text('Kết quả từ con: $_childResult'),
          ],
        ),
      ),
    );
  }
}

class NavigationArguments {
  final String title;
  final String message;
  final int count;

  const NavigationArguments({
    required this.title,
    required this.message,
    required this.count,
  });
}

class NavigationArgumentsScreen extends StatelessWidget {
  const NavigationArgumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as NavigationArguments;

    return Scaffold(
      appBar: AppBar(title: const Text('Màn hình nhận arguments')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              arguments.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(arguments.message),
            const SizedBox(height: 12),
            Text('count = ${arguments.count}'),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Quay lại màn hình test'),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationExampleScreen extends StatelessWidget {
  const NavigationExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Màn hình ví dụ')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
          label: const Text('Quay lại màn hình test'),
        ),
      ),
    );
  }
}

class ChildResultScreen extends StatefulWidget {
  const ChildResultScreen({super.key});

  @override
  State<ChildResultScreen> createState() => _ChildResultScreenState();
}

class _ChildResultScreenState extends State<ChildResultScreen> {
  final _resultController = TextEditingController();

  @override
  void dispose() {
    _resultController.dispose();
    super.dispose();
  }

  void _sendResultToParent() {
    final result = _resultController.text.trim();

    if (result.isNotEmpty) {
      Navigator.pop(context, result);
      print('Đã gửi kết quả về màn hình cha: $result');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Màn hình con')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Nhập dữ liệu để gửi về màn hình cha.'),
            const SizedBox(height: 12),
            TextField(
              controller: _resultController,
              decoration: const InputDecoration(
                labelText: 'Kết quả',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _sendResultToParent,
              icon: const Icon(Icons.reply),
              label: const Text('Gửi về màn hình cha'),
            ),
          ],
        ),
      ),
    );
  }
}
