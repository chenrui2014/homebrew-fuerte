require 'formula'

class Catkin < Formula
  url 'git@github.com:ros/catkin.git', {:using => :git, :tag => '0.4.5'}
  homepage 'http://www.ros.org/wiki/catkin'
  version '0.4.5'

  depends_on LanguageModuleDependency.new :python, 'PyYAML', 'yaml'
  depends_on 'setuptools' => :python
  depends_on 'cmake'
  depends_on LanguageModuleDependency.new :python, 'EmPy', 'em'
  depends_on 'argparse' => :python
  depends_on 'nose' => :python
  depends_on 'rospkg' => :python


  def install
    ENV.universal_binary
    system "mkdir build"
    system "cd build && cmake .. #{std_cmake_parameters}"
    system "cd build && make install"
  end

end
