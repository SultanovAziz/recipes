<?php

require_once dirname(__DIR__).'/config/init.php';
require_once LIB.'/function.php';
require_once CONF.'/router.php';

$app = new \recipes\App();

//dump($app::$app->getProperties());
//throw new Exception("AFQFA",404);