module ApplicationHelper #Everything here is accessible from the view bad practice to have methods in view
    
    def gravatar_for(user, options = { size: 55 }) #Method defined
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase) #Grabs gravatar id
        size = options[:size]
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}" #stores gravatar url and size
        image_tag(gravatar_url, alt: user.author, class: "img-circle")
    end

end
