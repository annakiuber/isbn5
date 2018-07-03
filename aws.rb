require 'rubygems'
require 'aws-sdk-s3'
require 'csv'

load './local_env.rb' if File.exist?('./local_env.rb')

def connect_to_s3()
client = Aws::S3::Client.new(
  region: ENV['AWS_REGION'],
    secret_access_key: ENV['S3_SECRET'],
    access_key_id: ENV['S3_KEY']
  )
  file = "isbn_file.csv"
  bucket = 'annaisbn'
  s3 = Aws::S3::Resource.new(client: client)
  obj = s3.bucket(bucket).object(file)
    File.open('isbn_file.csv', 'rb') do |file|
      obj.put(body: file)
    end
end

def connect_to_s3_2()
client = Aws::S3::Client.new(
  region: ENV['AWS_REGION'],
    secret_access_key: ENV['S3_SECRET'],
    access_key_id: ENV['S3_KEY']
  )
  file = "isbn_file.csv"
  bucket = 'annaisbn'
  s3 = Aws::S3::Resource.new(client: client)
  obj = s3.bucket(bucket).object(file)
    File.open('isbn_file2.csv', 'rb') do |file|
      obj.put(body: file)
    end
end




# require 'aws-sdk-s3'
# require 'csv'
# require_relative 'isbn.rb'
# load './local_env.rb' if File.exist?('./local_env.rb')
# def send_to_bukkit()
# 	# Aws.config.update({
#   # credentials: Aws::Credentials.new('******', '************')
# #})
#   s3 = Aws::S3::Resource.new(
#   region: ENV['AWS_REGION'],
#   secret_access_key: ENV['S3_SECRET'],
#   access_key_id: ENV['S3_KEY'])
#   bucket = s3.bucket('annaisbn')
#   name = File.basename "isbn_file.csv"
#   obj = s3.bucket('annaisbn').object(name)
#   obj.upload_file(name)
# end
# def pull_csv_from_s3_into_local(read_file, write_file)
#  client = Aws::S3::Client.new(
#    region: ENV['AWS_REGION'],
#    secret_access_key: ENV['S3_SECRET'],
#    access_key_id: ENV['S3_KEY'])
#  bucket = ‘annaisbn’
#  s3 = Aws::S3::Resource.new(client: client)
#  obj = s3.bucket(bucket).object(read_file)
#  #Gets the objects data and saves it to the target file.
#  obj.get(response_target: write_file)
# end
# # def check_if_file_exists(filename)
# #  s3 = Aws::S3::Resource.new(
# #    region: ENV['AWS_REGION'],
# #    secret_access_key: ENV['S3_SECRET'],
# #    access_key_id: ENV['S3_KEY'])
# #  bucket =  s3.bucket(‘annaisbn’)
# #
# #  file = File.basename(filename)
# #
# #  if bucket.object(file).exists?
# #    puts “File ‘/annaisbn/#{file}’ is present in S3 bucket!”
# #    return true
# #  else
# #    puts “File ‘/annaisbn/#{file}’ is not in S3 bucket!”
# #    return false
# #  end
# # end
#
# def upload_new_file_to_bucket(file)
#  # Double colon :: accesses items inside of classes/modules
#  # In this case we access S3 of Aws, then Client of S3
#  client = Aws::S3::Client.new(
#    region: ENV['AWS_REGION'],
#    secret_access_key: ENV['S3_SECRET'],
#    access_key_id: ENV['S3_KEY'])
#
#  bucket = ‘annaisbn’
#
#  #Grabs the filename, stripping any extra dir text.
#  name = File.basename(file)
#
#  s3 = Aws::S3::Resource.new(client: client)
#  #Creates the object for upload.
#  obj = s3.bucket(bucket).object(name)
#  obj.upload_file(file)
# end
#
# # send_to_bukkit(isbn_file.csv)
#
# # def get_dat()
# # 	s3 = Aws::S3::Client.new
# # 	mybuketfile = s3.get_object(bucket:"annaisbn", key:"isbn_file.csv")
# # 	numbr = mybuketfile.body.read
# # end
