require 'yaml'

module Helper
  module ReadProfiles

    YAML_PATH = File.expand_path('./profiles',File.dirname(__FILE__))
    APP_RESOURCES_PATH = "#{YAML_PATH}/app_resources"
    DATA_PATH = "#{YAML_PATH}/data"

    APPS_RES_ZH_FILES = {
      :global=>'applications_resources_zh.yaml',
      :wkb=>'applications_resources_wkb_zh.yaml',
      :pm=>'applications_resources_pm_zh.yaml',
      :prom=>'applications_resources_prom_zh.yaml',
      :mea=>'applications_resources_mea_zh.yaml',
      :rm=>'applications_resources_rm_zh.yaml',
      :cm=>'applications_resources_cm_zh.yaml',
      :sm=>'applications_resources_sm_zh.yaml',
      :hl=>'applications_resources_hl_zh.yaml',
      :dm=>'applications_resources_dm_zh.yaml',
      :rm=>'applications_resources_rm_zh.yaml'}

    DATA_FILES = {
      :wkb=>'data_wkb.yaml',
      :pm=>'data_pm.yaml',
      :prom=>'data_prom.yaml',
      :mea=>'data_mea.yaml',
      :mem=>'data_mem.yaml',
      :rm=>'data_rm.yaml',
      :cm=>'data_cm.yaml',
      :sm=>'data_sm.yaml',
      :hl=>'data_hl.yaml',
      :dm=>'data_dm.yaml',
      :rm=>'data_rm.yaml'}

    module_function

    def login_info
      YAML.load File.open "#{YAML_PATH}/login_info.yaml"
    end

    def browser
      login_info['browser']
    end

    def url
      login_info['url']
    end

    def login_name
      login_info['login_name']
    end

    def login_pwd
      login_info['login_pwd']
    end

    def apps_res_zh(symbol)
      YAML.load File.open "#{APP_RESOURCES_PATH}/#{APPS_RES_ZH_FILES[symbol]}"
    end

    def data(symbol)
      YAML.load File.open "#{DATA_PATH}/#{DATA_FILES[symbol]}"
    end

  end # ReadProfiles
end # Helper
