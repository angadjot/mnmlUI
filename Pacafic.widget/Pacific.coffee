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
   position: relative
   top: 50%
   left: 50%
   transform: translate(-122%, -60%);
   height:400px
   width:600px
   font-weight: bold
   text-align:center
   color: #fff
   text-shadow:0px 0px 20px rgba(0,0,0,0.3)
   font-smoothing: antialiased

  .month
   margin: auto
   position: relative
   top: 500px
   left: -60px
   font-family: 'Pacifico'
   font-size: 100px

  .date
   margin: auto
   position: relative
   margin-top: 10px
   font-family: 'Futurist Fixed-width'
   font-size: 18px
   font-weight: bold
   text-transform: uppercase
   text-align: center

  .time
   margin: auto
   position: relative
   margin-top: 200px
   font-family: 'Futurist Fixed-width'
   font-size: 18px
   font-weight: bold
   text-transform: uppercase
   text-align: center

"""

#Render function
render: -> """
  <div class="main">
        <div class="container">
            <div class="square">
                <div class="rectTop"></div>
                <div class="rectLeft"></div>
                <div class="rectRight"></div>
                <div class="rectBottom"></div>
                <div class="month">
                    <span>June</span>
                </div>
                <div class="time">
                    <span>Two Two</span>
                </div>
                <div class="date">
                    <span>Friday - 29</span>
                </div>
            </div>
        </div>
    </div>
"""

  #Update function
update: (output, domEl) ->

  #Options: (true/false)
  showAmPm = true;
  showName = true;
  fourTwenty = false; #Smoke Responsibly
  militaryTime = false; #Military Time = 24 hour time

  #Arrays
  monthsArr = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  monthRightLineLenghtArr = [140, 140, 110, 110, 150, 150, 150, 140, 110, 140, 110, 110]
  monthBottomLineLenght = [50, 10, 65, 100, 90, 80, 90, 80, 20, 40, 20, 20]
  hours = [null, "One", "Two", "Three", "Four", "Five", "Six", "Seven",
    "Eight", "Nine", "Ten", "Eleven", "Twelve"]
  ones = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven",
    "Eight", "Nine"]
  teens = ["Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen",
    "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
  tens = [null, null, "Twenty", "Thirty", "Forty", "Fifty"]
  days = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

  #Creating a new Date object
  date = new Date()
  hour = date.getHours()
  minute = date.getMinutes()
  day = date.getDay()
  month = date.getMonth()
  hour   = hour % 12
  hour   = 12 if hour == 0
  day_date = date.getDate()

  hour_str = hours[hour]
  if minute >= 0 && minute <= 9
    minute_str = "#{ones[minute]}"
  else if minute >= 10 && minute <= 19
    minute_str = teens[minute - 10]
  else
    minute_str = tens[minute.toString()[0..0]]
    if minute.toString()[1..1] != "0"
      minute_str += ones[minute.toString()[1..1]]

  time_str = hour_str + ' ' + minute_str
  monthName = monthsArr[month]
  bottomLineLenght = monthBottomLineLenght[month]
  rightLineLenght = monthRightLineLenghtArr[month]

  date_str = days[day] + "-" + day_date
  console.log("Date_str: " + date_str)
  div = $(domEl)

  #DOM manipulation
  div.find('.rectRight').css('height', rightLineLenght + 'px')
  div.find('.rectBottom').css('width', bottomLineLenght + 'px')
  div.find('.time').text("#{time_str}")
  div.find('.month').text("#{monthName}")
  div.find('.date').text("#{date_str}")
