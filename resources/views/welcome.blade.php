<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Lucky Draw Live</title>
    <!-- Font Awesome 
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">-->
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet">
    <!-- Your custom styles (optional) -->
    <link href="css/select2/select2.css" rel="stylesheet">
    <link href="css/odometer.css" rel="stylesheet">
    <style>
        .odometer{ 
            font-size: 55px; 
            letter-spacing: 15px;
            font-weight: bold;
        }
    </style>
</head>

<body>

    <!--Main Navigation-->
    <header>

        <!-- Navbar -->
        <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
            <div class="container">

                <!-- Brand -->
                <a class="navbar-brand waves-effect" href="#" target="_blank">
                    <strong class="blue-text">LDL</strong>
                </a>

                <!-- Collapse -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <!-- Links -->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">

                    <!-- Left -->
                    <ul class="navbar-nav mr-auto text-center">
                        <li class="nav-item" style="font-size: 25px;">
                            Lucky Draw Live
                        </li>
                    </ul>

                </div>

            </div>
        </nav>
        <!-- Navbar -->

    </header>
    <!--Main Navigation-->

    <!--Main layout-->
    <main class="mt-5 pt-5">
        <div class="container">

            <!--Section: Jumbotron-->
            <section class="card wow fadeIn" style="background-image: url(img/gradient1.jpg);">

                <!-- Content -->
                <div class="card-body text-white py-3 px-5 my-3">
                    <div class="row">
                        <div class="col-sm">
                            <select class="form-control select2" id="select_event" name="select_event" style="width:100%">
                                <option value="">Choose a Event</option>

                                @if(count($events))

                                    @foreach($events as $opt)
                                    <option value="{{ $opt['id'] }}">{{ $opt['title'] }}</option>
                                    @endforeach
                                    
                                @endif
                            </select>
                        </div>                        
                        <div class="col-sm">
                            <select class="form-control select2" id="select_gift" name="select_gift" style="width:100%">
                                <option value="">Choose a Gift</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm">
                            <button id="start_spin" class="btn btn-outline-white btn-lg">Start Spin</button>
                        </div>
                        <div class="col-sm">
                            <h2 class="show_round"></h2>
                        </div>
                    </div>
                </div>
                <!-- Content -->
            </section>
            <!--Section: Jumbotron-->

            <!--Section: Cards-->
            <section class="text-center my-5" style="min-height: 450px;">
                <div class="row mb-4 after_section">
                </div>
            </section>
            <!--Section: Cards-->

        </div>
    </main>
    <!--Main layout-->

    <!--Footer-->
    <footer class="page-footer text-center font-small mdb-color darken-2 mt-4 wow fadeIn">

        <!--Copyright-->
        <div class="footer-copyright py-3">
            © 2019 Copyright:
            <a href="http://www.anachak-it.com" target="_blank"> Anachak-IT </a>
        </div>
        <!--/.Copyright-->

    </footer>
    <!--/.Footer-->

    <!-- SCRIPTS -->
    <!-- JQuery -->
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <!-- Bootstrap tooltips -->
    <script type="text/javascript" src="js/popper.min.js"></script>
    <!-- Bootstrap core JavaScript -->
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <!-- MDB core JavaScript -->
    <script type="text/javascript" src="js/mdb.min.js"></script>
    <!-- Initializations -->
    <script type="text/javascript" src="js/select2/select2.js"></script>
    <script type="text/javascript" src="js/odometer.min.js"></script>
    <script type="text/javascript">

        new WOW().init();
        var container = document.querySelector('.after_section');
        window.odometers = [];
        window.times = [];
        window.id_times = [];

        window.luckies = [];

        $(document).ready(function() {
            $('.select2').select2();
            
            
        });

        $('body').on('click', '#start_spin', function(){
            $(this).attr('disabled', 'disabled');  
            
            if(odometers.length > 0){
                destroyOdometer();
                $('#select_gift').trigger('change');
            }

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

        $('body').on('change', '#select_event', function(){
            var gift_offer = $('#select_gift');
            var event_id = $(this).val();
            var get_url  = "{{ route('get_prize', '') }}/"+ event_id;

            gift_offer.find('option').not(':first').remove();
            $('#start_spin').prop('disabled', false).text('Start Spin');

            if(event_id != '' && $.isNumeric(event_id)){

                $.getJSON(get_url, function (response){
                    
                    if(response){
                        var sel_option = '';
                        $.each(response, function (key, opt){
                            
                            if(opt['time_list'] != null){
                                sel_option += '<option value="'+ opt['id'] +'" ';
                                sel_option += ' data-time="'+ opt['time_list'] +'" ';
                                sel_option += ' data-time_id="'+ opt['time_ids'] +'" ';
                                sel_option += ' data-num="'+ opt['numbers'] +'" ';
                                sel_option += ' data-inc="'+ opt['include_winner'] +'">';
                                sel_option += opt['title'] +'</option>';
                            }

                        });

                        gift_offer.find('option:first').after(sel_option);
                    }
                });
            }else{
                destroyOdometer();
                return false;
            }
        });

        $('body').on('change', '#select_gift', function(){
            var offer_id = $(this).val();
            var offer_num = $(this).find('option:selected').attr('data-num');
            var offer_times = $(this).find('option:selected').attr('data-time');
            var offer_time_ids = $(this).find('option:selected').attr('data-time_id');
            var inc_win   = $(this).find('option:selected').attr('data-inc');
            
            if(typeof offer_id == 'undefined' || offer_id == ''){
                destroyOdometer();
                return false;
            }

            if(offer_times.indexOf(',') < 0){
                times.push(offer_times);
                id_times.push(offer_time_ids);
            }else{
                times = offer_times.split(',');
                id_times = offer_time_ids.split(',');
            }

            $('#start_spin').prop('disabled', false);
            buildOdometers(times[0], inc_win, offer_id);
        });   

        function createOdometer(){
            var el = document.createElement('div');
            var card_el = document.createElement('div');
            var cont = document.createElement('div');
            var col = document.createElement('div');

            card_el.className = 'card';
            el.className = 'card-body';
            cont.className = 'odometer-container';
            col.className = 'col-lg-4 col-md-12 mb-4 item-odometer';

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
                value: 11111111,
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

        function padRight(pad, str) {
            var result = 0;
            if (typeof str === 'undefined') 
                return result;

            result = (str + pad).substring(0, pad.length);
            return parseInt(result);
        }       
    </script>
</body>

</html>
