class Web::Shop::ApplicationController < Web::ApplicationController
  include UserAuthentication
  include CurrentCart
end