#Refresh time (default: 1/2 minute 30000)
refreshFrequency: 30000

#Body Style
style: """

  @font-face
   font-family: 'GeosansLight'
   src: local('GeosansLight'), local('GeosansLight'),
         url(GeosansLight.ttf)

  @font-face
   font-family: 'Pacifico'
   src: local('Pacifico'), local('Pacifico'),
         url(Pacifico.ttf)

  color: #fff

  .main
   position: relative
   width: 100vw
   height: 100vh

  .container
   margin: auto
   position: absolute
   top: 50%
   left: 50%
   transform: translate(-50%, -50%);
   height:auto
   width:auto
   font-weight:bold
   color: #fff
   text-shadow:0px 0px 20px rgba(0,0,0,0.3)
   font-smoothing: antialiased

  .month
   top: 500px
   left: -60px
   font-family: 'Pacifico'
   font-size: 100px
   text-align: right

  .Year
   top: -10px
   left: -30px
   font-family: 'GeosansLight'
   font-size: 22px
   text-transform: uppercase
   text-align: right

  .TimeDate
   top: -10px
   left: -30px
   font-family: 'GeosansLight'
   font-size: 22px
   text-transform: uppercase
   text-align: right

"""

#Render function
render: -> """
  <div class="main">
    <div class="container">
      <div class="month"><span></span></div>
      <div class="Year"><span></span></div>
      <div class="TimeDate"><span></span></div>
    </div>
  </div>
"""

  #Update function
update: (output, domEl) ->

  #Arrays
  months = ["jan", "feb", "mar", "apr", "May", "June", "July", "aug", "Sept", "Oct", "Nov", "Dec"]
  days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

  #Creating a new Date object
  date = new Date()
  year = date.getFullYear()
  hour = date.getHours()
  minute = date.getMinutes()
  day = date.getDay()
  month = date.getMonth()
  day_date = date.getDate()

  if hour >= 12
    ampm = 'PM'
  else
    ampm = 'AM'

  hour = hour % 12
  hour = 12 if hour == 0
  console.log (hour)
  monthName = months[month]
  timeDate = hour + ':' + minute + ' ' + ampm + ' ON ' + days[day] + ' ' + day_date

  div = $(domEl)

  #DOM manipulation
  div.find('.month').text("#{monthName}")
  div.find('.Year').text("#{year}")
  div.find('.TimeDate').text("#{timeDate}")
