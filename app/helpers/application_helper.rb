module ApplicationHelper
  def broadcast(channel, &block)
    message = { channel: channel, data: capture(&block) }
    uri = URI.parse("http://localhost:9292/faye")
    debugger
  end
end
