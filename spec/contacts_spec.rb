require('rspec')
require('contact')
require('mailing_address')
require('phone_number')
require('email_address')

describe(Contact) do
  describe("#first_name") do
    it("returns the first_name of the contact") do
      test_contact = Contact.new({:first_name => "Peter", :last_name => "Pumpkineater", :job_title => "Pumkin Eater", :company => "Google"})
      expect(test_contact.first_name).to(eq("Peter"))
    end
  end
  describe("#add_mailing_address") do
    it("adds a new mailing_address to the contact") do
      test_contact = Contact.new({:first_name => "Peter", :last_name => "Pumpkineater", :job_title => "Pumkin Eater", :company => "Google"})
      test_mailing_address = Mailing_address.new({:street_address => "123 Fake Street", :city => "Faketon", :state => "Fakeland", :zip => "55555", :type => "home"})
      expect(test_contact.add_mailing_address(test_mailing_address)).to(eq([test_mailing_address]))
    end
  end
  describe("#add_phone_number") do
    it("adds a new phone number to the contact") do
      test_contact = Contact.new({:first_name => "Peter", :last_name => "Pumpkineater", :job_title => "Pumkin Eater", :company => "Google"})

      test_phone_number= Phone_number.new({:phone_number => "456-7890", :area_code => "(123)", :type => "Mobile"})
      expect(test_contact.add_phone_number(test_phone_number)).to(eq([test_phone_number]))
    end
  end
  describe("#add_email_address") do
    it("adds a new email address to the contact") do
      test_contact = Contact.new({:first_name => "Peter", :last_name => "Pumpkineater", :job_title => "Pumkin Eater", :company => "Google"})
      test_email1 = Email_address.new({:email => "default@default.com"})
      test_email2 = Email_address.new({:email => "fake@fake.com"})
      test_contact.add_email_address(test_email1)
      test_contact.add_email_address(test_email2)
      expect(test_contact.emails).to(eq([test_email1, test_email2]))
    end
  end
end
