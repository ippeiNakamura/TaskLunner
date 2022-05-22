require 'rails_helper'

RSpec.describe User, type: :model do
   #let(:user) { build(:user,name: 'TanakaHanako',password: 'testtest123') }
   let(:user) { User.new(name: 'Example User',
                       email: 'user@example.com',
                       password: 'foobar',
                       password_confirmation: 'foobar') }

   describe 'nameカラム' do
      context '存在している場合' do
         it '有効であること' do
            expect(user).to be_valid
         end
      end
      context '空白を含む場合' do
         it '無効であること' do
            user.name = '    '
            expect(user).to be_invalid
         end
      end
      context 'nilの場合' do
         it '無効であること' do
            user.name = nil
            expect(user).to be_invalid    
         end
      end
      context '50文字の場合' do
         it '無効であること' do
            user.name = 'a' * 50
            expect(user).to be_valid
         end
      end
      context '51文字の場合' do
         it '有効であること' do
            user.name = 'a' * 51
            expect(user).to be_invalid  
         end
      end   
   end
   
   describe 'emailカラム' do
      it '有効であること' do
         expect(user).to be_valid  
      end 
      context 'nilの場合' do
         it '無効であること' do
            user.email = nil
            expect(user).to be_invalid  
         end
      end
      context '空白の場合' do
         it '無効であること' do
            user.email = '    '
            expect(user).to be_invalid  
         end
      end
      context "256文字以上の場合" do
         it '無効であること' do
            user.email = "a" * 256 + ".@example.com"
         end
      end
      context 'メールアドレスの体裁でない場合' do
         it '無効であること' do
            user.email = 'testgmail.com'
            expect(user).to be_invalid  
         end
      end
      context '既に存在するメールアドレス（大文字化）の場合' do
         it '無効であること' do
            user.save
            duplicate_user = user.dup
            duplicate_user.email.upcase
            expect(duplicate_user).to be_invalid
         end
      end

   end

   describe "password・password_confirmationカラム" do
      context '5文字の場合' do
         it '無効であること' do
            user.password =user.password_confirmation = "a" * 5
            expect(user).to be_invalid
         end
      end
      context '空白文字が6文字の場合' do
         it '無効であること' do
            user.password =user.password_confirmation = "　" * 6
            expect(user).to be_invalid
         end
      end 
   end
   
   describe '#authenticated?' do
      it 'digestがnilならfalseを返すこと' do
      expect(user.authenticated?('')).to be_falsy
   end
 end

end