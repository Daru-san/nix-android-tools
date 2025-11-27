{
  lib,
  python3,
  fetchFromGitHub,
  sebaubuntu_libs,
  nix-update-script,
}:

python3.pkgs.buildPythonApplication rec {
  pname = "aospdtgen";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sebaubuntu-python";
    repo = "aospdtgen";
    rev = "v${version}";
    hash = "sha256-5ZU7MTbh/6iaoFKXTlAFrmIamVGsk+bYM+Nkse09t0o=";
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

  passthru = {
    updateScript = nix-update-script { };
  };

  meta = {
    description = "LineageOS device tree generator";
    homepage = "https://github.com/sebaubuntu-python/aospdtgen?tab=readme-ov-file";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ daru-san ];
    mainProgram = "aospdtgen";
  };
}
