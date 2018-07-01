#Refresh time (default: 1/2 minute 30000)
refreshFrequency: 30000

#Body Style
style: """

  @font-face
   font-family: 'GalanoGrotesqueDEMO-Bold'
   src: local('GalanoGrotesqueDEMO-Bold'), local('GalanoGrotesqueDEMO-Bold'),
         url(GalanoGrotesqueDEMO-Bold.otf)

  color: #fff

  .main
   position: relative
   width: 100vw
   height: 100vh

  .container
   margin: auto
   position: relative
   top: 50%
   left: 50%
   transform: translate(-50%, -50%)
   height:400px
   width:400px
   color: #fff
   text-shadow:0px 0px 20px rgba(0,0,0,0.3)
   font-smoothing: antialiased

  .line
   position: relative
   top: 130px
   left: 140px
   height: 2px
   width: 280px
   transform: rotate(90deg)
   background-color: #fff

  .weekday
   position: relative
   left: 235px
   height:200px
   width: auto
   font-family:'GalanoGrotesqueDEMO-Bold'
   font-weight: normal
   font-size: 170px
   text-align: center
   -webkit-clip-path: inset(0px 0px 0px 46px)
   text-transform: uppercase

  .time
   position: relative
   top: 150px
   left: 40px
   font-family:'GalanoGrotesqueDEMO-Bold'
   font-weight: bold
   font-size: 50px
   text-align: center
   transform: rotate(270deg)

"""

#Render function
render: -> """
<div class="main">
  <div class="container">
    <div class="time"><sapn>01:40 AM</span></div>
    <div class="line"></div>
    <div class="weekday">WED</div>
  </div>
</div>
"""

  #Update function
update: (output, domEl) ->

  days = ["sun", "mon", "tues", "wed", "thur", "fri", "sat"]

  div = $(domEl)
  #Creating a new Date object
  date = new Date()
  hour = date.getHours()
  minute = date.getMinutes()
  day = date.getDay()

  hour   = hour % 12
  hour   = 12 if hour == 0
  hour   = '0' + hour if hour < 10

  time_str = hour + ':' + minute
  day_str = days[day]
  #DOM manipulation

  div.find('.time').text("#{time_str}")
  div.find('.weekday').text("#{day_str}")
