require 'rails_helper'

RSpec.describe WorkTarget, type: :model do
  describe "attribute: name" do
    let(:user) {create(:user)}
    let(:project) {create(:project,user: user)}
    let(:build_work_target) {build(:work_target,name:"売り上げ集計表作成ロボ",project: project)}
    
    context "作業対象が存在する場合" do
      fit "有効であること" do
        expect(build_work_target).to be_valid
      end
    end
    context "作業対象が存在しない場合" do
      subject { page } 
      fit "無効であること" do
        build_work_target.name = nil
        expect(build_work_target).to be_invalid

        build_work_target.name = ""
        expect(build_work_target).to be_invalid

        build_work_target.name = " "
        expect(build_work_target).to be_invalid
      end

    end
    
  end
end