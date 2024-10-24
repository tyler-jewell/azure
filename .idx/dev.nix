{ pkgs, ... }: {
  channel = "stable-23.11";
  packages = [
    pkgs.dart
    pkgs.flutter
  ];
  env = { };
  idx = {
    extensions = [
      "Dart-Code.flutter"
      "Dart-Code.dart-code"
      "tenninebt.vscode-koverage"
      "ryanluker.vscode-coverage-gutters"
      "ms-vscode.live-server"
    ];
    workspace = {};
    previews = {
      enable = true;
      # previews = {
      #   web = {
      #     command = [ "flutter" "run" "--machine" "-d" "web-server" "--web-hostname" "0.0.0.0" "--web-port" "$PORT" ];
      #     manager = "flutter";
      #   };
      #   android = {
      #     command = [ "flutter" "run" "--machine" "-d" "android" "-d" "localhost:5555" ];
      #     manager = "flutter";
      #   };

      # };
    };
  };
}
