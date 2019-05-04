<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Setting Lucky Draw Application</title>
    <link rel="icon" href="{{ asset('img/favicon.png') }}">
    <link href="https://fonts.googleapis.com/css?family=Changa+One|Squada+One" rel="stylesheet">
    <link href="{{ asset('css/bootstrap.min.css') }}" rel="stylesheet">
    <link rel="stylesheet" href="{{ asset('css/select2/select2.css') }}" />
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <script src="{{ asset('js/jquery.min.js') }}"></script>
    <script src="{{ asset('js/select2/select2.min.js') }}"></script>
  </head>

  <body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-6 form_setting margin_setting">
                <div class="row">
                    <div class="col">
                        <div class="line">
                            <h1 class="setting_title text-center">Pre-setting for Lucky Draw</h1>
                        </div>
                    </div>
                </div>
                <div class="row row_form">
                    <div class="col">
                        <select class="form-control select2" id="select_event" name="select_event" style="width:100%">
                            <option value="">Choose a Event</option>
                            @if(count($events))

                                @foreach($events as $opt)
                                <option value="{{ $opt['id'] }}">{{ $opt['title'] }}</option>
                                @endforeach
                                                
                            @endif
                        </select>
                    </div>
                </div>
                <div class="row row_form">
                    <div class="col">
                        <select class="form-control select2" id="select_gift" name="select_gift" style="width:100%">
                            <option value="">Choose a Gift</option>
                        </select>
                    </div>
                </div>
                <div class="row row_form">
                    <div class="col">
                        <button id="btn_save" class="btn btn-block btn-primary disabled"> Save Setting</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
  
    <div class="row row_footer">
      <p class="copyright"> 
      © 2019 Copyright: <a href="http://www.anachak-it.com" target="_blank"> Anachak-IT </a>
      </p>
    </div>

<script>
    $(document).ready(function() {
        $('.select2').select2();
    });    

    $('body').on('change', '#select_event', function(){
        var gift_offer = $('#select_gift');
        var event_id = $(this).val();
        var get_url  = "{{ route('get_prize', '') }}/"+ event_id;

        gift_offer.find('option').not(':first').remove();
        $('#start_spin').prop('disabled', false).text('Start Spin');

        if(event_id != '' && $.isNumeric(event_id)){
                $.ajax({
                    url: get_url,
                    method: 'GET',
                    dataType: 'json',
                    // beforeSend: function(){
                    //     $('#btn_save').removeClass('disabled');
                    // }
                    success: function (response){
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
                    }
                })
            }
    });

    $('body').on('change', '#select_gift', function(){
        var offer_id = $(this).val();
            //var offer_num = $(this).find('option:selected').attr('data-num');
            //var offer_times = $(this).find('option:selected').attr('data-time');
            //var offer_time_ids = $(this).find('option:selected').attr('data-time_id');
            // var inc_win   = $(this).find('option:selected').attr('data-inc');
            //var id_time = offer_time_ids;

            //if(offer_time_ids.indexOf(',') > 0){
            //    var times = offer_time_ids.split(',');
            //    id_time   = times[0];
            //}
        $('#btn_save').addClass('disabled').prop('disabled', true);
        if(offer_id != '' && $.isNumeric(offer_id)){
            $('#btn_save').removeClass('disabled').prop('disabled', false);
        }
        
    });  

    $('body').on('change', '#star_save', function(e){
        e.preventDefault();
        var event_id = $('select_event').val();
        var prize_id = $('select_gift').val();

    });

  setTimeout(function(){
    $('.odometer').html(423234234);
  }, 1000);

  function loading_data(){

  }
</script>

  </body>
</html>
