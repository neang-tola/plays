<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Setting Lucky Draw Application</title>
    <link rel="icon" href="{{ asset('img/favicon.png') }}">
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

    // check_data();

    $('body').on('change', '#select_event', function(){
        var gift_offer = $('#select_gift');
        var event_id = $(this).val();
        var get_url  = "{{ route('get_prize', '') }}/"+ event_id;

        // gift_offer.find('option').not(':first').remove();
        // $('#btn_save').addClass('disabled').prop('disabled', true);

        if(event_id != '' && $.isNumeric(event_id)){
                $.ajax({
                    url: get_url,
                    method: 'GET',
                    dataType: 'json',
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

        $('#btn_save').addClass('disabled').prop('disabled', true);
        if(offer_id != '' && $.isNumeric(offer_id)){
            $('#btn_save').removeClass('disabled').prop('disabled', false);
        }
        
    });  

    $('body').on('click', '#btn_save', function(){
        var get_url  = "{{ route('pre_start_spin') }}";
        var event_id = $('#select_event').val();
        var prize_id = $('#select_gift').val();

        $.ajax({
            url: get_url,
            method: 'GET',
            dataType: 'json',
            data: {'event_id': event_id, 'prize_id': prize_id },
            beforeSend: function(){
                // $('#select_event').prop('disabled', true).select2();
                // $('#select_gift').prop('disabled', true).select2();
                $('#btn_save').addClass('disabled').prop('disabled', true);
            },
            success: function(response){
                if (response.msg == 'Successful'){
                    $('#select_gift option:selected').prop('disabled', true).select2();
                }
            }
        })
    });



  function check_data(){

        $.ajax({
            url: '{{ route("check_spin_action") }}',
            method: 'GET',
            dataType: 'json',
            success: function(response){
                console.log(response);
                $('#select_event').prop('disabled', true).select2();
                $('#select_gift').prop('disabled', true).select2();
                $('#btn_save').addClass('disabled').prop('disabled', true);                
                if (response.msg == 'no'){
                    $('#select_event').prop('disabled', false).select2();
                    $('#select_gift').prop('disabled', false).select2();
                    $('#btn_save').removeClass('disabled').prop('disabled', false);
                }
            }
        })
  }
</script>

  </body>
</html>
