require "capybara"
require "capybara/dsl"
require 'pry'

require 'capybara/poltergeist'
Capybara.configure do |c|
  c.javascript_driver = :poltergeist
  c.default_driver = :poltergeist
end
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
    js_errors: false
  })
end

# Capybara.run_server = false
# Capybara.current_driver = :webkit
Capybara.app_host = "https://www.cofidis.fr/"

  include Capybara::DSL
  page.driver.browser.clear_cookies
  visit('/')
  select('Auto / moto', :from => 'data_projectChoice')
  # methodo:
  # select X, from: Y
  # X should be an option label, not an option value
  fill_in('I1:inputTxtAmount', :with => '10000')
  click_on('Trouvez votre crédit')
  # base sur le title
  sleep 3
  puts page.find_by_id("C:idTaeg11").text

  #   find('.login-username-link').click
  #   fill_in('username-login-username', with: username)
  #   fill_in('username-login-password', with: password)
  #   find('#username-login-submit').click
  # # @transco =
  # {
  #   "voiture neuve" => '1',
  #   "voiture d'occasion" => '1',
  #   "travaux" => '2',
  #   "prets personnels" => '3'
  # }
  # TABLE SOFINCO
  #Auto-moto => 1
  # Travaux => 2
  # Besoin d'argent => 3
  # Rachat de credit => 4

    # @companies.each do |company|

        # agent = Mechanize.new
        # agent.cookie_jar.clear!
        # page = agent.get()
        # binding.pry
        # @credit = Credit.find_by_id(100)
        # @company = Company.find_by_id(1)
        # @company_id = @company.id
        # @project = @credit.project
        # @code_projet = Transco.find_by_company_id_and_project(@company_id,@project)
        # puis utiliser le @project_code dans le hash :value => '501'

        # myform = page.form()
        # # myform['#kamselect'] = '1'
        # form = page.form_with(:id => 'I1:P:F')
        # select_field = form.field_with(:id => 'I1:D2:DataEntry').option_with(:value => "05").click

        # form['I1:inputTxtAmount'] = 10000
        # form['_wxf2_cc'] = 'fr-FR'
        # page = form.submit(form.button_with(value: ' Trouvez votre crédit   '))
        # sleep 4
        # pp page.title

    #     data = page.search('.important.taeg')
    #     pp data.text
    #     data = page.search('.valeur')
    #     pp data
    #     Comparison.create(
    #       benchmark_date: DateTime.now,
    #       company_id: @company.id,
    #       credit_id: credit.id,
    #       rate: data) # ici verifier que le @data est bien pertinente
    #   end
    # end

