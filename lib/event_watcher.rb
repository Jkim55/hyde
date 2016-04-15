require 'listen'

module EventWatcher

  def watch(filepath)
    listener = Listen.to(filepath) do |modified, added, removed|
      puts "modified absolute path: #{modified}"
      puts "added absolute path: #{added}"
      puts "removed absolute path: #{removed}"
      
      File.write(filepath)
  end

    listener.start
    sleep
  end

end
