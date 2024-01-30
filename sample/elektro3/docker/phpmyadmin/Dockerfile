FROM phpmyadmin/phpmyadmin

RUN echo '<?php\n\n\
if (isset($_ENV['PMA_MAXNAVIGATIONITEMS'])) {\n\
    $cfg['MaxNavigationItems'] = intval($_ENV['PMA_MAXNAVIGATIONITEMS']);\n\
}' > /etc/phpmyadmin/config.user.inc.php
