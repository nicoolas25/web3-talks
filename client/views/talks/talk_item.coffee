summary_size = 140

Template.talkItem.helpers
  summary: ->
    summary = @description.slice(0, summary_size)
    summary += '...' if @description.length > summary_size
    summary
