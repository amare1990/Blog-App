require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'Hi man', author_id: 1, post_id: 1) }

  before { subject.save }

  describe " model validation: \n" do
    it 'text value in the comment model should not be null' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it "text value in the comment model should be equal to 'Hi man' " do
      expect(subject.text).to eq('Hi man')
    end
  end
end
