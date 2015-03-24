function Initialize()
   MeasureMailYear6   = SKIN:GetMeasure('MeasureMailYear6')
   MeasureMailMonth6  = SKIN:GetMeasure('MeasureMailMonth6')
   MeasureMailDay6    = SKIN:GetMeasure('MeasureMailDay6')
   MeasureMailHour6   = SKIN:GetMeasure('MeasureMailHour6')
   MeasureMailMinute6 = SKIN:GetMeasure('MeasureMailMinute6')
   MeasureMailSecond6 = SKIN:GetMeasure('MeasureMailSecond6')
end

function Update()
   local UTC             = os.date('!*t')
   local LocalTime       = os.date('*t')
   local DaylightSavings = LocalTime.isdst and 3600 or 0
   local LocalOffset     = os.time(LocalTime) - os.time(UTC) + DaylightSavings

   local t = {
      year  = MeasureMailYear6:GetStringValue(),
      month = MeasureMailMonth6:GetStringValue(),
      day   = MeasureMailDay6:GetStringValue(),
      hour  = MeasureMailHour6:GetStringValue(),
      min   = MeasureMailMinute6:GetStringValue(),
      sec   = MeasureMailSecond6:GetStringValue(),
   }

   return os.time(t) + 11644473600 + 2 * LocalOffset
end