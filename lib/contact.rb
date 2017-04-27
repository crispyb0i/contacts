class Contact

  @@contacts = []

  attr_accessor(:first_name, :last_name, :job_title, :company, :mailing_addresses, :phone_numbers, :emails, :id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job_title = attributes.fetch(:job_title)
    @company = attributes.fetch(:company)
    @mailing_addresses = []
    @phone_numbers = []
    @emails = []
    @id = @@contacts.length().+(1)
  end

  define_method(:add_mailing_address) do |mailing_address|
    @mailing_addresses.push(mailing_address)
  end

  define_method(:add_phone_number) do |phone_number|
    @phone_numbers.push(phone_number)
  end

  define_method(:add_email_address) do |email_address|
    @emails.push(email_address)
  end

  define_singleton_method(:all) do
   @@contacts
 end

 define_method(:save) do
   @@contacts.push(self)
 end

 define_singleton_method(:clear) do
   @@contacts = []
 end

define_singleton_method(:find) do |identification|
  found_contact = nil
  @@contacts.each() do |contact|
    if contact.id.eql?(identification)
      found_contact = contact
    end
  end
  found_contact
 end
end
