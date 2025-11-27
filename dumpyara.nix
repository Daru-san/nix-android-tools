{
  lib,
  python3,
  fetchFromGitHub,
  sebaubuntu_libs,
  nix-update-script,
}:

python3.pkgs.buildPythonApplication {
  pname = "dumpyara";
  version = "1.0.10-unstable-2025-11-20";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sebaubuntu-python";
    repo = "dumpyara";
    rev = "e2bc159997a4b621e0e0625fd4f74da218d0bcba";
    hash = "sha256-qUyPXG9G5cAl5vPIeGI9NOC6Vl2q/yej5jGFD+S18nQ=";
  };

  build-system = [
    python3.pkgs.poetry-core
  ];

  dependencies =
    with python3.pkgs;
    [
      brotli
      liblp
      lz4
      protobuf
      py7zr
      zstandard
    ]
    ++ [ sebaubuntu_libs ];

  pythonImportsCheck = [
    "dumpyara"
  ];

  passthru = {
    updateScript = nix-update-script {
      extraArgs = [
        "--version=branch"
      ];
    };
  };

  meta = {
    description = "Android firmware dumper, rewritten in Python";
    homepage = "https://github.com/sebaubuntu-python/dumpyara";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ daru-san ];
    mainProgram = "dumpyara";
  };
}
