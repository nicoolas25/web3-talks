summary_size = 140

Template.talkItem.helpers
  # The summary function extracts the begening of a talk's description
  summary: ->
    summary = @description.slice(0, summary_size)
    summary += '...' if @description.length > summary_size
    summary

  humanTime: ->
    moment(@createdAt).format('HH[h]mm')

  humanDate: ->
    moment(@createdAt).format('DD/MM/YYYY')
