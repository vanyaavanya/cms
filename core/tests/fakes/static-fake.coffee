faker     = require 'faker'
moment    = require 'moment'

module.exports = {
                  status: 'ready'
                  title: 'Sample Page'
                  url: '/sample-page'
                  meta:
                    description: 'Sample page in statics'
                    keys: ['admin','template','brainslab', 'cms', 'sample']
                  content: 'This template has a responsive menu toggling system. The menu will appear collapsed on smaller screens, and will appear non-collapsed on larger screens. When toggled using the button below, the menu will appear/disappear. On small screens, the page content will be pushed off canvas.'
                  date:
                    published:  moment()
                    updated:  moment()
                  owner: 
                    name: faker.name.findName()
                    img: faker.image.avatar()
                    url: '/admin/users/987654'
                  hide:
                    navigation: true
                    sitemap: false
                  tags: ['sample', 'template', 'tags']
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
                  }