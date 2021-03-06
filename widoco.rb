
class Widoco < Formula
  desc "Wizard for documenting ontologies. WIDOCO is a step by step generator of HTML templates with the documentation of your ontology. It uses the LODE environment to create part of the template."
  homepage "https://zenodo.org/badge/latestdoi/11427075"
  version "1.4.14"
  url "https://github.com/dgarijo/Widoco/releases/download/v1.4.14/widoco-1.4.14-jar-with-dependencies.jar"
  sha256 "ce0422906e36fdfa4fa54ef75fccef6c087c00d155dc2366977b259b938328c8"

  bottle :unneeded
  depends_on :java => "1.8+"

  def install

    libexec.install Dir["*"]
    bin.install libexec/"widoco" 
    bin.env_script_all_files(libexec, Language::Java.java_home_env("1.8"))
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test Widoco`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
   system "#{bin}/widoco", "--version"
  end
end
