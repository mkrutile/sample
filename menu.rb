class Menus
    attr_reader  :id, :name, :price

    def initialize(**params)
        @id = params[:id]
        @name = params[:name]
        @price = params[:price]
    end
end
