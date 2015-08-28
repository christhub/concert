require('spec_helper')

describe('when using the features of the band page', {:type => :feature}) do
  it('accesses the page') do
    visit('/')
    click_on('venues')
    expect(page).to have_content('venues')
  end

  it('adds a venue') do
    visit('/')
    click_on('venues')
    fill_in('name', :with => 'Att park')
    click_button('add venue')
    expect(page).to have_content('Att park')
  end

  it('view a venue page') do
    visit('/')
    click_on('venues')
    fill_in('name', :with => 'metlife stadium')
    click_button('add venue')
    click_link('Metlife stadium')
    expect(page).to have_content('delete')
  end

end
