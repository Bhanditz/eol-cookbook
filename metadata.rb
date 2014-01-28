name             'eol-cookbook'
maintainer       'Woods Hole Marine Biological Laboratory'
maintainer_email 'anthony@anthonygoddard.com'
license          'Apache 2.0'
description      'Installs/Configures eol-cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w(apt database memcached mysql redisio virtuoso).each do |cb|
  depends cb
end
