require 'rails_helper'

RSpec.describe "to_dos/show", type: :view do
  before(:each) do
    assign(:to_do, ToDo.create!(
      name: "Name",
      company: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
  end
end
