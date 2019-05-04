<?php

namespace App\Widgets;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;
use App\Models\Winner;

class Winners extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = Winner::count();
        $string = 'Winners';

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-trophy',
            'title'  => "{$count} {$string}",
            'text'   => 'Winner is the participant who have a chance to get gift from us',
            'button' => [
                'text' => 'Winners',
                'link' => route('voyager.winners.index'),
            ],
            'image' => asset('dimmer/winner.jpg'),
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return Auth::user()->can('browse', app(Winner::class));
    }
}
