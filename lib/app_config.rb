require_relative 'core_extensions/hash'
require_relative 'core_extensions/array'

module SetupConfig
  def self.setup(rails_env)
    yaml = ERB.new(File.read(File.expand_path('../../config/application.yml', __FILE__))).result
    YAML.load(yaml)[rails_env].ostructify
  end
end
