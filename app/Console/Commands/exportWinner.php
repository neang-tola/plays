<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Winner;

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

        $confirmation = $this->confirm('Are you sure you want reset all data by event ID = '. $eventID .' ?');
        if ($confirmation) {
            $event_id = (int)$eventID;
            $data = Winner::getAllWinner($event_id)->toArray();
            $file_name = 'winner_export_'. date('d_m_Y');
            return \Excel::create($file_name, function($excel) use ($data){
                $excel->sheet('mySheet', function($sheet) use ($data){
                    $sheet->fromArray($data);
                });
            })->download('csv');
        }else{
            $this->info('You are canceling Export Winner by event ID = '. $eventID .'.');
        }        
    }
}
