#common ：此包主要是PageObject和PageContainer的父类，或者说是“抽象部分”
module WebDriver
  module Common
    class BrowserContainer
      def initialize(driver)
        @driver = driver
        @driver.manage.timeouts.implicit_wait = 10
      end
    end # BrowserContainer
  end # Common
end # WebDriver
#浏览器容器类，包括浏览器的信息
