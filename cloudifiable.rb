require 'rubygems'
require 'sinatra'
require 'aws-sdk'

get '/' do
	@aws_access_key = ENV['aws_access_key']
	@aws_secret_key = ENV['aws_secret_key']
	@sqs_queue_name = ENV['sqs_queue_name']

	erb :home
end

post '/phonenumber' do
	# submit phone number to SQS
	sqs = AWS::SQS.new( :access_key_id => ENV['aws_access_key'], :secret_access_key => ENV['aws_secret_key'])
	q = sqs.queues.named(ENV['sqs_queue_name'])
	q.send_message(params[:number])

	erb :phonenumber
end