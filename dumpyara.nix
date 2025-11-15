{
  lib,
  python3,
  fetchFromGitHub,
  sebaubuntu_libs,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "dumpyara";
  version = "1.0.10";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sebaubuntu-python";
    repo = "dumpyara";
    rev = "v${version}";
    hash = "sha256-lDoVBP1hmRx5E3kTblj2mB4Nsu71UFV6KQ8J41ODK3c=";
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

  meta = {
    description = "Android firmware dumper, rewritten in Python";
    homepage = "https://github.com/sebaubuntu-python/dumpyara";
    license = lib.licenses.gpl3Only;
    maintainers = with lib.maintainers; [ daru-san ];
    mainProgram = "dumpyara";
  };
}
