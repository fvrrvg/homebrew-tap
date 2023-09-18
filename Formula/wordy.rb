class Wordy < Formula
  desc "cli game like wordle but not limited to 5-letter words"
  homepage "https://github.com/fvrrvg/wordy"
  version "0.0.1"
  license "MIT"

  depends_on "git"
  depends_on "go" => :optional

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/fvrrvg/wordy/releases/download/v0.1.0/wordy-v0.1.0.darwin.amd64.tar.gz"
      sha256 "8c9e4537bb2c240b381e5c824376950d877f2cc77acad807625c5463ad008ebb"
    elsif Hardware::CPU.arm?
      url "https://github.com/fvrrvg/wordy/releases/download/v0.1.0/wordy-v0.1.0.darwin.arm64.tar.gz"
      sha256 "b64b1199e262adba0d642d64ee4af02ab3e966a7266aae270bdd301dc6ce558e"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fvrrvg/wordy/releases/download/v0.1.0/wordy-v0.1.0.linux.amd64.tar.gz"
      sha256 "006552c4f9691406482a96ddd97988c481cb331dc1f7fd8bb834a8f23cca89c0"
    end
  end

   
  def install
    bin.install "wordy"

     # Install bash completion
     output = Utils.safe_popen_read({ "SHELL" => "bash" }, "#{bin}/wordy", "completion", "bash")
     (bash_completion/"wordy").write output
 
     # Install zsh completion
     output = Utils.safe_popen_read({ "SHELL" => "zsh" }, "#{bin}/wordy", "completion", "zsh")
     (zsh_completion/"_wordy").write output

     # Install fish completion
      output = Utils.safe_popen_read({ "SHELL" => "fish" }, "#{bin}/wordy", "completion", "fish")
      (fish_completion/"wordy.fish").write output
  end
end
