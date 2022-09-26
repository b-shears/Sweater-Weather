class Book 
    attr_reader :title, :isbn, :publisher

    def initialize(attributes)  
        @title = attributes[:title]
        @isbn = attributes[:isbn]
        @publisher = attributes[:publisher]
    end 
end 