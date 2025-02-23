{pkgs, ...}:
pkgs.buildGoModule rec {
  pname = "bazel-toolchains";
  version = "5.1.3-rc1";

  patches = [
    ./rbe_configs_gen_skip_pull.diff
  ];

  src = pkgs.fetchFromGitHub {
    owner = "bazelbuild";
    repo = "bazel-toolchains";
    rev = "v${version}";
    sha256 = "sha256-uHSZN6sThX0i1kAvMyaSIghs6kV0t7wgOA7IWVJksEo=";
  };

  vendorHash = "sha256-E6PylI2prXCXqOUYgYi5nZ4qptqOqbcaOquDfEkhaQ4=";

  meta = with pkgs.lib; {
    description = "Generate Bazel toolchain configs for remote execution.";
    homepage = "https://github.com/bazelbuild/bazel-toolchains";
    license = licenses.asl20;
    maintainers = [maintainers.aaronmondal];
  };
}
