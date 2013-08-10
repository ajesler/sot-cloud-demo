require 'rubygems'
require 'sinatra'
require 'aws-sdk'

get '/' do
	erb :home
end

post '/phonenumber' do
	# submit phone number to SQS
	sqs = AWS::SQS.new( :access_key_id => ENV['aws_access_key'], :secret_access_key => ENV['aws_secret_key'])
	q = sqs.queues.named(ENV['sqs_queue_name'])
	
	q_msg = "#{params[:number]}:#{params[:name]}"
	q.send_message(q_msg)

	erb :phonenumber
end

get '/env' do
	@aws_access_key = ENV['aws_access_key']
	@aws_secret_key = ENV['aws_secret_key']
	@sqs_queue_name = ENV['sqs_queue_name']
	erb :env
end