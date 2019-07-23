<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class exportWinner extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'lucky:exportWinner {eventId}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command export winner use for export all winner by event id into excel file';

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
     * @return mixed
     */
    public function handle()
    {
        $eventID = $this->argument('eventId');
dd($eventID);
        $confirmation = $this->confirm('Are you sure you want reset all data by event ID = '. $eventID .' ?');
        if ($confirmation) {
            $controller = app()->make('App\Http\Controllers\LuckyDrawController');
            app()->call([$controller, 'export'], ['event_id'=>$eventID]);
        }else{
            $this->info('You are canceling Export Winner by event ID = '. $eventID .'.');
        }        
    }
}
