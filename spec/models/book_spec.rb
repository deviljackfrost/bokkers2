require 'rails_helper'

RSpec.describe 'Bookモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { book.valid? }

    let(:book) { create(:book) }
    let!(:book) { build(:book, user_id: title: 'Some Title') }

    context 'titleカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        book.title = ''
        is_expected.to eq false
      end
    end

    context 'bodyカラム' do
      it '空欄でないこと', spec_category: "バリデーションとメッセージ表示" do
        book.body = ''
        is_expected.to eq false
      end
      it '200文字以下であること: 200文字は〇', spec_category: "バリデーションとメッセージ表示" do
        book.body = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×', spec_category: "バリデーションとメッセージ表示" do
        book.body = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている', spec_category: "基本的なアソシエーション概念と適切な変数設定" do
        expect(Book.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end
