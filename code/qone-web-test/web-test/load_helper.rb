webtest_path = File.dirname(__FILE__)
webdriver_path = File.expand_path('../qone-webdriver',webtest_path)
helper_path = File.expand_path('../helper',webtest_path)

$LOAD_PATH.unshift webtest_path
$LOAD_PATH.unshift webdriver_path
$LOAD_PATH.unshift helper_path

require 'selenium-webdriver'
require 'read_profiles'
require 'webdriver'
require 'support/login'