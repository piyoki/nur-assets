{ stdenv, pkgs, ... }:

let
  name = "wallpapers";
  version = "unstable-2024-03-09";
  meta = with pkgs.lib; {
    description = "NUR wallpapers for personal usage";
    homepage = "https://github.com/miooochi/nur-assets";
    license = licenses.ofl;
    platforms = platforms.linux;
    mainProgram = pname;
    maintainers = with maintainers; [ kev ];
  };
in
stdenv.mkDerivation rec {
  inherit name version meta;
  src = ../../assets/wallpapers;
  installPhase = ''
    install -Dm444 * -t $out/share/${name}
  '';
}
