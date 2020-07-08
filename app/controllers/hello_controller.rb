class HelloController < ApplicationController
  layout :choose_layout

  def choose_layout
    if matcher_signed_in? || admin_signed_in? || propietario_local_signed_in?
      'application'
    else
      'home'
    end
  end
end
