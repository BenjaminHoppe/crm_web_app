require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{first_name} #{last_name}"
  end

end

p benjamin = Contact.create(
  first_name: "Benjamin",
  last_name:  "Hoppe",
  email:      "Benjamin@mail.com",
  note:       "He probally should be sleeping right now."
)
puts benjamin.inspect
