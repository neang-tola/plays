<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class removeChanceByParticipant extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'lucky:removeChanceByParticipant {eventId} {participantIds}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Remove chance by participant, first argument is event ID and second is array of participant IDs. Ex argument: 1 "12,80,90,11"';

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
        $args = $this->arguments();
        $eventId = $args['eventId'];
        $participants = !empty($args['participantIds']) ? trim($args['participantIds']) : NULL;
        if(is_numeric($eventId) && !empty($participants)){
            $part_ids = array_map('intval', explode(',', $participants));

            $confirmation = $this->confirm('Are you sure you want to remove participant id '. $participants .' from event ID = '. $eventId .' ?');
            // check format of participant id input
            if ($confirmation && count($part_ids) > 0) {
                DB::beginTransaction();
                $all_part_ids = implode(',', $part_ids);
               
                $sql_delete_player  = "DELETE p.* FROM plays p INNER JOIN luckies l ON l.id=p.lucky_id ";
                $sql_delete_player .= "WHERE l.event_id = $eventId AND p.participant_id IN (".$all_part_ids.")";
 
                try {
                    DB::statement($sql_delete_player);

                    $this->info('Remove chance of participant id '. $all_part_ids .' has been completely from event id '.$eventId);
                    // all good
                } catch (\Exception $e) {
                    DB::rollback();
                    $this->error('Remove chance of participant id '. $all_part_ids .' has been error');
                    // something went wrong
                }
                DB::commit();

            }else{
                $this->info('You had been cancel remove chance of participant '. $participants .'.');
            }
        }else{
            $this->error('Invlid format input');

        }

    }
}
