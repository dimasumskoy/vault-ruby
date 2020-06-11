require_relative 'modules'

module Client
  class Store
    @users = []
    @order = []

    def self.users
      @users
    end

    def self.orders
      @orders
    end

    def call
      sign_in

      loop do
        interface
        input = gets.chomp.strip

        break if input.downcase == 'exit'

        process_input(input)
      end
    end

    private

    attr_accessor :current_user

    def process_input(input)
      case input.to_i
      when 1
        choose_item
      when 2
        make_order
      when 3
        place_order
      when 4
        user_items
      else
        puts "Incorrect input"
      end
    end

    def user_items
      current_user.cart.items.each.with_index(1) do |item, index|
        puts "#{index}. #{item.name}, #{item.price}"
      end
    end

    def choose_item
      list_items

      input = gets.chomp.strip
      item = Item.all[input.to_i - 1]

      current_user.cart.items << item
    end

    def list_items
      Item.all.map.with_index(1) do |item, index|
        puts "#{index}. #{item.name}, #{item.price}"
      end
    end

    def interface
      puts '==='

      %w[
        Choose\ item
        Make\ order
        Place\ order
        My\ items
        Exit
      ].each.with_index(1) do |opt, index|
        puts "#{index}. #{opt}"
      end
    end

    def sign_in
      attrs = {}

      puts "Name:"
      attrs[:name] = gets.chomp.strip

      puts "Email:"
      attrs[:email] = gets.chomp.strip

      puts "Phone:"
      attrs[:phone] = gets.chomp.strip

      self.current_user = User.new(attrs)
    end
  end

  class User
    include Validatable

    attr_reader :name, :email, :phone
    attr_accessor :cart
    
    def initialize(**params)
      @name = params[:name]
      @email = params[:email]
      @phone = params[:phone]

      @cart = Cart.new
    end
  end

  class Item
    include Validatable

    class << self
      def all
        @all ||= collection
      end

      def collection
        Array.new(10) { |n| new(name: "Item ##{n}", price: 50) }
      end
    end

    attr_reader :name
    attr_accessor :price

    def initialize(name:, price: 0)
      @name = name
      @price = price

      validate
    end

    private
    
    def validate
      raise unless present?(self.name)
      raise if self.price < 0
    end
  end

  class Cart
    attr_reader :items

    def initialize
      @items = []
    end
  end

  class Order

  end
end


Client::Store.new.call
