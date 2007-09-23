# == Synopsis
# 
# xrc-tool : Generates ruby code from wxWidgets XML
#
# == Usage
# 
# xrc-tool [OPTIONS] <FILE>
#
# == Arguments
#
# <FILE> should be a valid XRC file from where class definitions are
# extracted.
# 
# == Options
#
# -a, --appname [NAME]
#    Create a basic Wx::App wrapper to run a frame. Not valid if more
#    than one frame is identified in this file 
#
# -h, --help:
#    Show this help
#
# -n, --namespace:
#    Namespace module to wrap code in. If this is given, it  will be
#    used both to prefix generated subclasses, and extend subclassed 
#    controls contained in the windows.
# 
# -o, --output:
#    Location for generated code. If this is a file, write all the
#    generated classes to this one file. If this is a directory, writes
#    each class as a separate file in it.
#

require 'wx_sugar/xrc'
require 'getoptlong'
require 'rdoc/ri/ri_paths' # avoid a bug in Ruby 1.8.5 with rdoc/usage
require 'rdoc/usage'


opts = GetoptLong.new( [ '--appname', '-a', GetoptLong::OPTIONAL_ARGUMENT ],
                       [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
                       [ '--namespace', '-n', GetoptLong::REQUIRED_ARGUMENT ],
                       [ '--output', '-o', GetoptLong::REQUIRED_ARGUMENT ] )

options  = {}
output    = nil

opts.each do | opt, arg |
  case opt
  when '--help'
    RDoc::usage
  when '--appname'
    options[:app_name] = ( arg.empty? ? 'MyApp' : arg )
  when '--namespace'
    options[:namespace] = arg
  when '--output'
    output = arg
  end
end

if ARGV.empty?
  puts "Missing FILE argument (try --help)"
  exit 1
end

xrc_file = ARGV.shift


resource = XRCResource.new(xrc_file)
if output
  # Write to separate files in output directory
  if File.directory?(output)
    resource.classes.each do | kls |
      outfile = File.join(output, "#{kls.sub_class.downcase}.rb")
      File.open(outfile, 'w') do | f |
        Outputter.new(kls, options).output(f)
      end
    end
  # Write all to one file
  else
    File.open(output, 'w') do | f | 
      resource.classes.each do | kls | 
        Outputter.new(kls, options).output(f)
      end
    end
  end
else
  resource.classes.each do | kls | 
    Outputter.new(kls, options).output
  end
end
