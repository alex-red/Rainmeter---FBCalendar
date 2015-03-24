function Initialize()
   MeasureMailYear3   = SKIN:GetMeasure('MeasureMailYear3')
   MeasureMailMonth3  = SKIN:GetMeasure('MeasureMailMonth3')
   MeasureMailDay3    = SKIN:GetMeasure('MeasureMailDay3')
   MeasureMailHour3   = SKIN:GetMeasure('MeasureMailHour3')
   MeasureMailMinute3 = SKIN:GetMeasure('MeasureMailMinute3')
   MeasureMailSecond3 = SKIN:GetMeasure('MeasureMailSecond3')
end

function Update()
   local UTC             = os.date('!*t')
   local LocalTime       = os.date('*t')
   local DaylightSavings = LocalTime.isdst and 3600 or 0
   local LocalOffset     = os.time(LocalTime) - os.time(UTC) + DaylightSavings

   local t = {
      year  = MeasureMailYear3:GetStringValue(),
      month = MeasureMailMonth3:GetStringValue(),
      day   = MeasureMailDay3:GetStringValue(),
      hour  = MeasureMailHour3:GetStringValue(),
      min   = MeasureMailMinute3:GetStringValue(),
      sec   = MeasureMailSecond3:GetStringValue(),
   }

   return os.time(t) + 11644473600 + 2 * LocalOffset
end