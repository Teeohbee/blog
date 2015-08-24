class Blog

  include DataMapper::Resource

    property :id, Serial
    property :content, String
    property :title, String

end
