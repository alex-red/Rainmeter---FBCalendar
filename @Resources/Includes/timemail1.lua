function Initialize()
   MeasureMailYear1   = SKIN:GetMeasure('MeasureMailYear1')
   MeasureMailMonth1  = SKIN:GetMeasure('MeasureMailMonth1')
   MeasureMailDay1    = SKIN:GetMeasure('MeasureMailDay1')
   MeasureMailHour1   = SKIN:GetMeasure('MeasureMailHour1')
   MeasureMailMinute1 = SKIN:GetMeasure('MeasureMailMinute1')
   MeasureMailSecond1 = SKIN:GetMeasure('MeasureMailSecond1')
end

function Update()
   local UTC             = os.date('!*t')
   local LocalTime       = os.date('*t')
   local DaylightSavings = LocalTime.isdst and 3600 or 0
   local LocalOffset     = os.time(LocalTime) - os.time(UTC) + DaylightSavings

   local t = {
      year  = MeasureMailYear1:GetStringValue(),
      month = MeasureMailMonth1:GetStringValue(),
      day   = MeasureMailDay1:GetStringValue(),
      hour  = MeasureMailHour1:GetStringValue(),
      min   = MeasureMailMinute1:GetStringValue(),
      sec   = MeasureMailSecond1:GetStringValue(),
   }

   return os.time(t) + 11644473600 + 2 * LocalOffset
end