function Initialize()
   MeasureMailYear2   = SKIN:GetMeasure('MeasureMailYear2')
   MeasureMailMonth2  = SKIN:GetMeasure('MeasureMailMonth2')
   MeasureMailDay2    = SKIN:GetMeasure('MeasureMailDay2')
   MeasureMailHour2   = SKIN:GetMeasure('MeasureMailHour2')
   MeasureMailMinute2 = SKIN:GetMeasure('MeasureMailMinute2')
   MeasureMailSecond2 = SKIN:GetMeasure('MeasureMailSecond2')
end

function Update()
   local UTC             = os.date('!*t')
   local LocalTime       = os.date('*t')
   local DaylightSavings = LocalTime.isdst and 3600 or 0
   local LocalOffset     = os.time(LocalTime) - os.time(UTC) + DaylightSavings

   local t = {
      year  = MeasureMailYear2:GetStringValue(),
      month = MeasureMailMonth2:GetStringValue(),
      day   = MeasureMailDay2:GetStringValue(),
      hour  = MeasureMailHour2:GetStringValue(),
      min   = MeasureMailMinute2:GetStringValue(),
      sec   = MeasureMailSecond2:GetStringValue(),
   }

   return os.time(t) + 11644473600 + 2 * LocalOffset
end