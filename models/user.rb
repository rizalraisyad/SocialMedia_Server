require_relative "../connector/db_connector"

class User
  attr_accessor :bio
  attr_reader :id, :created_at, :username, :email 

  def initialize(params)
    @username = params[:username]
    @email = params[:email]
    @bio = params[:bio] ? params[:bio] : ""
  end

  def valid?
    return false if @username.nil? or @username == ""
    return false if @email.nil? or @email == ""
    true
  end
  
  def save 
    client = create_db_client
    client.query(
      "INSERT INTO Users (username, email, bio) VALUES ('#{@username}', '#{@email}', '#{@bio}')"
    )
  end
end