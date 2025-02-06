require "sinatra"
require "sinatra/reloader"
get("/") do
  erb (:square_form)
end

get("/square/new") do
  erb (:square_form)
end

get("/square/results") do
  @num = params[:number].to_f
  @result = @num * @num
  erb (:square_result)
end

get("/square_root/new") do
  erb (:square_root_form)
end

get("/square_root/results") do
  @num = params[:user_number].to_f
  @result = Math.sqrt(@num)
  erb (:square_root_result)
end

get("/payment/new") do
  erb (:payment_form)
end

get("/payment/results") do
  @apr_print = params[:user_apr].to_f
  @years_print = params[:user_years].to_i
  @principal_print = params[:user_pv].to_f
  @apr = params[:user_apr].to_f / 100 / 12
  @years = params[:user_years].to_i * 12
  @principal = params[:user_pv].to_f
  @monthly_payment = (@apr * @principal) / (1- (1 + @apr)**-@years)
  erb (:payment_result)
end

get("/random/new") do

  erb(:random_form)

end

get("/random/results") do

  @min_num = params[:user_min].to_f
  @max_num = params[:user_max].to_f

  @random_number = rand(@min_num..@max_num)
  erb(:random_result)
end
