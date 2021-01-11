require 'rails_helper'
describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'ニックネーム・メールアドレス・パスワード・パスワード（確認用）が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'ニックネームが6文字以下で登録できる' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'ニックネームが7文字以上であれば登録できない' do
        @user.nickname = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは6文字以内で入力してください')
      end
      it 'メールアドレスが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it '重複したメールアドレスが存在する場合登録できない' do
        @user.save
        anather_user = FactoryBot.build(:user)
        anather_user.email = @user.email
        anather_user.valid?
        expect(anather_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'パスワードが5文字以下であれば登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'パスワードが存在してもパスワード（確認用）が空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
    end
  end
end
