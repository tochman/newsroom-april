require 'rails_helper'

RSpec.describe Location, type: :model do
  it {is_expected.to have_db_column :latitude}
  it {is_expected.to have_db_column :longitude}
end
