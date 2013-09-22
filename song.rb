class Song
  include Mongoid::Document
  
  field :title, type:String
  field :lyrics, type:String
  field :length, type:Integer
  field :released_on, type:Date
  
end