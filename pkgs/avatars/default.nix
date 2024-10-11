{ stdenv, pkgs, ... }:

let
  name = "avatars";
  version = "unstable-2024-10-11";
  meta = with pkgs.lib; {
    description = "NUR avatars for personal usage";
    homepage = "https://github.com/piyoki/nur-assets";
    license = licenses.ofl;
    platforms = platforms.linux;
    mainProgram = pname;
    maintainers = with maintainers; [ kev ];
  };
in
stdenv.mkDerivation rec {
  inherit name version meta;
  src = ../../assets/avatars;
  installPhase = ''
    install -Dm444 * -t $out/share/${name}
  '';
}
