require 'webdriver/common/browser_container'
#页面容器父类，继承browser_container,主要作用是约定页面窗口类的公共行为
module WebDriver
  module Common
    class PageContainer < BrowserContainer        
      def close
        @driver.close
      end
    end # PageContainer
  end # Common
end # WebDriver