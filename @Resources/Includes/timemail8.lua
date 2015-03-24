function Initialize()
   MeasureMailYear8   = SKIN:GetMeasure('MeasureMailYear8')
   MeasureMailMonth8  = SKIN:GetMeasure('MeasureMailMonth8')
   MeasureMailDay8    = SKIN:GetMeasure('MeasureMailDay8')
   MeasureMailHour8   = SKIN:GetMeasure('MeasureMailHour8')
   MeasureMailMinute8 = SKIN:GetMeasure('MeasureMailMinute8')
   MeasureMailSecond8 = SKIN:GetMeasure('MeasureMailSecond8')
end

function Update()
   local UTC             = os.date('!*t')
   local LocalTime       = os.date('*t')
   local DaylightSavings = LocalTime.isdst and 3600 or 0
   local LocalOffset     = os.time(LocalTime) - os.time(UTC) + DaylightSavings

   local t = {
      year  = MeasureMailYear8:GetStringValue(),
      month = MeasureMailMonth8:GetStringValue(),
      day   = MeasureMailDay8:GetStringValue(),
      hour  = MeasureMailHour8:GetStringValue(),
      min   = MeasureMailMinute8:GetStringValue(),
      sec   = MeasureMailSecond8:GetStringValue(),
   }

   return os.time(t) + 11644473600 + 2 * LocalOffset
end