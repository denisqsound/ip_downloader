require 'webrick'
server = WEBrick::HTTPServer.new :Port => 8888, :BindAddress => '0.0.0.0'

#IP2LOCATION

server.mount_proc '/download' do |req, res|
  if req.query["token"] == '123'
    case req.query['file']
    when 'PX2'
      res['Content-Type']= 'application/zip'
      res.body = IO.binread('ipv4')
    when 'PX2IPV6'
      res['Content-Type']= 'application/zip'
      res.body = IO.binread('ipv6')
    else
      res.body = "no permission, you are loh"
    end
  else
    res.body = "no permission, you are loh"
  end
end


#TOR

server.mount_proc '/torlist' do |req, res|
  res.body = IO.binread('tor') # eval(value).to_s
  res['Content-Type'] = 'text/html'
end


#AZURE

server.mount_proc '/azure' do |req, res|
  res.body = IO.binread('azure')
  res['Content-Type'] = 'text/html'
end

server.mount_proc '/azure_xml' do |req, res|
  res.body = IO.binread('azure_xml')
  res['Content-Type'] = 'application/xml'
end


#GCE

server.mount_proc '/gce' do |req, res|
  res.body = IO.binread('gce') # eval(value).to_s
  res['Content-Type'] = 'text/html'
end


#AZURE_XML

server.mount_proc '/azure_xml' do |req, res|
  res.body = IO.binread('azure_xml_xml') # eval(value).to_s
  res['Content-Type'] = 'text/html'
end


#AWS

server.mount_proc '/aws' do |req, res|
  res.body = IO.binread('aws') # eval(value).to_s
  res['Content-Type'] = 'text/html'
end
trap('INT') { server.stop }
server.start
