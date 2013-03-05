pages = Dir[File.dirname(__FILE__) + '/*/page/**/*_page.rb']
pages.each{|page| require page}

containers = Dir[File.dirname(__FILE__) + '/*/*_container.rb']
containers.each{|container| require container}