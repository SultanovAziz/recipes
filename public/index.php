<?php

require_once dirname(__DIR__).'/config/init.php';
require_once LIB.'/function.php';

$app = new \recipes\App();

dump($app::$app->getProperties());