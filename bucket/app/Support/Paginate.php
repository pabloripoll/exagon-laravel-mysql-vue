<?php

namespace App\Support;


class Paginate
{
    /**
     * Listing
     *
     * @return array
     */
    public static function Listing(int $type = null): array
    {
        $listing = [15, 30, 60, 90];

        if ($type) {
            $listing = [15, 30, 60, 90];
        }

        return $listing;
    }

    /**
     * SQL
     *
     * @param array $config
     *
     * @return string
     */
    public static function queryLimit($config)
    {
        $page       = $config['page'];
        $listing    = $config['listing'];
        $total      = $config['total'];

        $list_to    = $page * $listing;
        $list_from  = $list_to - $listing;
        $queryLimit = ($list_from <= 0 ? '0'.','.$listing : $list_from.','.$listing);

        return $queryLimit;
    }

    /**
     * Buttons
     *
     * @param array $config
     *
     * @return object
     */
    public static function Buttons($config)
    {
        $paginate = new \stdClass;

        isset($config['href'])      ? : $config['href']     = '';
        isset($config['buttons'])   ? : $config['buttons']  = 4;
        isset($config['jump'])      ? : $config['jump']     = 12;
        isset($config['total'])     ? : $config['total']    = 0;
        isset($config['current'])   ? : $config['current']  = 1;
        isset($config['listing'])   ? : $config['listing']  = self::Listing()[0];
        !empty($config['listing'])  ? : $config['listing']  = self::Listing()[0];
        $config['listing'] > self::Listing()[0] || $config['listing'] < end(self::Listing()) ? : $config['listing'] > self::Listing()[0];
        $paginate->config = $config;

        $pagesCalc  = $config['total'] / $config['listing'];
        $pagesCalc  = number_format($pagesCalc, 2, '.', '');
        $pagesExpl  = explode('.', $pagesCalc);
        $pages      = $pagesExpl[1];
        $pagesCount = ($pages > 0 ? (int) $pagesCalc + 1 : (int) $pagesCalc);

        $paginate->pages = $pagesCount;

        $array = [];

        // First page button
        if ( ($config['current'] - $config['buttons']) - 1 > 0 ) :
            $array = array_merge($array,['first' => [
                'href' => $config['href'].(1),
                'title' => 'Retroceder a primera página',
                'value'=> 1,
                'text' => 1
            ]]);
        endif;

        // Forward page jump button
        if ( $config['current'] - $config['buttons'] - 2 > 0 ) : //$config['current'] > ($config['buttons'] * 2) - 1
            $i = ($config['current'] - $config['jump'] <= 0 ? 1 : ($config['current'] - $config['jump']));
            $array = array_merge($array,['back' => [
                'href' => $config['href'].$i,
                'title' => 'Retroceder '.$config['jump'].' páginas',
                'value'=> $i,
                'text' => '...'
            ]]);
        endif;

        // Forward pages complement
        if ( $config['current'] + $config['buttons'] >= $pagesCount ) :
            $from   = $config['current'] - ($config['buttons'] * 2);
            $top    = $config['current'] - $config['buttons'] - 1;
            for ($i = $from; $i <= $top; $i++) :
                if ( $i > 1 && $i >= $pagesCount - ($config['buttons'] * 2) ) :
                    $array = array_merge($array,['extra-'.$i => [
                        'href' => $config['href'].$i,
                        'title' => 'Retroceder a página '.$i,
                        'value'=> $i,
                        'text' => $i
                    ]]);
                endif;
            endfor;
        endif;

        // Forward pages
        for ($i = ($config['current'] - $config['buttons']); $i <= ($config['current'] - 1); $i++) :
            if ($i >= 1) :
                $array = array_merge($array,['page-'.$i => [
                    'href' => $config['href'].$i,
                    'title' => 'Retroceder a página '.$i,
                    'value'=> $i,
                    'text' => $i
                ]]);
            endif;
        endfor;

        // Current page button
        $array = array_merge($array,['page-'.$config['current'] => [
            'href' => $config['href'].$config['current'],
            'title' => 'Listado actual página '.$i,
            'text' => $config['current'],
            'value'=> $config['current'],
            'current' => true
        ]]);

        // Next pages
        for ($i = ($config['current'] + 1); $i <= ($config['current'] + $config['buttons']); $i++) :
            if ($i <= $pagesCount) :
                $array = array_merge($array,['page-'.$i => [
                    'href' => $config['href'].$i,
                    'title' => 'Avanzar a página '.$i,
                    'value'=> $i,
                    'text' => $i
                ]]);
            endif;
        endfor;

        // Next pages complement
        if ( $config['current'] <= $config['buttons'] ) :
            $from   = $config['current'] + $config['buttons'] + 1;
            $top    = $config['current'] + ($config['buttons'] * 2);
            for ($i = $from; $i <= $top; $i++) :
                if ($i <= $pagesCount && $i <= ($config['buttons'] * 2) + 1 ) :
                    $array = array_merge($array,['extra-'.$i => [
                        'href' => $config['href'].$i,
                        'title' => 'Avanzar a página '.$i,
                        'value'=> $i,
                        'text' => $i
                    ]]);
                endif;
            endfor;
        endif;

        // Next page jump button
        if ( $pagesCount > ($config['buttons'] * 2) + 2 && ($pagesCount - ($config['current'] + $config['buttons'] + 1) > 0) ) :
            $i = ($config['current'] + $config['jump'] >= $pagesCount ? $pagesCount : ($config['current'] + $config['jump']));
            $array = array_merge($array,['next' => [
                'href' => $config['href'].$i,
                'title' => 'Avanzar '.$config['jump'].' páginas',
                'value'=> $i,
                'text' => '...'
            ]]);
        endif;

        // Last page button
        if ( $pagesCount > ($config['buttons'] * 2 + 1) && (($pagesCount - $config['current']) > $config['buttons']) ) :
            $array = array_merge($array,['last' => [
                'href' => $config['href'].$pagesCount,
                'title' => 'Avanzar a última página',
                'value'=> $pagesCount,
                'text' => $pagesCount
            ]]);
        endif;

        $paginate->buttons = array_reverse($array);

        return $paginate;
    }

}