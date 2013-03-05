module WebDriver
  module Common
    class PageContainerFactory
      def self.create_page_container(page_container_type,driver)
        page_container = case page_container_type
        when :login
          Login::PageContainer.new driver
        when :wkb
          Wkb::PageContainer.new driver
        when :sm
          Sm::PageContainer.new driver
        when :pm
          Pm::PageContainer.new driver
        when :prom
          Prom::PageContainer.new driver
        when :mea
          Mea::PageContainer.new driver
        when :dm
          Dm::PageContainer.new driver
        when :rm
          Rm::PageContainer.new driver
        when :hl
          Hl::PageContainer.new driver
        when :cm
          Cm::PageContainer.new driver
        else
          raise 'no this page container type'
        end
      end
    end # PageContainerFactory
  end # Common
end # WebDriver