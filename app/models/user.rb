#http://stackoverflow.com/questions/24125991/cant-deploy-rails-and-faye-app-to-heroku
class User < ActiveRecord::Base

  def password=(pass)
    super(Digest::MD5.hexdigest(pass)) if pass
  end

  def full_name
    "#{first_name} #{last_name}".strip
  end

end
