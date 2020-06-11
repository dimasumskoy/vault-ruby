module Validatable
  private

  def validate_phone
    raise "Invalid phone length" unless phone.length == 11
    raise "Invalid phone number" unless phone.match(/^[0-9]+$/)
  end

  def validate_email
    raise "Email must exist" unless email
  end

  def present?(object)
    !(object.nil? || object == '')
  end
end
