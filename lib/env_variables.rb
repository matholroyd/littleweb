class EnvVariables
  def self.load_variables(path)
    if File.exists?(path)
      File.readlines(path).each do |line|
        name, value = line.strip.split('=')
        if ENV[name].blank?
          ENV[name] = value
        end
      end
    end
  end
end
