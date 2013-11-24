summary_size = 75

Template.talkItem.helpers
  summary: ->
    summary = @description.slice(0, summary_size)
    summary += '...' if @description.length > summary_size
    summary

  humanTime: ->
    moment(@createdAt).format('HH[h]mm')

  humanDate: ->
    moment(@createdAt).format('DD/MM/YYYY')

  isOwner: ->
    @userId is Meteor.userId()

  votes: ->
    0
