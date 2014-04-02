

class Post2Zendesk

  require 'net/http'
  require 'net/https'
  require 'yaml'
  require 'json'
  require 'uri'

  def initialize
    configdata = YAML.load_file(ENV['HOME'] + '/.post2zendesk.yaml')
    @uri = URI.parse("https://#{configdata['baseurl']}/")
    @username = configdata['username']
    @password = configdata['password']
  end

  def makerequest(type='Get', body='')
    @http = Net::HTTP.new(@uri.host, @uri.port)
    @http.use_ssl = true
    @http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    if type == 'Get'
      @request = Net::HTTP::Get.new(@uri.request_uri)
    elsif type == 'Put'
      @request = Net::HTTP::Put.new(@uri.request_uri)
      @request['Content-Type'] = 'application/json'
      @request.body = body
    else
      raise ArgumentError.new('Unrecognized HTTP request type.')
    end

    @request.basic_auth(@username, @password)
    return @response = @http.request(@request).body
  end

  def updateticket(ticketid, comment, status='pending', is_public='true')
    # https://support.puppetlabs.com/api/v2/tickets/3717.json
    @uri.path = "/api/v2/tickets/#{ticketid.to_s}.json"

    updatearray = { 
      'ticket' => {
        'status'  => status,
        'comment' => { 'body' => comment, 'public' => is_public }
      }
    }
    updatearray_json = updatearray.to_json
    @response = makerequest('Put', updatearray_json)
  end

  def printreply
    response_hash = JSON.parse(@response)
    puts "Ticket #{response_hash['ticket']['id']} updated. Probably."
    puts "Status: #{response_hash['ticket']['status']}"
  end

end
