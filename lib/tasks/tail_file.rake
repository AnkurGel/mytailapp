require 'open-uri'
require 'net/http'
require 'rb-inotify'

desc "Follow the tail of foo_file"
task :tail_follow, :environment do
  file = File.join(Dir.pwd, 'foofile')
  if !File.exists?(file)
    file = File.open(file, 'wb')
    file.write('foo')
    file.close
  end
    initial_read = File.read(file).split("\n")


  uri = URI.parse("http://localhost:9292/faye")

  notifier = INotify::Notifier.new
  notifier.watch(file, :modify) do
    tail_read = File.read(file).split("\n")
    change = tail_read[-(tail_read.size - initial_read.size)..tail_read.size].join("\n")
    initial_read = tail_read
    Net::HTTP.post_form(uri,
                        message: { channel: "/messages/new", data: change }.to_json)
  end
  notifier.run

end
