module Utils
  def self.get_webhook_urls(keyname)
    require 'json'

    p4       = '/usr/local/bin/p4'
    server   = '10.0.102.53:1209'
    user     = 'jbrower'
    password = 'j1ml1nk1'
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
end
