require 'rails_helper'

describe Buy do
  before do
    @buy = FactoryBot.build(:buy)
  end

  it "全ての項目の入力が存在すれば購入できる" do
    @buy.save
    expect(@buy).to be_valid
  end
  it "クレジットカード情報が空では保存できない" do
    @buy.token = nil
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Token can't be blank")
  end
  it "郵便番号が空では保存できない" do
    @buy.postal_code = nil
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Postal code can't be blank")
  end
  it "都道府県が選択されていないと保存できない" do
    @buy.prefecture_id = 1
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Prefecture must be other than 1")
  end
  it "市区町村が空では保存できない" do
    @buy.city = nil
    @buy.valid?
    expect(@buy.errors.full_messages).to include("City can't be blank")
    
  end
  it "番地が空では保存できない" do
    @buy.address = nil
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Address can't be blank")
  end
  it "電話番号が空では保存できない" do
    @buy.phone_number = nil
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Phone number can't be blank")
  end
  it "郵便番号にハイフンがなければ保存できない" do
    @buy.postal_code = "1111111"
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end
  it "電話番号は１１桁以内でないと保存できない" do
    @buy.phone_number = "090111111111"
    @buy.valid?
    expect(@buy.errors.full_messages).to include("Phone number is invalid")
  end
end
