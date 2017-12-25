// Feedback compiler, used as the front end object maker
//

	var ErrorReport = function(passing, msg){
		this.passing = true
		this.msg = msg || ''
	}

  ErrorReport.prototype.throw = function(message){
		this.passing = false
		this.msg = message
		console.error(this.msg)
		$('.error-box').append('<div class="error-text">' + this.msg + '</div>').show().fadeOut(5000, function(){
			$(this).empty()
		})
	}

	var FeedbackCompiler = function(){
	  this.waysOfBeing = [] 
		this.likableRating = 5 
		this.trustworthyRating = 5
		this.toFirstName = ''
		this.toLastName = ''
		this.toEmail = ''
		this.message = ''
		this.fromFirstName = ''
		this.fromLastName = '' 
		this.fromUserId = null
		this.anonymous = true
		this.errorReport = new ErrorReport
	}

	FeedbackCompiler.prototype.setData = function(){
		this.toFirstName = $('#first-name').val()	
		this.toLastName = $('#last-name').val()	
		this.toEmail = $('#email').val()	
		this.message = $('#message').val()	
		this.fromFirstName= $('#from-first-name').val()
		this.fromLastName = $('#from-last-name').val()
		this.likableRating = $('.stars[name="rating-likable"]').attr('data-stars')
		this.trustworthyRating = $('.stars[name="rating-trustworthy"]').attr('data-stars')
	}

	FeedbackCompiler.prototype.validateFirstName = function(){
		if( this.toFirstName === '' || this.toFirstName === undefined ) {
		  this.errorReport.throw('You\'re missing the first name')	
		} else {
			this.errorReport.passing = true
		}
	}


	FeedbackCompiler.prototype.validateLastName = function(){
		if( this.toLastName === '' || this.toLastName === undefined ) {
		  this.errorReport.throw('You\'re missing the last name')	
		} else {
			this.errorReport.passing = true
		}
	}


	FeedbackCompiler.prototype.validateMessage = function(){
		if( this.message === '' || this.message === undefined ) {
		  this.errorReport.throw('You\'re missing the message')	
		} else {
			this.errorReport.passing = true
		}
	}

	FeedbackCompiler.prototype.validateAll = function(){
		this.validateFirstName()
		this.validateLastName()
		this.validateMessage()
		this.validateEmail()
	}


	FeedbackCompiler.prototype.validateEmail = function(){
		var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
		
		if (!re.test(this.toEmail)){
			this.errorReport.throw('The email address you provided is not a valid email, please check it.')
		}	
	}

	FeedbackCompiler.prototype.postFbToServer = function(){
		console.log('Error Report:', this.errorReport)
		var _this = this
		return new Promise(function(resolve, reject){
			if (_this.errorReport.passing){
				$.post('/feedback', _this, function(resData, jwRes){
					console.log(jwRes);
					if(jwRes.statusCode === 200 || jwRes.statusCode === 201){
						resolve(jwRes)
					} else {
						reject(jwRes)	
					}
				})	
			} else {
				reject(false)
				console.log('failed passing, clearing in 5 seconds')
			}
		})
	}

