require('sinatra')
require('sinatra/reloader')
require('./lib/contact')
require('./lib/email_address')
require('./lib/mailing_address')
require('./lib/phone_number')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/contacts') do
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts/new') do
  erb(:contacts_form)
end

post('/contacts') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  job_title = params.fetch('job_title')
  company = params.fetch('company')
  Contact.new({:first_name => first_name, :last_name => last_name, :job_title => job_title, :company => company}).save()
  @contacts = Contact.all()
  erb(:contacts)
end

get('/contacts/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact)
end

get('/contacts/:id/emails/new') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:email_address_form)
end

post('/contacts/:id') do
  email = params.fetch('email')
  @email = Email_address.new({:email => email})
  contact = Contact.find(params.fetch('id').to_i())
  contact.add_email_address(@email)
  @contact = contact
  erb(:contact)
end
