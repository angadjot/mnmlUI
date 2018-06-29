#Refresh time (default: 1/2 minute 30000)
refreshFrequency: 30000

#Body Style
style: """

  @font-face
   font-family: 'NoirMedium'
   src: local('NoirMedium'), local('NoirMedium'),
         url(NoirMedium.ttf)

  color: #fff

"""

#Render function
render: -> """
  <svg height="1920" width="1080">
        <text x="120" y="150" id="date" xml:space="preserve" style="font-size:72px;font-style:normal;font-weight:lighter;fill:#fff;font-family:Roboto;font-smoothing:antialiased;"></text>
        <line x1="260" y1="70" x2="75" y2="280" style="stroke:#fff;stroke-width:2" />
        <defs>
            <clipPath id="clip1">
                <polygon points="15 350,700 350,700 0,320 0" />
            </clipPath>
        </defs>
        <text x="200" y="150" id="weekday" xml:space="preserve" clip-path="url(#clip1)" style="font-size:72px;font-style:normal;font-weight:normal;fill:#fff;font-family:Noir;font-smoothing:antialiased;"></text>
        <text x="145" y="205" id="month" xml:space="preserve " clip-path="url(#clip1)" style="font-size:72px;font-style:normal;font-weight:normal;fill:#fff;font-family:Noir;font-smoothing:antialiased;"></text>
        <text x="115" y="260" id="year" xml:space="preserve " clip-path="url(#clip1)" style="font-size:58px;font-style:normal;font-weight:normal;fill:#fff;font-family:Noir;font-smoothing:antialiased;"></text>
    </svg>
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
  year = date.getYear()
  div = $(domEl)

  day_str = days[day]
  month_str = months[month]
  #DOM manipulation

  div.find('date').text(date_num)

  #div.find('weekday').text("#{day_str}")
  #div.find('month').text("#{month_str}")
  #div.find('year').text("#{year}")
