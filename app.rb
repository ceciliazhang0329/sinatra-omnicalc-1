require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "

end

get("/square/new") do
  erb(:new_square)
end

get("/square/results") do
  @num = params.fetch("number").to_f
  @squared_num = @num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_squareroot)
end

get("/square_root/results") do
  @num2 = params.fetch("user_number").to_f
  @squaredroot_num = Math.sqrt(@num2)

  erb(:squareroot_results)
end

get("/payment/new") do
  erb(:new_payment)
end

get("/payment/results") do
  @user_apr = params["user_apr"].to_f / 100  # Convert to decimal if user inputs as percentage
  @user_years = params["user_years"].to_f
  @user_pv = params["user_pv"].to_f

  @rate_monthly = @user_apr / 12
  @period_monthly = @user_years * 12 
  
  @numerator = @rate_monthly * @user_pv
  @denominator = 1 - (1 + @rate_monthly) ** -@period_monthly  

  @result = @numerator / @denominator

  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random)
end

get("/random/results") do

  @min = params.fetch("user_min").to_f  # Assuming user_input_min holds the minimum value and converting it to float
  @max = params.fetch("user_max").to_f  # Assuming user_input_max holds the maximum value and converting it to float

  @random_float = rand(@min...@max)

  erb(:random_results)
end
