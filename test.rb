def create_instance_cmdline(path)
  puts "estoy entrando a crear el comando pinky"
  cmdline = "#{path}"
  comando = "memcached "
  cmdline.each_line do  |s|
    paso = s.split
    if paso.length>1
       if paso[0].downcase=="port" 
          comando = comando + " -p"+paso[1]
       else if paso[0].downcase=="daemonize"
          comando = comando + " -D"
            end
       end
    end
  end 
  puts "voy a ejecutar:"
  puts comando
  cmdline
end


def process_file(filename)
  puts "estoy entrando a procesar " + filename
  text = File.read(filename)
  create_instance_cmdline(text)
end

process_file("./pelos4.txt")

