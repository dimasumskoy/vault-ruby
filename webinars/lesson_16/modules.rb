module Validatable
  def self.included(base)
    base.include InstanceMethods
    base.extend ClassMethods
  end

  module ClassMethods
    def validate
      puts 'Validate from class'
    end
  end

  module InstanceMethods
    def validate
      puts 'Validate from instance'
    end
  end

  module User
    def validate
      validate_phone
      validate_email
    end

    def validate_phone
      raise "Invalid length" unless phone.lenght == 11
      raise "Invalid phone number" unless phone.match(/^[0-9]+$/)
    end

    def validate_email
      raise "Email must exist" unless email
    end
  end
end
