require 'rubygems'
require 'archive/zip'

def deploy(options)
    Archive::Zip.extract(options[:deploy_file], options[:temp_dir])
end
