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

    def process_input(input)
      case input.to_i
      when 1
        list_items
      when 2
        choose_item
      when 3
        make_order
      when 4
        place_order
      else
        puts "Incorrect input"
      end
    end

    def list_items
      Item.all.map do |item|
          puts "#{item.name}, #{item.price}"
        end
    end

    def interface
      %w[
        List\ items
        Choose\ item
        Make\ order
        Place\ order
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

      self.class.users << User.new(attrs)
    end
  end

  class User
    include Validatable::User

    @all = []

    attr_reader :name, :email, :phone
    attr_accessor :cart
    
    def initialize(**params)
      @name = params[:name]
      @email = params[:email]
      @phone = params[:phone]

      validate
    end
  end

  class Item
    include Validatable::Item

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

    def initialize(name:, price:)
      @name = name

      validate
    end
  end

  class Cart

  end

  class Order

  end
end


# Store.new.call
