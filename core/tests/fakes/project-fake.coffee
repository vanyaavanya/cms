faker     = require 'faker'
faker.locale = "ru"
moment    = require 'moment'
moment.locale 'Ru'

module.exports = {
                  id: 12
                  name: faker.commerce.product()
                  url: '/sample-project'
                  description: faker.lorem.paragraph()
                  sprint: [
                    {
                      id:111
                      name: 'sprint 1'
                      startDate: moment()
                      endDate: moment().add(7, 'd')
                      tasks: [111111, 111222, 111333]
                    },
                    {
                      id: 222
                      name: 'sprint 2'
                      startDate: moment().add(14, 'd')
                      endDate: moment().add(21, 'd')
                      tasks: [222111, 222222, 222333]
                    }
                  ]
                  backlog:
                    taskId: [444444, 555555, 666666]
                  spec: [
                    {
                      name: 'spec item name'
                      description: 'descriotion'
                      attachments: ''
                    }
                  ]
                  access:
                    groups: [
                      {
                        name: 'Admins'
                        url: '/admin/groups/0'
                      },
                      {
                        name: 'Managers'
                        url: '/admin/groups/1'
                      }
                    ]
                    users:[
                      {
                        name: faker.name.findName()
                        url: '/admin/users/987654'
                      },
                      {
                        name: faker.name.findName()
                        url: '/admin/users/123456'
                      }
                    ]
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
                  data:[
                    {
                      name: 'some data'
                      description: ''
                    }
                  ]
                  date:
                    published:  moment()
                    deadline:  moment()
                  }