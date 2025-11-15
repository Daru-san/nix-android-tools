{
  lib,
  python3,
  fetchFromGitHub,
  sebaubuntu_libs,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "aospdtgen";
  version = "1.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sebaubuntu-python";
    repo = "aospdtgen";
    rev = "v${version}";
    hash = "sha256-ojO5C+yo0t2nulSSRAfDRJq7LkoJdwF/OcJwzCdnyh4=";
  };

  build-system = [
    python3.pkgs.poetry-core
  ];

  dependencies =
    with python3.pkgs;
    [
      gitpython
      jinja2
    ]
    ++ [ sebaubuntu_libs ];

  pythonImportsCheck = [
    "aospdtgen"
  ];

  meta = {
    description = "LineageOS device tree generator";
    homepage = "https://github.com/sebaubuntu-python/aospdtgen?tab=readme-ov-file";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ daru-san ];
    mainProgram = "aospdtgen";
  };
}
