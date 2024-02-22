<?php

namespace App\Support;

class Validation
{
    static $_instance;

    public static function Check()
    {
        return self::$_instance ?? new self;
    }

    public function Alphanum(string $string): bool
    {
        return ctype_alnum($string) ? true : false;
    }

    public function Email(string $email): bool
    {
        return filter_var($email, FILTER_VALIDATE_EMAIL) ? true : false;
    }

    public function Password(string $password): bool
    {
        return preg_match("/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/", $password) ? true : false;
    }

    /**
     *
     */
    public function Request(array $data): object
    {
        $output = new \stdClass;

        foreach ($data as $key => $params) {
            $method = ucfirst($params[0]);
            $output->$key = $this->$method($params[1]) ? $params[1] : null;
        }

        foreach ($output as $key => $value) {
            if (! $value) {
                $output = new \stdClass;
                $output->error = $key;
            }
        }

        return $output;
    }

}
