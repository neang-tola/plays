<?php
  
namespace App\Exports;
  
use App\Models\Winner;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Illuminate\Http\Request;
  
class ExportGenerator implements FromCollection
{
    use Exportable;
    protected $id;
    public function __construct()
    {
      $this->id = request()->get('event_id');
    }

    public function collection()
    {
      if(!empty($this->id)){
        $event_id = (int)$this->id;
        $data = Winner::getAllWinner($this->id);

        return $data;
      }
    }
}