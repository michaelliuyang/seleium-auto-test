require 'webdriver/common/browser_container'

module WebDriver
  module Common
    class BasePage < BrowserContainer
      
      attr_accessor :url
      
      def initialize(driver,url = nil)
        super driver
        @url = url
      end
      
      def open
        if @url == nil
          raise 'url is nil'
        else
          @driver.navigate.to @url
          sleep 1
          self
        end
      end
      
      def close
        @driver.close
      end
      
      def title
        @driver.title
      end
      
      def current_url
        @driver.current_url
      end
      
      def refresh
        @driver.navigate.refresh
      end
      
    end # BasePage
  end # Common
end # WebDriver
