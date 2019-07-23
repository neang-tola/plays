<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class ResetByEvent extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'lucky:resetByEvent {eventId}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command reset every thing related to lucky draw by event ID';

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
            DB::beginTransaction();

            $sql_update_player  = "UPDATE plays p INNER JOIN luckies l ON l.id=p.lucky_id ";
            $sql_update_player .= "SET p.is_picked=0 WHERE l.event_id = $eventID";

            $sql_update_spin_time  = "UPDATE spin_times s INNER JOIN offer_prizings o ON o.id=s.prize_id ";
            $sql_update_spin_time .= "SET s.ready = 0 WHERE o.event_id= $eventID";

            $sql_delete_winner = "DELETE FROM winners WHERE event_id=$eventID";

            try {
                DB::statement($sql_update_player);
                DB::statement($sql_update_spin_time);
                DB::statement($sql_delete_winner);

                $this->info('Event ID '. $eventID .' has been reset completely');
                // all good
            } catch (\Exception $e) {
                DB::rollback();
                $this->error('Event ID '. $eventID .' has error during reset data');
                // something went wrong
            }
            DB::commit();
        }else{
            $this->info('You are canceling reset all datas.');
        }
    }
}
