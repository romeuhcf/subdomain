#http://railscasts.com/episodes/221-subdomains-in-rails-3?view=asciicast
##requier initializer Rails.configuration.domain
module Subdomain
  module Portal
    def self.matches?(request)
      request.subdomain(Subdomain.tld.size).present? and ( request.subdomain(Subdomain.tld.size) == "www"  or request.subdomain(Subdomain.tld.size) == "www"   )
    end
  end

  module Admin
    def self.matches?(request)
      request.subdomain(Subdomain.tld.size).present? and  request.subdomain(Subdomain.tld.size) == "admin" 
    end
  end
 
  module Tenant
    def self.matches?(request)
      request.subdomain(Subdomain.tld.size).present? && request.subdomain(Subdomain.tld.size) != "www" && request.subdomain(Subdomain.tld.size) != "admin"
    end
  end


  def self.subdomain(req)
	  req.subdomain(tld.size)
  end	  
  def self.domain
	  @@domain ||= Rails.configuration.domain.split '.'
  end

  def self.tld
	  @@tld ||= domain[1,99]
  end
end

module UrlHelper
  def with_subdomain(subdomain)
    subdomain = (subdomain || "")
    subdomain += "." unless subdomain.empty?
    [subdomain, request.domain(Subdomain.tld.size), request.port_string].join
  end
  
  def url_for(options = nil)
    if options.kind_of?(Hash) && options.has_key?(:subdomain)
      options[:host] = with_subdomain(options.delete(:subdomain))
    end
    super
  end
end


