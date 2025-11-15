{
  lib,
  python3,
  fetchFromGitHub,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "sebaubuntu-libs";
  version = "1.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sebaubuntu-python";
    repo = "sebaubuntu_libs";
    rev = "v${version}";
    hash = "sha256-V+9z4Q4D40AfVgSXW05EfZhctA+EIuS8xGSQkBjNGTQ=";
  };

  build-system = [
    python3.pkgs.poetry-core
  ];

  dependencies = with python3.pkgs; [
    gitpython
    pyelftools
    requests
  ];

  optional-dependencies = with python3.pkgs; {
    docs = [
      sphinx
      sphinx-rtd-theme
    ];
  };

  pythonImportsCheck = [
    "sebaubuntu_libs"
  ];

  meta = {
    description = "SebaUbuntu's shared libs";
    homepage = "https://github.com/sebaubuntu-python/sebaubuntu_libs";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ daru-san ];
    mainProgram = "sebaubuntu-libs";
  };
}
