class Phone_number
  attr_accessor(:phone_number, :area_code, :type)

  define_method(:initialize) do |attributes|
    @phone_number = attributes.fetch(:phone_number)
    @area_code = attributes.fetch(:area_code)
    @type = attributes.fetch(:type)
  end
end
