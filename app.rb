require_relative 'config/environment'
require 'pry'

class App < Sinatra::Base
  # Write your code here!

  get '/reversename/:name' do
    @revname = params[:name].reverse
    "#{@revname}"
  end

  get '/square/:number' do
    @base=params[:number].to_i
    @sqd=@base*@base
    "#{@sqd.to_s}"
  end


  get "/say/:word1/:word2/:word3/:word4/:word5" do
      returnstring = ""
     # binding.pry
      for i in 1..5 do
        # puts "WHAT???"
        indexsym="word#{i}".to_sym
         # binding.pry

        returnstring << "#{params.send(:[],indexsym)} "
          # binding.pry
      end
      returnstring.rstrip + "."
    end

  get "/say/:number/:phrase" do
    @num = params[:number].to_i
    returnstring = ""
    @num.times do
      returnstring << "#{params[:phrase]}\n"
      end
    returnstring
  end

  get "/:operation/:number1/:number2" do
    oper = case params[:operation]
    when "add"
      "+"
    when "subtract"
      "-"
    when "multiply"
      "*"
    when "divide"
      "/"
    end
    num1 = params[:number1].to_i
    num2 = params[:number2].to_i
    "#{num1.send("#{oper}", num2)}"
    # # binding.pry
    # "#{result}"
  end

end
