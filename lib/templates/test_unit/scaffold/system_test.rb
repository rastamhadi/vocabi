# frozen_string_literal: true

require 'application_system_test_case'

<% module_namespacing do -%>
class <%= class_name.pluralize %>Test < ApplicationSystemTestCase
  setup do
    user = create(:user)
    sign_in user
  end

  test 'visiting the index' do
    visit <%= plural_table_name %>_url
    assert_selector 'h1', text: '<%= class_name.pluralize.titleize %>'
  end

  test 'creating a <%= class_name %>' do
    <%= singular_table_name %> = build_stubbed(:<%= singular_table_name %>)

    visit <%= plural_table_name %>_url
    click_on 'New'

    <%- attributes_hash.keys.each do |attribute| -%>
    fill_in '<%= attribute.humanize %>', with: <%= singular_table_name %>.<%= attribute %>
    <%- end -%>
    click_on 'Create <%= class_name.titleize %>'

    assert_text '<%= class_name.titleize %> was successfully created'
    <%- attributes_hash.keys.each do |attribute| -%>
    assert_text <%= singular_table_name %>.<%= attribute %>
    <%- end -%>
    click_on 'Back'
  end

  test 'updating a <%= class_name %>' do
    _old_<%= singular_table_name %> = create(:<%= singular_table_name %>)
    new_<%= singular_table_name %> = build_stubbed(:<%= singular_table_name %>)

    visit <%= plural_table_name %>_url
    click_on 'Edit', match: :first

    <%- attributes_hash.keys.each do |attribute| -%>
    fill_in '<%= attribute.humanize %>', with: new_<%= singular_table_name %>.<%= attribute %>
    <%- end -%>
    click_on 'Update <%= class_name.titleize %>'

    assert_text '<%= class_name.titleize %> was successfully updated'
    <%- attributes_hash.keys.each do |attribute| -%>
    assert_text new_<%= singular_table_name %>.<%= attribute %>
    <%- end -%>
    click_on 'Back'
  end

  test 'destroying a <%= class_name %>' do
    create(:<%= singular_table_name %>)

    visit <%= plural_table_name %>_url
    page.accept_confirm do
      click_on 'Delete', match: :first
    end

    assert_text '<%= class_name.titleize %> was successfully destroyed'
  end
end
<% end -%>
