require 'yaml'
require 'logger'

module Configuration
  BASE_PATH    = File.join(File.dirname(__FILE__), "..")
  CONFIG_PATH  = BASE_PATH + '/' + 'config'
  LIB_PATH     = BASE_PATH + '/' + 'lib'

  ENVIRONMENTS_CONFIG_FILE = CONFIG_PATH + '/' + 'environments.yml'

  @log = Logger.new(STDOUT)


  def Configuration.load_config_file(file)
    @log.info('loading config file: ' + file)

    config = YAML.load_file(file)
    @log.info('config: ' + config.inspect)

    return config
  end


  def Configuration.load_environment(environment = nil)
    if environment.is_a? Symbol
      environment = environment.to_s
    end

    @log.info('loading environment: ' + environment.to_s)

    environments = load_config_file(ENVIRONMENTS_CONFIG_FILE)

    case environment
      when 'production'
        environment_config = environments['production']
      when 'test'
        environment_config = environments['test']
      when 'development'
        environment_config = environments['development']
      else
        @log.warn('unknown environment: ' + environment.to_s)
    end

    return environment_config
  end
end