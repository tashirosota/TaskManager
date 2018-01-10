require 'rails_helper'

RSpec.describe Task, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  describe '.new' do
    context 'given valid attributes' do
      subject { Task.new(:title => 'a', :memo => 'a') }
      it { should be_valid }
    end
  end
end
