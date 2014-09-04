class Url
  include Enumerable

  attr_accessor :urls

  def initialize(key)
    @urls = Utils::get_webhook_urls(key).uniq 
    return @urls
  end

  def new(key)
  end

  def each(&block)
    @urls.each(&block)
  end

  def <<(url)
    @urls << url
  end

  def delete(url)
    @urls.delete(url)
  end

  def uniq
    @urls.uniq
  end

=begin
     validates_presence_of :trig_type
     validates_presence_of :address
     validates_uniqueness_of :address, scope: :trig_type
     validate :trig_type_is_valid

     def trig_type_is_valid
       "change" == :trig_type || "shelve" == :trig_type || "form" == :trig_type
     end
=end
 end
