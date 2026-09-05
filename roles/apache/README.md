# Apache role

Installs and enables the distribution Apache service (`apache2` on Debian,
`httpd` on Red Hat). It intentionally does not manage virtual hosts; consume it
from a deployment role that owns the site configuration.
