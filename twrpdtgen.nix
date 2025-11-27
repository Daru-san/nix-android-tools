{
  lib,
  python3,
  fetchFromGitHub,
  cpio,
  sebaubuntu-libs,
}:

python3.pkgs.buildPythonApplication {
  pname = "twrpdtgen";
  version = "unstable-2025-07-24";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "twrpdtgen";
    repo = "twrpdtgen";
    rev = "dda5c5798ccba0915e5da712b49c17365f9edb1c";
    hash = "sha256-SYsztjXFYkWwB9Z0R4E8CPwLzt3Cs/JYiM4K64GR7gs=";
  };

  build-system = [
    python3.pkgs.poetry-core
  ];

  dependencies = with python3.pkgs; [
    gitpython
    jinja2
    sebaubuntu-libs
  ];

  runtimeDependencies = [
    cpio
  ];

  pythonImportsCheck = [
    "twrpdtgen"
  ];

  meta = {
    description = "A Python library/script to automatically generate TWRP-compatible device tree from a boot/recovery image";
    homepage = "https://github.com/twrpdtgen/twrpdtgen";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ daru-san ];
    mainProgram = "twrpdtgen";
  };
}
