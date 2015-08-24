class Blog

  include DataMapper::Resource

    property :id, Serial
    property :content, Text, :length => 6000
    property :title, String
    has n, :tags, through: Resource

end
