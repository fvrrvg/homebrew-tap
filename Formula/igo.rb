class Igo < Formula
  desc "A CLI for Instagram built in Go. Helps you do some tasks faster and easier like downloading posts, stories, IGTV, and DMs."
  homepage "https://github.com/fvrrvg/igo"
  version "0.2.0"
  license "MIT"

  depends_on "git"
  depends_on "go" => :optional

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fvrrvg/igo/releases/download/v0.2.0/igo-v0.2.0.darwin.amd64.tar.gz"
      sha256 "8c9e4537bb2c240b381e5c824376950d877f2cc77acad807625c5463ad008ebb"
    elsif Hardware::CPU.arm?
      url "https://github.com/fvrrvg/igo/releases/download/v0.2.0/igo-v0.2.0.darwin.arm64.tar.gz"
      sha256 "b64b1199e262adba0d642d64ee4af02ab3e966a7266aae270bdd301dc6ce558e"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fvrrvg/igo/releases/download/v0.2.0/igo-v0.2.0.linux.amd64.tar.gz"
      sha256 "006552c4f9691406482a96ddd97988c481cb331dc1f7fd8bb834a8f23cca89c0"
    end
  end

   
  def install
    bin.install "igo"

     # Install bash completion
     output = Utils.safe_popen_read({ "SHELL" => "bash" }, "#{bin}/igo", "completion", "bash")
     (bash_completion/"igo").write output
 
     # Install zsh completion
     output = Utils.safe_popen_read({ "SHELL" => "zsh" }, "#{bin}/igo", "completion", "zsh")
     (zsh_completion/"_igo").write output

     # Install fish completion
      output = Utils.safe_popen_read({ "SHELL" => "fish" }, "#{bin}/igo", "completion", "fish")
      (fish_completion/"igo.fish").write output
  end
end
