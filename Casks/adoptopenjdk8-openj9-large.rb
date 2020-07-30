# PLEASE DO NOT EDIT THIS FILE. EDIT Templates/adoptopenjdk.rb.tmpl
cask "adoptopenjdk8-openj9-large" do
  version "8,265:b01"
  sha256 "c0e77a57161ea52cc18120b1e0af1588d3c392a83d34b9f7599e05b5ef564720"

  # github.com/AdoptOpenJDK was verified as official when first introduced to the cask
  url "https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u265-b01_openj9-0.21.0/OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u265b01_openj9-0.21.0.pkg"
  appcast "https://github.com/adoptopenjdk/openjdk#{version.before_comma}-binaries/releases/latest"
  name "AdoptOpenJDK 8 (OpenJ9) (XL)"
  homepage "https://adoptopenjdk.net/"

  pkg "OpenJDK8U-jdk_x64_mac_openj9_macosXL_8u265b01_openj9-0.21.0.pkg"

  postflight do
    system_command "/usr/sbin/pkgutil", args: ["--pkg-info", "net.adoptopenjdk.8-openj9.jdk"], print_stdout: true
  end

  uninstall pkgutil: "net.adoptopenjdk.8-openj9.jdk"
end
