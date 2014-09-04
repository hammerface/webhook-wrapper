module Utils
  def self.scan_file(regex)
    val = nil
    File.readlines("config_file").each do |line|
      val = line.gsub(regex, '\1')
      break if (nil != val && line != val)
      val = nil
    end
    return val
  end
  
  def self.get_p4
    p4_regex = /^p4:\s+(.+)?\s*$/
    return Utils::scan_file(p4_regex)
  end
  
  def self.get_server
    server_regex = /^server:\s+(.+)?\s*$/
    return Utils::scan_file(server_regex)
  end
  
  def self.get_user
    user_regex = /^user:\s+(.+)?\s*$/
    return Utils::scan_file(user_regex)
  end

  def self.get_password
    password_regex = /^password:\s+(.+)?\s*$/
    return Utils::scan_file(password_regex)
  end

  def self.get_webhook_urls(keyname)
    require 'json'

    p4       = get_p4
    server   = get_server
    user     = get_user
    password = get_password

    keystring = `#{p4} -p #{server} -u #{user} -P #{password} key #{keyname}`

    unless keystring == ''
      begin
        parsed = JSON.parse(keystring)
        return parsed
      rescue ArgumentError
        return []
      end
    else
      return ['Perforce server could not be reached']
    end
  end

  def self.send_webhook_urls(keyname, urls)
    val = '['
    urls.each do |url|
      val << "\\\""
      val << url
      val << "\\\","
    end
    val << ']'
    val = val.gsub(',]', ']')

    p4       = get_p4
    server   = get_server
    user     = get_user
    password = get_password

    keystring = `#{p4} -p #{server} -u #{user} -P #{password} key #{keyname} \
                 #{val}`
  end
end
