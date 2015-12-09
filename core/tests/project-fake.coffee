faker     = require 'faker'
moment    = require 'moment'

module.exports = {
                  id: 12
                  name: 'Sample project'
                  url: '/sample-project'
                  description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum'
                  sprint: [
                    {
                      id:111
                      tasks: [111111, 111222, 111333]
                    },
                    {
                      id:222
                      tasks: [222111, 222222, 222333]
                    },
                    {
                      id:333
                      tasks: [333111, 333222, 333333]
                    },
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
                  documents: [
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