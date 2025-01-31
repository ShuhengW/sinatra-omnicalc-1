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
  @num = params[:number].to_f
  @result = Math.sqrt(@num)
  erb (:square_root_result)
end

get("/payment/new") do
  erb (:payment_form)
end

get("/payment/results") do
  @apr = params[:apr].to_f / 100 / 12
  @years = params[:years].to_i * 12
  @principal = params[:principal].to_f
  @monthly_payment = (@apr * @principal) / (1- (1 + @apr)**-@years)
  erb (:payment_result)
end
