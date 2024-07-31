require 'aws-sdk-s3'         # Load the AWS SDK for S3
require 'pry'                # Load Pry for debugging
require 'securerandom'       # Load SecureRandom for generating UUIDs

# Get the bucket name from environment variable 'BUCKET_NAME'
bucket_name = ENV['BUCKET_NAME']
# Define the AWS region where the bucket will be created
region = 'ca-central-1'

# Initialize a new S3 client
client = Aws::S3::Client.new

# Create a new S3 bucket with the specified name and region
resp = client.create_bucket({
  bucket: bucket_name, 
  create_bucket_configuration: {
    location_constraint: region, 
  }
})

# Pause execution and open a Pry console for debugging
#binding.pry

# Generate a random number of files between 1 and 6
number_of_files = 1 + rand(6)
puts "number_of_files: #{number_of_files}" # Print the number of files to be created

# Iterate 'number_of_files' times to create and upload files
number_of_files.times.each do |i|
  puts "i : #{i}" # Print the current iteration index
  filename = "file_#{i}.txt" # Set the filename for the current file
  outpath_path = "/tmp/#{filename}" # Set the output path for the file

  # Create a new file and write a randomly generated UUID to it
  File.open(outpath_path, "w") do |f|
    f.write(SecureRandom.uuid)
  end

  # Open the file in read-binary mode and upload it to the S3 bucket
  File.open(outpath_path, 'rb') do |f|
    client.put_object(
      bucket: bucket_name,    # Specify the bucket name
      key: filename,          # Specify the key (filename) for the object in the bucket
      body: f                 # Specify the file object to be uploaded
    )
  end
end
