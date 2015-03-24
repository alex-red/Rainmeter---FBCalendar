function Initialize()
   MeasureMailYear9   = SKIN:GetMeasure('MeasureMailYear9')
   MeasureMailMonth9  = SKIN:GetMeasure('MeasureMailMonth9')
   MeasureMailDay9    = SKIN:GetMeasure('MeasureMailDay9')
   MeasureMailHour9   = SKIN:GetMeasure('MeasureMailHour9')
   MeasureMailMinute9 = SKIN:GetMeasure('MeasureMailMinute9')
   MeasureMailSecond9 = SKIN:GetMeasure('MeasureMailSecond9')
end

function Update()
   local UTC             = os.date('!*t')
   local LocalTime       = os.date('*t')
   local DaylightSavings = LocalTime.isdst and 3600 or 0
   local LocalOffset     = os.time(LocalTime) - os.time(UTC) + DaylightSavings

   local t = {
      year  = MeasureMailYear9:GetStringValue(),
      month = MeasureMailMonth9:GetStringValue(),
      day   = MeasureMailDay9:GetStringValue(),
      hour  = MeasureMailHour9:GetStringValue(),
      min   = MeasureMailMinute9:GetStringValue(),
      sec   = MeasureMailSecond9:GetStringValue(),
   }

   return os.time(t) + 11644473600 + 2 * LocalOffset
end