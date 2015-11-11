class District

 attr_reader :name

 def initialize(hash)
   @name = hash[:location].upcase
 end

end
