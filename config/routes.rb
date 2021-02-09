Rails.application.routes.draw do
  get 'disbursements' => 'disbursements#report'
end
