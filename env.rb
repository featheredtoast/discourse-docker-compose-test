require 'yaml'

conf = STDIN.readlines.join
split = conf.split('_FILE_SEPERATOR_')

File.open('./envs', 'wb') do |file|
  split.each do |data|
    envs = YAML.load(data.strip)['env']
    next if envs.nil?

    envs.each do |k, v|
      file.puts("#{k}=\"#{v}\"")
    end
  end
end
