require('spec_helper')

describe('when using the features of the band page', {:type => :feature}) do
  it('accesses the page') do
    visit('/')
    click_on('bands')
    expect(page).to have_content('bands')
  end

  it('adds a band') do
    visit('/')
    click_on('bands')
    fill_in('name', :with => 'Motley Crue')
    click_button('add band')
    expect(page).to have_content('Motley crue')
  end

  it('view a band page') do
    visit('/')
    click_on('bands')
    fill_in('name', :with => 'Rage the machine')
    click_button('add band')
    click_link('Rage the machine')
    expect(page).to have_content('assign')
  end

end
