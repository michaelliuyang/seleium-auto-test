require "yaml"
require "selenium-webdriver"

 def read_menu_name_yaml
    YAML.load File.open 'home-menu-name.yaml'
 end

 rare = read_menu_name_yaml['my_calendar']['child_name'][3]['test_child_name']
rare.each do |y|
  puts y['name']
end
 puts read_menu_name_yaml['my_task']['child_name'][0]['title_name']

