def read_file(file_path)
  # File.open(file_path) do |f|
  #   f.each { |line| puts line }
  # end

  # file = File.new(file_path)
  # file.each { |line| puts line }
  # file.close

  file = File.new(file_path)
  data = file.read
  puts data
  file.close
rescue Errno::ENOENT => e
  error = "!!! ERROR (#{Time.now}): #{e.message}"
  write_file('errors.log', error)
end

def write_file(file_path, data)
  File.open(file_path, 'a') do |f|
    f.puts data
  end
end
