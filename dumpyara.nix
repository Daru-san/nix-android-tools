{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "dumpyara";
  version = "1.0.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sebaubuntu-python";
    repo = "dumpyara";
    rev = "v${version}";
    hash = "sha256-Hv0tV3jha8QM7WduNv75dPtmYGuAwvwrugX7sOrUOYA=";
  };

  build-system = [
    python3.pkgs.poetry-core
  ];

  dependencies = with python3.pkgs; [
    brotli
    liblp
    lz4
    protobuf
    py7zr
    sebaubuntu-libs
    zstandard
  ];

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
