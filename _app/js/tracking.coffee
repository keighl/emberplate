###*
 * Google Analytics Tracking
 * https://developers.google.com/analytics/devguides/collection/gajs/eventTrackerGuide
 * @author Kyle Truscott
 ###

###*
 * Event tracking helper - push event object into _gaq
 * @params event -> { category:string, action:string, label:string, value:int }
 * @author Kyle Truscott
 * @return BOOL
 ###

window.__ga_track_event = (event) ->
  if ga?
    ga 'send', 'event', event.category, event.action, event.label, event.value
    return true
  return false
