faker     = require 'faker'
faker.locale = "ru"
moment    = require 'moment'
moment.locale 'Ru'

module.exports =  {
                  id: 111111
                  name: faker.commerce.product()
                  description: faker.lorem.paragraph()
                  type: 'Story'
                  status: 'to do'
                  position: '?' #что это?
                  priority: '0'
                  date:
                    published:  moment()
                    updated:  moment()
                    deadline:  moment()
                  storyPoints: '42'
                  users:
                    owner:
                      id: 123456
                    subscriber:[ 123456, 234567 ]
                    responsible: [ 123456, 234567 ]
                  tags: [ 'task', 'brainslab', 'tags are very important']
                  label: 'label'
                  parent:
                    projectId: 12
                    sprintId: 111
                    taskId: 111222
                  childIds: [ 222333, 333444 ]
                  linkedIds: [ 555444, 666777 ]
                  pinnedComments: []
                  attachments: [
                    {
                      name: 'Spec'
                      url: '/upload/12/spec.doc'
                    },
                    {
                      name: 'Договор №12'
                      url: '/upload/12/dogovor.doc'
                    },
                  ]
                  chat:
                    name: 'Sample Project Chat Channel'
                    url: 'chat/#123'
                  resolution: 'unresolved'
                  vote:
                    for: 4
                    against: 1
                  activities: [
                    {
                      subject: 'subscribed'
                      date: moment()
                      userId: 987654
                    },
                    {
                      subject: 'move to done'
                      date: moment()
                      userId: 987654
                    }
                  ]
                  data:[
                    {
                      name: 'some data'
                      description: ''
                    }
                  ]
                  }