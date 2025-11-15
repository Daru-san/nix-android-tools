{
  lib,
  python3,
  fetchFromGitHub,
  sebaubuntu_libs,
}:

python3.pkgs.buildPythonApplication {
  pname = "dumpyara";
  version = "1.0.10-unstable-2025-11-14";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sebaubuntu-python";
    repo = "dumpyara";
    rev = "e13873305a4466c2623c555ec60feb28a11cad6e";
    hash = "sha256-AYOkUQ0mEd14OpxXC+36kBB3/j6LWq6RNalv82Ev/Dk=";
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
