{
  description = "Nix flake for integrating Ansible with k0smotron";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.default = [
        pkgs.ansible
        pkgs.k0smotron
      ];

      defaultPackage = self.packages.${system}.default;

      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [
          ansible
          k0sctl
          kubectl
          opentofu
          kubecm
          helm
          argocd
          kustomize
        ];
        shellHook = ''
          set -a
          source ./secrets.env
          source <(kubectl completion bash)
          source <(kubecm completion bash)
          source <(helm completion bash)
          source <(argocd completion bash)
          source <(kustomize completion bash)
          set +a
      '';
      };
    });
}