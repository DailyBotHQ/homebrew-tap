class Dailybot < Formula
  include Language::Python::Virtualenv

  desc "The command-line bridge between humans and agents"
  homepage "https://www.dailybot.com"
  url "https://files.pythonhosted.org/packages/source/d/dailybot-cli/dailybot_cli-0.4.1.tar.gz"
  sha256 "2b000204149276bf2139e6051a2581c145ea462e3feefd00c3ebd6b62a20c3e9"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv = virtualenv_create(libexec, "python3.12")
    virtualenv.pip_install_and_link buildpath
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dailybot --version")
  end
end
