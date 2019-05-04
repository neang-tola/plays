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
window.odometerOptions = {
  format: 'd'
};  
  setTimeout(function(){
    $('.odometer').html(423234234);
  }, 1000);

  function loading_data(){

  }
</script>

  </body>
</html>
