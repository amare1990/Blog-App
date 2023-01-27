require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new(author_id: 1, post_id: 1) }

  before { subject.save }

  describe " model validation: \n" do
    it 'The author-id of the like model created right now should not be 50 ' do
      expect(subject.author_id).to_not eq(50)
    end

    it 'The author-id of the like model created right now should be 1 ' do
      expect(subject.author_id).to eq(1)
    end
    it 'The post_id of the like model created right now should be 1 ' do
      expect(subject.post_id).to eq(1)
    end

    it 'The like should have an author_id ' do
      subject.author_id = nil
      expect(subject).to_not be_valid
    end

    it 'The like should have a post_id else it is invalid ' do
      subject.post_id = nil
      expect(subject).to_not be_valid
    end
  end
end
