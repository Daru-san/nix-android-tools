{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation {
  pname = "android-unpackbootimg";
  version = "unstable-2023-04-05";

  src = fetchFromGitHub {
    owner = "anestisb";
    repo = "android-unpackbootimg";
    rev = "813a5e9a5aca12a5acc801df711da22baf64952d";
    hash = "sha256-z3dj01RBGV64eq6ap+BUkgWsi04vLMOoJgW+4rnqzQo=";
  };

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin

    install -Dm775 mkbootimg $out/bin/mkbootimg

    install -Dm775 unpackbootimg $out/bin/unpackbootimg

    runHook postBuild
  '';

  meta = {
    description = "Tools to work with Android boot images";
    homepage = "https://github.com/anestisb/android-unpackbootimg";
    license = lib.licenses.unfree;
    maintainers = with lib.maintainers; [ daru-san ];
    mainProgram = "mkbootimg";
    platforms = lib.platforms.all;
  };
}
