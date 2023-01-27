require 'rails_helper'

RSpec.describe Like, type: :model do
  like { Like.new(author_id: 1, post_id:1) }

  before { like.save }

  describe "Like model validation" do

    it "The like model created right now should be valid" do
      expect(like).to be_valid
    end

    it "The autor-id of the like model created right now should not be 50 " do
      expect(like.author_id).to_not eq(50)
    end

  end # end of inner describe loop
end
