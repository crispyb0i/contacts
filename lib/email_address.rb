class Email_address
  attr_accessor(:email)

  define_method(:initialize) do |attributes|
    @email = attributes.fetch(:email)
  end
end
