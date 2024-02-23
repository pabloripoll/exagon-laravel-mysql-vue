<?php

namespace App;

class System
{
    public $env;

    public function env()
    {
        $this->env = parse_ini_file('.env');
    }

}