<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Lucky Draw Application</title>

    <link href="https://fonts.googleapis.com/css?family=Changa+One|Squada+One" rel="stylesheet">
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
        <h2 class="event_title">29-04-2019 12:00 PM</h2>
      </div>
      <div class="col text-center">
        <img src="{{ asset('img/Bloby.png') }}" class="img_responsive" />
      </div>
    </div>

    <div class="row">
        <div class="col text-right align-top">
          <img src="{{ asset('img/lucky_draw.gif') }}" class="img_responsive">
        </div>
        <div class="col text-center award_bg">
          <h3 class="prize disable-select">Prize</h3>
          <h1 class="number disable-select">1</h1>
          <h3 class="award disable-select">Motor</h3>
          <button class="btn_start disabled" id="start_spin"></button>
        </div>
        <div class="col text-left align-top">
          <img src="img/suzuki-smash.png" class="img_responsive" />
        </div>
    </div>
    <div class="row">
        <div class="col-6 text-right align-top no_padding_l">
          <div class="pr-5">
            <div class="after_section"></div>
          </div>
        </div>
        <div class="col-6 text-left align-top no_padding_r">
          <div class="pl-5 table-responsive">
            <table class="table_custom" cellspacing="1" border="1" >
              <thead>
                <tr>
                  <th class="no">N<sup>o</sup></th>
                  <th class="name">Name</th>
                  <th class="id">ID</th>
                  <th class="prize">Prize</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td class="name">Sok San</td>
                  <td>0099988</td>
                  <td>Motor</td>
                </tr>

              </tbody>
            </table>
          </div>
        </div>
    </div>
  
    <div class="row row_footer">
      <p class="copyright"> 
      © 2019 Copyright: <a href="http://www.anachak-it.com" target="_blank"> Anachak-IT </a>
      </p>
    </div>

<script>
        var container = document.querySelector('.after_section');
        window.odometers = [];
        window.times = [];
        window.id_times = [];

        window.luckies = [];

        $(document).ready(function() {
            
            
        });

        $('body').on('click', '#start_spin', function(){

            setTimeout(winners = function(){

                var ids = [];
                var numbers = [];
                // console.log(luckies); return false;
                for(var i=0; i < luckies.length; i++){
                    odometers[i].update(luckies[i].number);
                    numbers.push(luckies[i].id);
                    ids.push(luckies[i].participant_id);
                }

                return {'id': ids, 'number': numbers};
            }, 2000);
               
            // assign value all winner to variable
            var winners = winners();
            // console.log(winners.id);
            // update spin time after generate

                var url = "{{ route('update_spintime') }}";
                var event_id = $('#select_event').val();
                var prize_id = $('#select_gift').val();
                
                $.ajax({
                    type: 'GET',
                    url: url,
                    dataType: 'json',
                    data: { 'time_id': id_times[0],
                            'winner_id': winners.id,
                            'winner_num': winners.number,
                            'prize_id': prize_id,
                            'event_id': event_id },
                    success: function (response){
                        if(response.msg == 'Successful'){
                            
                            if(response.spin_time == 0){
                                $('#select_gift').prop('disabled', false).select2();
                                $('#select_gift option:selected').prop('disabled', true);
                                $('#start_spin').prop('disabled', true).text('Start Spin');
                                
                            }else{
                                times.shift();
                                id_times.shift();                                
                                $('#select_gift option:selected').attr({'data-time': times.toString(), 'data-time_id': id_times.toString()});

                                $('#start_spin').text('Spin Next');
                                $('#select_gift').prop('disabled', true);
                            }
                            $('#select_gift').select2();
                        }
                    },
                    complete: function(){
                        $('#start_spin').removeAttr('disabled');
                    }
                });
         
        });       

  setTimeout(function(){
    $('.odometer').html(423234234);
  }, 1000);

  function loading_data(){

  }

          function createOdometer(){
            var el = document.createElement('div');
            // var card_el = document.createElement('div');
            var cont = document.createElement('div');
            var col = document.createElement('div');

            // card_el.className = 'card';
            // el.className = 'card-body';
            cont.className = 'odometer-container';
            col.className = 'col item-odometer';

            card_el.appendChild(el)
            cont.appendChild(card_el);
            col.appendChild(cont);
            container.appendChild(col);

            var od = new Odometer({
                auto: false,
                el: el,
                format: 'd', 
                duration: 3000,
                // zeroFlag: true,
                numberLength: 8,
                value: 111111111,
                animation: 'count'   
            });

            return od;
        }

        function buildOdometers(num, incw, prize_id)
        {
            if(num > 0){

                var get_url = "{{ route('pickup_winner') }}?inc_win="+ incw +"&count="+ num +"&prize_id="+ prize_id;
                destroyOdometer();

                for(var i=0; i < num; i++){
                    odometers.push(createOdometer());
                }

                $.ajax({
                    type: 'GET',
                    dataType: 'json',
                    url: get_url,
                    async: false,
                    success: function (response){
                        
                        if(response.status == 'success'){
                            luckies = response.data;
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
</script>

  </body>
</html>
