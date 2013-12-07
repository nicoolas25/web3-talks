summary_size = 70

computeSummary = (descr) ->
  summary = descr.slice(0, summary_size)
  summary += '...' if descr.length > summary_size
  summary

Template.talkItem.helpers
  summary: -> computeSummary(@description)

  humanTime: ->
    moment(@createdAt).format('HH[h]mm')

  humanDate: ->
    moment(@createdAt).format('DD/MM/YYYY')

  isOwner: ->
    ownsDocument(Meteor.userId(), @)

  isCandidate: ->
    @status is 'candidate'

  isAdmin: ->
    Roles.find({name: 'Admin'}).count() > 0

  nextStatus: ->
    switch @status
      when 'candidate' then 'accepted'
      when 'accepted'  then 'done'
      else 'done'

  prevStatus: ->
    switch @status
      when 'done'     then 'accepted'
      when 'accepted' then 'candidate'
      else 'candidate'

  votes: ->
    Votes.find({talkId: @_id}).count()

Template.talkItem.events
  'click .change-status': (event) ->
    link   = event.target
    status = link.attributes['data-new-status'].value
    talkId = link.attributes['data-talk-id'].value
    Talks.update talkId, {$set: {status: status}}, (error) ->
      if error
        alert(error.reason)

  'click .summary': (event) ->
    div = event.target
    attrName = 'data-is-full'
    attr = div.attributes[attrName]

    if attr and attr.value is '1'
      div.setAttribute(attrName, '0')
      div.innerHTML = computeSummary(@description)
    else
      div.setAttribute(attrName, '1')
      div.innerHTML = @description

  'click .vote': (event) ->
    vote =
      talkId: event.target.attributes['data-talk-id'].value

    # Remote call to the server
    Meteor.call 'votes/create', vote, (error, id) ->
      if error
        alert(error.reason)
