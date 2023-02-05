<?php

define('PATH', realpath('.'));
define('SUBFOLDER', false);
define('URL', 'https://pawansmm.in');
define('STYLESHEETS_URL', '//pawansmm.in');

error_reporting(1);
date_default_timezone_set('Asia/Kolkata');

return [
  'db' => [
    'name'    =>  'pawansmm_pawan',
    'host'    =>  'localhost',
    'user'    =>  'pawansmm_pawan',
    'pass'    =>  'Drmrkrgm1234@',
    'charset' =>  'utf8mb4' 
  ]
];