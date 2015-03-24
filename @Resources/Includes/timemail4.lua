function Initialize()
   MeasureMailYear4   = SKIN:GetMeasure('MeasureMailYear4')
   MeasureMailMonth4  = SKIN:GetMeasure('MeasureMailMonth4')
   MeasureMailDay4    = SKIN:GetMeasure('MeasureMailDay4')
   MeasureMailHour4   = SKIN:GetMeasure('MeasureMailHour4')
   MeasureMailMinute4 = SKIN:GetMeasure('MeasureMailMinute4')
   MeasureMailSecond4 = SKIN:GetMeasure('MeasureMailSecond4')
end

function Update()
   local UTC             = os.date('!*t')
   local LocalTime       = os.date('*t')
   local DaylightSavings = LocalTime.isdst and 3600 or 0
   local LocalOffset     = os.time(LocalTime) - os.time(UTC) + DaylightSavings

   local t = {
      year  = MeasureMailYear4:GetStringValue(),
      month = MeasureMailMonth4:GetStringValue(),
      day   = MeasureMailDay4:GetStringValue(),
      hour  = MeasureMailHour4:GetStringValue(),
      min   = MeasureMailMinute4:GetStringValue(),
      sec   = MeasureMailSecond4:GetStringValue(),
   }

   return os.time(t) + 11644473600 + 2 * LocalOffset
end