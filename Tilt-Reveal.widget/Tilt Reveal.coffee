#Refresh time (default: 1/2 minute 30000)
refreshFrequency: 30000

#Body Style
style: """

  @font-face
   font-family: 'NoirMedium'
   src: local('NoirMedium'), local('NoirMedium'),
         url(NoirMedium.ttf)

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
   width:600px
   color: #fff
   text-shadow:0px 0px 20px rgba(0,0,0,0.3)
   font-smoothing: antialiased

  .date
   position: relative
   top: 160px
   left: 120px
   font-family:'Roboto'
   font-size: 90px
   font-weight: lighter

  .daigonal
   position: relative
   top: 180px
   left: 15px
   height: 2px
   width: 280px
   transform: rotate(-48deg)
   background-color: #fff

  .clip-box
   position: relative
   height:400px
   width: auto
   font-family:'Noir'
   font-weight: normal
   -webkit-clip-path: polygon(237px 90px, 600px 90px, 600px 350px, 0px 353px)

  .weekday
   position: absolute
   top: 90px
   left: 200px
   font-size: 72px

  .month
   position: absolute
   top: 150px
   left: 140px
   font-size: 72px

  .year
   position: absolute
   top: 220px
   left: 100px
   font-size: 58px
"""

#Render function
render: -> """
<div class="main">
  <div class="container">
    <div class="date"><sapn></span></div>
    <div class="daigonal"></div>
    <div class="clip-box">
      <span class="weekday"></span>
      <span class="month"></span>
      <span class="year"></span>
    </div>
  </div>
</div>
"""

  #Update function
update: (output, domEl) ->

  #Arrays
  months = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"]
  days = ["sunday", "monday", "tuesday", "wednesday", "thursday", "friday", "saturday"]

  #Creating a new Date object
  date = new Date()
  date_num = date.getDate()
  month = date.getMonth()
  day = date.getDay()
  year = date.getFullYear()
  div = $(domEl)

  day_str = days[day]
  month_str = months[month]
  #DOM manipulation

  div.find('.date').text("#{date_num}")
  div.find('.weekday').text("#{day_str}")
  div.find('.month').text("#{month_str}")
  div.find('.year').text("#{year}")
