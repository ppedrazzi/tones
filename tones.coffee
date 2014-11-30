if Meteor.isClient
	console.log "client is alive and well."
	Session.setDefault("counter", 0)

	Template.hello.helpers
		counter: () ->
			Session.get("counter")

	Template.hello.events
		'click #play': () ->
			console.log "Clicked"
			T("sin", {freq: 4400, mul:0.5, timevalue: "3sec" }).play()
			Session.set("counter", Session.get("counter") + 1)
		'click #pause': () ->
			T.pause()
			
		'click #freqSlider': () ->
			console.log "moved the slider #{value}"

if Meteor.isServer
	Meteor.startup () ->
		console.log "Tone server is alive."
    