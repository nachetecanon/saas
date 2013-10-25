require 'debugger'              # optional, may be helpful
require 'open-uri'              # allows open('http://...') to return body
require 'cgi'                   # for escaping URIs
require 'nokogiri'              # XML parser
require 'active_model'          # for validations

class OracleOfBacon

  class InvalidError < RuntimeError ; end
  class NetworkError < RuntimeError ; end
  class InvalidKeyError < RuntimeError ; end

  attr_accessor :from, :to
  attr_reader :api_key, :response, :uri
  
  include ActiveModel::Validations
  validates_presence_of :from
  validates_presence_of :to
  validates_presence_of :api_key
  validate :from_does_not_equal_to

  def from_does_not_equal_to
    if @from.present? and @to.present? and @from==@to
      errors.add(:from,'From cannot be the same as To')
    end
  end

  def initialize(api_key='38b99c9c87')
    @api_key=api_key
    @from = 'Kevin Bacon'
    @to = 'Kevin Bacon'
  end

  def find_connections
    make_uri_from_arguments
    begin
      xml = URI.parse(uri).read
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
      Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
      Net::ProtocolError => e
      raise NetworkError.new(e.message)
    end
    Response.new(xml)
  end

  def make_uri_from_arguments
    @uri="http://oracleofbacon.org/cgi-bin/xml?p=#{CGI::escape(@api_key)}&a=#{CGI::escape(@from)}&b=#{CGI::escape(@to)}"
  end
      
  class Response
    attr_reader :type, :data
    # create a Response object from a string of XML markup.
    def initialize(xml)
      @doc = Nokogiri::XML(xml)
      parse_response
    end

    private

    def parse_response
      if ! @doc.xpath('/error').empty?
        parse_error_response
      elsif ! @doc.xpath('/link').empty? #graph
        parse_graph
      elsif ! @doc.xpath('/spellcheck').empty? #spellcheck
        parse_spellcheck
      else
        parse_unknown
      end
    end
    def parse_graph
      @type = :graph
      @data = Array.new
      @doc.xpath('//actor|//movie').children.to_a.each { |t| @data<< "#{t.inner_text}" }
    end
    def parse_spellcheck
      @type = :spellcheck
      @data = Array.new
      @doc.xpath('//match').children.to_a.each { |t| @data<< "#{t.inner_text}" }
    end
    def parse_error_response
      @type = :error
      @data = 'Unauthorized access'
    end
    def parse_unknown
      @type = :unknown
      @data = 'unknown'
    end
  end

end




