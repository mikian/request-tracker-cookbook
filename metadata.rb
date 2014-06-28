name             'request_tracker'
maintainer       'Bráulio Bhavamitra'
maintainer_email 'braulio@eita.org.br'
license          'GPLv3+'
description      'Installs/Configures Request Tracker 4'
long_description File.read("#{File.dirname __FILE__}/README.md")
version          '1.2.0'

depends         'apt'

depends         'nginx'
depends         'apache2'

depends         'fetchmail'

