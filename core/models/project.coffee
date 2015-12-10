mongoose = require 'mongoose'

schema = new mongoose.Schema
  id: Number
  name: String
  url: String
  description: String
  sprint: [
    {
      id: Number
      name: String
      startDate: Date
      endDate: Date
      tasks: [ Number ]
    }
  ]
  backlog:
    taskId: [ Number ]
  spec: [
    {
      name: String
      description: String
      attachments: String
    }
  ]
  access:
    groups: [
      {
        name: String
        url: String
      }
    ]
    users:[
      {
        name: String
        id: Number
      }
    ]
  attachmentIds: [ Number ]
  chat:
    name: String
    url: String
  data:[
    {
      name: String
      description: String
    }
  ]
  date:
    published: Date
    deadline: Date

module.exports = mongoose.model "Project", schema