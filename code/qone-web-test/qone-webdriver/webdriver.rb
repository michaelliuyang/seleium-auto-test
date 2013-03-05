require 'webdriver/load_page_and_container'
require 'webdriver/common/page_container_factory'

module WebDriver
  VERSION = '1.0 beta'
  
  def self.create_page_container(page_container_type,driver)
    WebDriver::Common::PageContainerFactory.create_page_container page_container_type,driver
  end
end # WebDriver