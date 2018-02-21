workspace(name = "repro140")

# Haskell
# =========================================================

RULES_HASKELL_COMMIT = "91874d042d87f1f0681f9bc18642662bc7e37419"

http_archive(
    name = "io_tweag_rules_haskell",
    sha256 = "005c1e000af084ecc4a2ee23907160d73d903da6746211478d809480a51182a8",
    strip_prefix = "rules_haskell-%s" % RULES_HASKELL_COMMIT,
    urls = ["https://github.com/tweag/rules_haskell/archive/%s.tar.gz" % RULES_HASKELL_COMMIT],
)

load("@io_tweag_rules_haskell//haskell:repositories.bzl", "haskell_repositories")
load("//third_party/haskell:haskell.bzl", "new_cabal_package")

haskell_repositories()

register_toolchains("//:ghc")

new_local_repository(
    name = "ghc",
    build_file = "third_party/BUILD.ghc",
    path = "/opt/ghc/8.0.1",  # Change path accordingly.
    #path = "/usr",  # Change path accordingly.
)

new_cabal_package(
    package = "QuickCheck-2.11.3",
    sha256 = "488c5652139da0bac8b3e7d76f11320ded298549e62db530938bfee9ca981876",
)

new_cabal_package(
    package = "dlist-0.8.0.4",
    sha256 = "acf1867b80cdd618b8d904e89eea33be60d3c4c3aeb80d61f29229a301cc397a",
)

new_cabal_package(
    package = "primitive-0.6.2.0",
    sha256 = "b8e8d70213e22b3fab0e0d11525c02627489618988fdc636052ca0adce282ae1",
)

new_cabal_package(
    package = "random-1.1",
    sha256 = "b718a41057e25a3a71df693ab0fe2263d492e759679b3c2fea6ea33b171d3a5a",
)

new_cabal_package(
    package = "tf-random-0.5",
    sha256 = "2e30cec027b313c9e1794d326635d8fc5f79b6bf6e7580ab4b00186dadc88510",
)
