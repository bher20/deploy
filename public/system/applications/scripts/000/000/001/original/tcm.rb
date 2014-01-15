require 'rubygems'
require 'archive/zip'
require 'time'

def deploy(options)
    time_stamp = Time.now.strftime("%Y-%m-%d%H_%M_%S")
    temp_dir = "/tmp/#{time_stamp}_deployment-name"
    Archive::Zip.extract(options[:deploy_file], temp_dir)


    case options[:environment].upcase
        when 'PRODUCTION'
            deploy_destination = production
        when 'STAGING'
            deploy_destination = staging
        else
            raise "#{options[:environment].upcase} is not a valid environment" 
    end

    return { :deploy_destination => deploy_destination, :deploy_directory => temp_dir, :repository => repository, :name => name }
end
