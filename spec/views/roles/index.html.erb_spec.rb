require 'rails_helper'

RSpec.describe "roles/index", type: :view do
  before(:each) do
	  page = 1
	  per_page = 1
	  total_entries = 4
	  roles = WillPaginate::Collection.create(page, per_page, total_entries) do |pager|
	    pager.replace([create(:role), create(:role), create(:role), create(:role)])
	  end
	  assign(:roles, roles)
  end

  it "renders a list of roles" do
    render
  end
end
