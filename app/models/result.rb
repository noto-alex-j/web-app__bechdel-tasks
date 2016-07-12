# DB.define_column("results", "movie_id", "integer")
# DB.define_column("results", "user_id", "integer")
# DB.define_column("results", "q1", "boolean")
# DB.define_column("results", "q2", "boolean")
# DB.define_column("results", "q3", "boolean")
class Result < ActiveRecord::Base
  include Errors
 # Sets the Result object's q1, q2, q3 columns to nil
 #
 # Returns nil
  def set_qs_to_nil
    self.q1 = nil
    self.q2 = nil
    self.q3 = nil
  end

 # Finds all of the Result objects that pass the bechdel test
 #
 # Returns list of Result objects
	def Result.passing
		results = Result.where({"q1" => true, "q2" => true, "q3" => true})
		if results.empty?
			return nil
		else
			return results
		end
	end

  def Result.rated
    results = Result.where({"q1" => !nil})
    if results.empty?
      return nil
    else
      return results
    end
  end
  
 # Checks to see if a Movie object passes the bechdel test
 #
 # Returns Boolean
  def is_bechdel
    if self.q1 == true && self.q2 == true && self.q3 == true
      return true
    else
      return false
    end
  end

 # Gets a collection of Movie objects
 #
 # Returns a collection of Movie objects
	def movie_info
		Movie.find_by_id(self.movie_id)
	end


 # Adds errors to Array
 #
 # Returns Array
	def set_errors
  	@errors = []
    if !self.user_id # same as: if self.user_id == nil
    	@errors << "Must be logged in to add or edit the Bechdel rating."
  	end
  end
end