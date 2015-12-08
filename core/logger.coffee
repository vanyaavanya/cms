###

    LOGGER

###

winston = require 'winston'

getLogger = (module) ->
    path = module.filename.split('/').slice(-2).join('/')

    return new winston.Logger
        transports: [
            new winston.transports.File
                filename:   './logs/error.log',
                level:      'error',
                label:      path
        ]
            
module.exports = getLogger



# winston          = require 'winston'
# winston.emitErrs = on

# winston.loggers.add 'console',
#   console: 
#     level: 'info'
#     colorize: true
# consoleLog = winston.loggers.get 'console'

  
# winston.loggers.add 'error', 
#     file: 
#       level: 'error'
#       filename: './logs/error.log'
#       json: true
#       maxsize: 5242880

# errorLog = winston.loggers.get 'error'


# module.exports = consoleLog
# module.exports.error = errorLog.error