<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Lucky Draw Application</title>
    <link rel="icon" href="{{ asset('img/favicon.png') }}">
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/odometer-theme-car.css') }}" />
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <script src="{{ asset('js/jquery.min.js') }}"></script>
    <script src="{{ asset('js/odometer.min.js') }}"></script>

  </head>

  <body>
    <div class="row row_header">
      <div class="col text-center">
        <img src="{{ asset('img/Logo Nippon.png') }}" class="img_responsive limit_heigh_logo" />
      </div>
      <div class="col-6 text-center">
        <img src="{{ asset('img/Letter.png') }}" class="img_responsive" />
        <h2 class="event_title">09-09-2019 <span id="MyClockDisplay" class="clock" onload="showTime()"></span></h2>
      </div>
      <div class="col text-center">
        <img src="{{ asset('img/Bloby.png') }}" class="img_responsive" />
      </div>
    </div>

    <div class="row" style="min-height: 600px; overflow-y: hidden;">
        <div class="col-5 text-right align-top">
            <div class="after_section"></div>
        </div>
        <div class="col-2 text-center award_bg">
          <h3 class="prize disable-select">រង្វាន់</h3>
          <h1 class="number disable-select"></h1>
          <h3 class="award disable-select"></h3>
          <button class="btn_start disabled" id="start_spin" disabled="disabled"></button>
          <button class="btn_next" id="next_prize" style="display:none"></button>
          <div class="image"></div>
        </div>
        <div class="col-5 text-left align-top">
          <div class="table-responsive">
            <table class="table_custom" cellspacing="1" border="5" id="winner_list" >
              <thead>
                <tr>
                  <th class="no">N<sup>o</sup></th>
                  <th class="name">Name</th>
                  <th class="id">ID</th>
                </tr>
              </thead>
              <tbody></tbody>
            </table>
          </div>
        </div>
    </div>
  
    <div class="row row_footer">
        <p class="copyright"> 
        © 2019 Copyright: <a href="http://www.anachak-it.com" target="_blank"> Anachak-IT </a>
        </p>
        <audio id="createSoundCtrl">
          <source src="{{ asset('sound/game.mp3') }}" type="audio/mpeg">
        </audio>      
    </div>

