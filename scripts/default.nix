{
  makeWrapper,
  nix-update,
  lib,
  python3Packages,
}:
python3Packages.buildPythonApplication rec {
  pname = "updater";
  version = "1";
  format = "other";

  src = ./.;

  dontUnpack = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin
    install -Dm775 $src/updater.py $out/bin/${pname}

    runHook postInstall
  '';

  postInstall =
    let
      wrapperPath = lib.makeBinPath [ nix-update ];
    in
    ''
      wrapProgram $out/bin/updater \
        --prefix PATH : ${wrapperPath}
    '';

  meta = {
    description = "The update script for my packages";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ daru-san ];
  };
}
