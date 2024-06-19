# 96rp_voiceAdditions
<p>
  This resource offers new options missing in pma-voice!<br>
  Everyone can use and modify this resource for free!<br>
  Credits would be cool ofc :)<br>
  This is a standalone resource btw
</p>
<p>
  Feel free to join our discord and support us if u want to :)<br>
  We dont sell anything and want to offer free scripts in the near future<br>
  You can also ask us for help or report bugs with a ticket on our discord!
</p>
<h1><a href="https://discord.gg/96rp">discord.gg/96rp</a></h1>
Current functions:
<ul>
   <li>mute yourself</li>
   <li>show voice range via marker and/or text</li>
</ul>

<pre>
  Config.Marker = {
    show = true,                               <- shows marker on voice range change
    type = 1,                                  <- marker type (check fivem docs)
    showTime = 2,                              <- time until marker vanishes on voice range change in seconds
    r = 70,                                    <- color red
    g = 99,                                    <- color green
    b = 172                                    <- color blue
  }
  
  Config.RangeText = {
      show = true,                             <- shows text for
      changePositionInsideVehicle = true,      <- changes text position when the player enters a car (usable if you have a vehicle ui that covers the text)
      changePositionOnlyForDriver = true,      <- changes text position only for drivers (changePositionInsideVehicle must be true too)
  }
  
  Config.NativeAduioActivated = true           <- set to true if you use native audio in pma-voice (native audio doesnt use the metric system, thats why my script will multiply meters by 7 if set to true)
  
  Config.MuteKey = 'M'                         <- toggle key
</pre>
