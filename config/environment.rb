# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Prestame::Application.initialize!

Time::DATE_FORMATS[:borrow] = "%A, %B %d, %Y"