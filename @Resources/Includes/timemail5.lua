function Initialize()
   MeasureMailYear5   = SKIN:GetMeasure('MeasureMailYear5')
   MeasureMailMonth5  = SKIN:GetMeasure('MeasureMailMonth5')
   MeasureMailDay5    = SKIN:GetMeasure('MeasureMailDay5')
   MeasureMailHour5   = SKIN:GetMeasure('MeasureMailHour5')
   MeasureMailMinute5 = SKIN:GetMeasure('MeasureMailMinute5')
   MeasureMailSecond5 = SKIN:GetMeasure('MeasureMailSecond5')
end

function Update()
   local UTC             = os.date('!*t')
   local LocalTime       = os.date('*t')
   local DaylightSavings = LocalTime.isdst and 3600 or 0
   local LocalOffset     = os.time(LocalTime) - os.time(UTC) + DaylightSavings

   local t = {
      year  = MeasureMailYear5:GetStringValue(),
      month = MeasureMailMonth5:GetStringValue(),
      day   = MeasureMailDay5:GetStringValue(),
      hour  = MeasureMailHour5:GetStringValue(),
      min   = MeasureMailMinute5:GetStringValue(),
      sec   = MeasureMailSecond5:GetStringValue(),
   }

   return os.time(t) + 11644473600 + 2 * LocalOffset
end