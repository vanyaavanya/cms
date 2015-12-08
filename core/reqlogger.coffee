###

    REQUEST LOGGER

###

morgan    = require 'morgan'
rotator  = require 'file-stream-rotator'

rotatingLogStream = rotator.getStream  filename:"./logs/req-%DATE%.log", frequency:"72h", verbose: false, date_format: "DD-MM-YYYY"

module.exports = morgan 'combined', stream: rotatingLogStream


