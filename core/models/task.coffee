mongoose = require 'mongoose'

schema = new mongoose.Schema

  id: Number
  name: String
  description: String
  type: String
  status: String
  position: String
  priority: String
  date:
    published: Date
    updated:  Date
    deadline: Date
  storyPoints: Number
  users:
    owner:
      id: Number
    subscriber: [ Number ]
    responsible: [ Number ]
  tags: [ String ]
  label: String
  parent:
    projectId: Number
    sprintId: Number
    taskId: Number
  childIds: [ Number ]
  linkedIds: [ Number ]
  pinnedComments: [ Number ]
  attachmentIds: [ Number ]
  chat:
    name: String
    url: String
  resolution: String
  vote:
    for: Number
    against: Number
  activities: [
    {
      subject: String
      date: Date
      userId: Number
    }
  ]
  data:[
    {
      name: String
      description: String
    }
  ]

module.exports = mongoose.model "Task", schema