class Audiobook < ApplicationRecord
  has_attached_file :pdf
  do_not_validate_attachment_file_type :pdf
  has_many :pages
end
