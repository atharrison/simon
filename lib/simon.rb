require 'require_all'
require 'yaml'
require 'thor'

require_all File.expand_path("../simon", __FILE__)


module Simon

  DEFAULT_SIGNAL_STRENGTH = 0.01
  DEFAULT_EXCITE_DELTA = 0.01
  DEFAULT_SUPPRESS_DELTA = 0.01
  DEFAULT_TRIGGER_THRESHOLD = 0.5

end