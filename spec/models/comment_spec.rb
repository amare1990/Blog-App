require 'rails_helper'

RSpec.describe Comment, type: :model do
  comment { Comment.new(text: "Hi man", author_id: 1, post_id: 1) }

  before { comment.save }

  describe "Comment model validation" do

    t "Right now the comment model created should be valid" do
      expect(comment).to be_valid
    end

    t "text value in the comment model should not be null" do
      comment.text = nil
      expect(comment).to_not be_valid
    end

    t "text value in the comment model should be equal to 'Hi man' " do
      expect(comment.text).to eq('Hi man')
    end
  end # end of inner describe model
end
