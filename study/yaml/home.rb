#encoding: utf-8
require  'Selenium-webdriver'
require 'test/unit'
require 'yaml'

class HomeTest <Test::Unit::TestCase
  def setup
   @driver = Selenium::WebDriver.for :ie
   @url = 'http://localhost:8080'
   @driver.get @url
    @driver.manage.timeouts.implicit_wait = 5
  end
  def read_menu_name_yaml
    YAML.load File.open 'home-menu-name.yaml'
  end
  def login
    @driver.find_element(:id=>'loginUserName').send_keys 'chpm'
    @driver.find_element(:id=>'currentPassword').send_keys 'intec'
    @driver.find_element(:css=>'input.loginBtn').submit
    assert_equal(read_menu_name_yaml['my_dashborad']['title_name'],@driver.title)
  end

  def page_title(element1,key1)
    @driver.find_element(element1=>key1).find_element(:tag_name=>'h2').text
  end

  def three_childmenu_test_by(menu_div,element,key,title_result,page_title_result,page_title_element,page_title_key)
    @driver.execute_script(show_menu_by_id(menu_div))
    @driver.find_element(element=>key).click
    assert_equal(title_result,@driver.title)
    assert_equal(page_title_result,page_title(page_title_element,page_title_key))
  end
  def menu_test_by (element,keys,title_result)
    @driver.find_element(element=>keys).click
    assert_equal(title_result,@driver.title)
  end
  def  qone_exit
        @driver.find_element(:link=>'退出').click
  end

  def tests_home_test
    login
    menu_test_by(:link,read_menu_name_yaml['my_calendar']['name'],read_menu_name_yaml['my_calendar']\
    ['title_name'])# workcalendar
    menu_test_by(:link,read_menu_name_yaml['my_dashborad']['name'],read_menu_name_yaml['my_dashborad']\
    ['title_name'])# dashborad
    read_menu_name_yaml['my_task']['child_name'].each do |x|
    three_childmenu_test_by(read_menu_name_yaml['my_task']['div_name'],:link,x['name'],read_menu_name_yaml[\
    'my_task']['title_name'],x['page_title_name'],x['page_title_element'],x['page_title_key'])
     end


    qone_exit
  end
  def show_menu_by_id (id)
   js = "q = document.getElementById('#{id}');q.style.display = 'block';"
  end
  def teardown
    @driver.quit
  end

end
