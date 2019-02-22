# User -> photo: 1 user--> many photos
# Photo -> comment: 1 photo --> many comments

class User
    attr_accessor :name, :photos
    def initialize(name)
        @name = name
        @photos = Photo.new
    end
end

class Photo
    @@all = []
    attr_accessor :user
    def initialize
      @@all << self
    end

    def comments
    #below: go through all comments, select the commets that belong to the photo.
       Comment.all.select do | comment |
          comment.photo == self #select according to this condition
       end
    end

    def make_comment(comment)
      Comment.new(self)
    end

    def self.all
      @@all
    end

end

class Comment

    @@all = []
    attr_accessor :photo
    def initialize(photo)
      @photo = photo
      @@all << self
    end
    
    def self.all
      @@all
    end
end


sandwich_photo = Photo.new #create a new Photo instance, no property initialized

sophie = User.new("Sophie") #create a new User instance, one property
sandwich_photo.user = sophie #Photo.new.user, photo has a user property
sandwich_photo.user.name  #Photo.new.user.name, photo has a user property, user directs to name property
# => "Sophie"  PASSED

sophie.photos #User.new("Sophie").photos, user has a photos property
# => [#<Photo:0x00007fae2880b370>] PASSED

sandwich_photo.comments  #Photo.new.comments
# => [] #Passed

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch") #Photo.new.make_comment("string")

sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]
