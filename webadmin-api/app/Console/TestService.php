<?php

namespace App\Console;

use DB;
use Illuminate\Console\Command;

class TestService extends Command
{
    /**
     * The name and signature of the console command.
     * @var string
     */
    protected $signature = 'TestService';

    /**
     * The console command description.
     * @var string
     */
    protected $description = 'Testing services';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public static function handle()
    {
        try {
            //echo 'testing';
            //DB::connection()->getPDO();
            //dump('Database is connected. Database Name is : ' . DB::connection()->getDatabaseName());
        } catch (Exception $e) {
            var_dump($e->getMessage());
        }
   }

}
