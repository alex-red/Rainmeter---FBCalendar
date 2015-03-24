function Initialize()
   MeasureMailYear7   = SKIN:GetMeasure('MeasureMailYear7')
   MeasureMailMonth7  = SKIN:GetMeasure('MeasureMailMonth7')
   MeasureMailDay7    = SKIN:GetMeasure('MeasureMailDay7')
   MeasureMailHour7   = SKIN:GetMeasure('MeasureMailHour7')
   MeasureMailMinute7 = SKIN:GetMeasure('MeasureMailMinute7')
   MeasureMailSecond7 = SKIN:GetMeasure('MeasureMailSecond7')
end

function Update()
   local UTC             = os.date('!*t')
   local LocalTime       = os.date('*t')
   local DaylightSavings = LocalTime.isdst and 3600 or 0
   local LocalOffset     = os.time(LocalTime) - os.time(UTC) + DaylightSavings

   local t = {
      year  = MeasureMailYear7:GetStringValue(),
      month = MeasureMailMonth7:GetStringValue(),
      day   = MeasureMailDay7:GetStringValue(),
      hour  = MeasureMailHour7:GetStringValue(),
      min   = MeasureMailMinute7:GetStringValue(),
      sec   = MeasureMailSecond7:GetStringValue(),
   }

   return os.time(t) + 11644473600 + 2 * LocalOffset
end