workspace(name = "repro400")

load("//tools/workspace:github.bzl", "github_archive")

github_archive(
    name = "io_bazel_skydoc",
    repo = "bazelbuild/skydoc",
    sha256 = "2885adbe581576b2b3ec906eeebc3692e45386651502411284c50979add0fa89",
    version = "0.1.4",
)

load("@io_bazel_skydoc//skylark:skylark.bzl", "skydoc_repositories")

skydoc_repositories()

# Haskell
# =========================================================

RULES_HASKELL_COMMIT = "110721c4434c842a683a0c6f38d9e59327b04b44"

http_archive(
    name = "io_tweag_rules_haskell",
    sha256 = "5be914c1477c3da8725c465f5d736f9e12359892830438047f00c2ea0e8cd781",
    strip_prefix = "rules_haskell-%s" % RULES_HASKELL_COMMIT,
    urls = ["https://github.com/tweag/rules_haskell/archive/%s.tar.gz" % RULES_HASKELL_COMMIT],
)

load("@io_tweag_rules_haskell//haskell:repositories.bzl", "haskell_repositories")

haskell_repositories()

load("@io_tweag_rules_haskell//haskell:ghc_bindist.bzl", "ghc_bindist")
load("//third_party/haskell:haskell.bzl", "new_cabal_package")

# This repository rule creates @ghc repository.
ghc_bindist(
    name = "ghc",
)

register_toolchains("//:ghc")

github_archive(
    name = "ai_formation_hazel",
    repo = "FormationAI/hazel",
    sha256 = "3063c822c637f377016afc4a9bc4f263c81a32563a4e1bed539ef2bb493a2183",
    version = "5f8f808402dcdc6570592d2f4c88c94e34a7e7a5",
)

load("//third_party/haskell:packages.bzl", "core_packages", "packages")

#hazel_repositories(
#    core_packages = core_packages,
#    packages = packages,
#)

[new_local_repository(
    name = "haskell_%s" % pkg.replace("-", "_"),
    build_file = "third_party/haskell/BUILD.bazel",
    path = "/usr",
) for pkg in core_packages.keys()]

[new_cabal_package(
    package = "%s-%s" % (
        pkg,
        data.version,
    ),
    sha256 = data.sha256,
) for pkg, data in packages.items()]
