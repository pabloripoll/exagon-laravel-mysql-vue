<?php

namespace App\Support;

class Date
{
    static $_instance;

    public static function Print()
    {
        return self::$_instance ?? new self;
    }

    /**
     * Object
     */
    public function Object(?string $timestamp): object
    {
        $timestamp = date_create($timestamp);
        $datetime = new \stdClass;
        $datetime->Y = date_format($timestamp, 'Y');
        $datetime->m = date_format($timestamp, 'm');
        $datetime->d = date_format($timestamp, 'd');
        $datetime->H = date_format($timestamp, 'H');
        $datetime->i = date_format($timestamp, 'i');
        $datetime->s = date_format($timestamp, 's');

        return $datetime;
    }

    /*
        Month
    */
    public function months($lang = null)
    {
        $lang   = ($lang == null ? 'Eng' : ucfirst($lang));
        $method = 'month'.$lang;
        $months = $this->$method();

        return $months;
    }

    public function monthIntToText($int, $lang = null)
    {
        $lang   = ($lang == null ? 'Eng' : ucfirst($lang));
        $method = 'month'.$lang;
        $month  = $this->$method();

        return $month[($int-1)];
    }

    public function monthText($int, $lang = null)
    {
        echo $this->monthIntToText($int, $lang);
    }

    private function monthEng()
    {
        return [
            'January','February','March','April','May','June','July','August','September','October','November','December'
        ];
    }

    private function monthEsp()
    {
        return [
            'Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'
        ];
    }

    /*
        Day
    */
    public function days($lang = null)
    {
        $lang   = ($lang == null ? 'Eng' : ucfirst($lang));
        $method = 'day'.$lang;
        $days   = $this->$method();

        return $days;
    }

    public function dayIntToText($int, $lang = null)
    {
        $lang   = ($lang == null ? 'Eng' : ucfirst($lang));
        $method = 'day'.$lang;
        $day    = $this->$method();

        return ucfirst($day[($int-1)]);
    }

    public function dayText($int, $lang = null)
    {
        echo $this->dayIntToText($int, $lang);
    }

    private function dayEng()
    {
        return [
            'monday','tuesday','wednesday','thursday','friday','saturday','sunday'
        ];
    }

    private function dayEsp()
    {
        return [
            'lunes','martes','miércoles','jueves','viernes','sábado','domingo'
        ];
    }

}