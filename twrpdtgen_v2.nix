{
  lib,
  python3,
  fetchFromGitHub,
  sebaubuntu_libs,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "twrpdtgen-v2";
  version = "1.1.1-unstable-2024-12-27";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Biraru";
    repo = "twrpdtgen_v2";
    rev = "0f3b626294c4418603bbd5a63cc1d49ff86cd43b";
    hash = "sha256-e2RCPd1R7AKWuEdj9oYMZYrCDm4f0ZACW9vIIJ26DjQ=";
  };

  build-system = [
    python3.pkgs.poetry-core
  ];

  dependencies =
    (with python3.pkgs; [
      gitpython
      jinja2
    ])
    ++ [ sebaubuntu_libs ];

  pythonImportsCheck = [
    "twrpdtgen_v2"
  ];

  meta = {
    description = "LineageOS device tree generator";
    homepage = "https://github.com/Biraru/twrpdtgen_v2";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ daru-san ];
    mainProgram = "twrpdtgen_v2";
  };
}