<script>
        var container = document.querySelector('.after_section');
        window.odometers = [];

        window.luckies = [];
        window.last_tr = {{ ($entry) ? $entry->winner_count : 0 }};

        $(document).ready(function() {
            showTime();
            @if($entry)
                var num_items = {{ ($entry) ? $entry->num_item : 0 }};
                var win_inc   = {{ ($entry) ? $entry->include_winner : 0 }};
                var prize_id  = {{ ($entry) ? $entry->id : 0 }};
                var time_id   = {{ ($entry) ? $entry->time_id : 0 }};
                var event_id  = {{ ($entry) ? $entry->event_id : 0}};
                var img_src   = "{{ ($entry) ? $image : '' }}";
                var award_title = "{{ ($entry) ? $entry->title : '' }}";
                var all_prize = "{{ ($entry) ? $entry->numbers : '' }}";

                for(var i=0; i<num_items; i++){
                    odometers.push(createOdometer());
                }

                // buildOdometers(num_items, win_inc, prize_id, time_id, event_id);
                $('.award_bg h1.number').text(all_prize);
                $('.award_bg h3.award').text(award_title);
                if(img_src != ''){
                    var image = '<img src="'+ removeDomain(img_src) +'" class="img_responsive"/>';
                    $('.award_bg .image').html(image);
                }
                $('#start_spin').removeClass('disabled').prop('disabled', false);

            @else
                $('#start_spin').addClass('disabled').prop('disabled', true).fadeOut();
                $('#next_prize').fadeIn();
            @endif
        });

        $('body').on('click', '#start_spin', function(){
            $('#createSoundCtrl')[0].play();
            $(this).addClass('disabled').prop('disabled', true);
            loading_data();

            setTimeout(function(){
                $('#winner_list').fadeIn();
            }, 15000);   
            
            // assign value all winner to variable
            // var winners = winners();
            // console.log(winners.id);
        });       

        $('body').on('click', '#next_prize', function(){
            loading_next_prize();
        });

        function loading_data(){
            var get_url = "{{ route('screen_show') }}";

            $.ajax({
                    type: 'GET',
                    dataType: 'json',
                    url: get_url,
                    success: function (response){
                        
                        if(response.status == 'Successful'){
                            var entry = response.entry;
                            var num_items = entry.num_item;
                            var win_inc   = entry.include_winner;
                            var prize_id  = entry.id;
                            var time_id   = entry.time_id;
                            var event_id  = entry.event_id;
                            var award_title = entry.title;
                            var all_prize = entry.numbers;

                            for(var i=0; i<num_items; i++){
                                odometers.push(createOdometer());
                            }

                            $('.award_bg h1.number').text(all_prize);
                            $('.award_bg h3.award').text(award_title);
                            buildOdometers(num_items, win_inc, prize_id, time_id, event_id);
               
                        }
                        
                    }
            });
        }

        function loading_next_prize(){
            var get_url = "{{ route('screen_show') }}";

            $.ajax({
                    type: 'GET',
                    dataType: 'json',
                    url: get_url,
                    success: function (response){
                        
                        if(response.status == 'Successful'){
                            $('#next_prize').fadeOut();
                            $('#start_spin').removeClass('disabled').prop('disabled', false).fadeIn();

                            var entry = response.entry;
                            var num_items = entry.num_item;
                            var award_title = entry.title;
                            var all_prize = entry.numbers;
                            var img_src   = response.image;
                            if(img_src != ''){
                                var image = '<img src="'+ removeDomain(img_src) +'" class="img_responsive"/>';
                                $('.award_bg .image').html(image);
                            }

                            destroyOdometer();
                            $('.award_bg h1.number').text(all_prize);
                            $('.award_bg h3.award').text(award_title);                                
                            $('#winner_list tbody').empty();
                            $('#winner_list').fadeOut();    
                        }
                        
                    }
            });
        }

        function listDownWinner(ind_no=1, name, number, prize){
            var str_tr  = '<tr>';
                str_tr += '<td>'+ ind_no +'</td>';
                str_tr += '<td class="name">'+ name +'</td>';
                str_tr += '<td>'+ number +'</td>';
                // str_tr += '<td>'+ prize +'</td>';

            return str_tr;
        }

        function createOdometer(){
            var el = document.createElement('div');
            var col = document.createElement('div');

            el.className = 'odometer-container';
            col.className = 'col item-odometer no_padding';

            col.appendChild(el);
            container.appendChild(col);

            var od = new Odometer({
                auto: false,
                el: el,
                format: 'd', 
                duration: 14000,
                numberLength: 8,
                value: 111111111,
                animation: 'count'   
            });

            return od;
        }

        function buildOdometers(num, incw, prize_id, time_id, event_id)
        {
            if(num > 0){
                var params = "?inc_win="+ incw +"&count="+ num +"&prize_id="+ prize_id +"&time_id="+ time_id +"&event_id="+ event_id;
                var get_url = "{{ route('pickup_winner') }}"+ params;

                $('#winner_list').fadeOut();
                $('#winner_list tbody').empty();

                destroyOdometer();

                for(var i=0; i < num; i++){
                    odometers.push(createOdometer());
                }

                $.ajax({
                    type: 'GET',
                    dataType: 'json',
                    url: get_url,
                    async: false,
                    beforeSend: function (){
                        $('#start_spin').addClass('disabled').prop('disabled', true);
                    },
                    success: function (response){
            
                        if(response.status == 'Successful'){
                            luckies = response.data;
                            var winner_tr = '';

                            if(luckies.length > 0){
                                var ind_num   = parseInt(luckies[0].winner_count);
                                console.log(luckies[0].prize_count);

                                for(var j=0; j < luckies.length; j++){
                                    odometers[j].update(luckies[j].number);
         
                                    winner_tr += listDownWinner(++ind_num, luckies[j].name, luckies[j].number, luckies[j].title);
                                }

                                $('#winner_list').fadeIn();
                                if(response.count == 0 && luckies[0].prize_count > 1){
                                    // case show next prize
                                    setTimeout(function(){
                                        $('#start_spin').addClass('disabled').prop('disabled', true).fadeOut();
                                        $('#next_prize').fadeIn();
                                        $('#winner_list tbody').html(winner_tr);
                                    }, 14000);

                                }else if(response.count == 0 && luckies[0].prize_count == 1){
                                    // case end of prize
                                    setTimeout(function(){
                                        $('#winner_list tbody').html(winner_tr);
                                        $('#start_spin').fadeOut();
                                        $('#next_prize').fadeOut();
                                    }, 14000);

                                }else{
                                    // case spin continue
                                    setTimeout(function(){
                                        $('#start_spin').removeClass('disabled').prop('disabled', false).fadeIn();                                 
                                        $('#winner_list tbody').html(winner_tr);
                                    }, 14000);  

                                }
                                
                    
                            }                            
                        }
                        
                    }
                });
    
            }
        }

        function destroyOdometer()
        {
            if(odometers.length > 0){
                $('.item-odometer').remove();
                odometers = [];
            }
        }

        function removeDomain(full_url)
        {
            var str_name = full_url.replace('http://lucky.test', '');
            return str_name;
        }

        function showTime(){
            var date = new Date();
            var h = date.getHours(); // 0 - 23
            var m = date.getMinutes(); // 0 - 59
            var s = date.getSeconds(); // 0 - 59
            var session = "AM";
            
            if(h == 0){
                h = 12;
            }
            
            if(h > 12){
                h = h - 12;
                session = "PM";
            }
            
            h = (h < 10) ? "0" + h : h;
            m = (m < 10) ? "0" + m : m;
            s = (s < 10) ? "0" + s : s;
            
            var time = h + ":" + m + ":" + s + " " + session;
            document.getElementById("MyClockDisplay").innerText = time;
            document.getElementById("MyClockDisplay").textContent = time;
            
            setTimeout(showTime, 1000);
            
        }       
</script>

  </body>
</html>
