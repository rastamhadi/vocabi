# frozen_string_literal: true

<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :authenticate_user!
  before_action :set_<%= singular_table_name %>, only: %i[show edit update destroy]

  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
  end

  def show; end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  def edit; end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>

    if @<%= orm_instance.save %>
      redirect_to @<%= singular_table_name %>, notice: '<%= human_name %> was successfully created.'
    else
      render :new
    end
  end

  def update
    if @<%= orm_instance.update("#{singular_table_name}_params") %>
      redirect_to @<%= singular_table_name %>, notice: '<%= human_name %> was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @<%= singular_table_name %>.destroy
    redirect_to <%= index_helper %>_url, notice: '<%= human_name %> was successfully destroyed.'
  end

  private

  def set_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, 'params[:id]') %>
  end

  def <%= singular_table_name %>_params
    params.require(:<%= singular_table_name %>).permit(<%= permitted_params %>)
  end
end
<% end -%>
