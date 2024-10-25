{ pkgs, ... }: {
  channel = "stable-24.05";
  packages = [
    pkgs.dart
    pkgs.flutter
  ];
  idx = {
    extensions = [
      "dart-code.dart-code"
      "Dart-Code.flutter"
      "ms-vscode.live-server"
      "ryanluker.vscode-coverage-gutters"
      "tenninebt.vscode-koverage"
    ];
    workspace = {
      onCreate = {
        upgrade-dart = "flutter upgrade";
      };
      onStart = {
        pub-get = "dart pub get";
      };
    };
  };
}
