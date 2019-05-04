select `pl`.`participant_id`, `pl`.`id` as `number`, `lk`.`event_id`, `op`.`id` as `prize_id`, `op`.`title` 
from `plays` as `pl` 
inner join `luckies` as `lk` on `lk`.`id` = `pl`.`lucky_id` 
inner join `offer_prizings` as `op` on `op`.`event_id` = `lk`.`event_id` and `op`.`id` = 3 
where `pl`.`is_picked` = 0 
group by `pl`.`participant_id`, `pl`.`id`, `lk`.`event_id`, `op`.`id`, `op`.`title` 
order by RAND() 
limit 3 offset 0