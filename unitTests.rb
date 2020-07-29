require 'rspec/autorun'
require_relative './lib/gameball'

describe Gameball::Player do
    before (:each){
    Gameball::api_key=nil
    Gameball::api_version=nil
}
    # Gameball::transaction_key="26e1967d89114388bdd1772587c336c8"
    it "Initializes a new Gameball player" do
        Gameball::api_key="7c7636658209418c9a82306a421f76a5"
        Gameball::api_version="v2.0"
        playerUniqueId=rand 50000..100000
        res=Gameball::Player.initialize_player({playerUniqueId:playerUniqueId,playerAttributes:{displayName:"Souidan",firstName:"Souidan1",lastName:"Souidan2",email:"alisouidan@gmail.com",gender:"Male",mobileNumber:"+201002580909",dateOfBirth:Time.now.utc,joinDate:Time.now.utc}})
        expect(res.code).to eq('200')
    end
    context "When user doesn't include api_key" do
        it "Throws GameballError" do
            playerUniqueId=rand 50000..100000
            body={playerUniqueId:playerUniqueId,playerAttributes:{displayName:"Souidan",firstName:"Souidan1",lastName:"Souidan2",email:"alisouidan@gmail.com",gender:"Male",mobileNumber:"+201002580909",dateOfBirth:Time.now.utc,joinDate:Time.now.utc}}
            expect{Gameball::Player.initialize_player(body)}.to raise_error(Gameball::GameballError)
        end
    end
    context "When user doesn't include correct parameters" do
        it "Throws GameballError when removing playerUniqueId" do
            Gameball::api_key="7c7636658209418c9a82306a421f76a5"
            Gameball::api_version="v2.0"
            playerUniqueId=rand 50000..100000
            body={playerAttributes:{displayName:"Souidan",firstName:"Souidan1",lastName:"Souidan2",email:"alisouidan@gmail.com",gender:"Male",mobileNumber:"+201002580909",dateOfBirth:Time.now.utc,joinDate:Time.now.utc}}
            expect{Gameball::Player.initialize_player(body)}.to raise_error(Gameball::GameballError)
        end
        it "Throws GameballError when removing displayName" do
            Gameball::api_key="7c7636658209418c9a82306a421f76a5"
            Gameball::api_version="v2.0"
            playerUniqueId=rand 50000..100000
            body={playerUniqueId:playerUniqueId,playerAttributes:{firstName:"Souidan1",lastName:"Souidan2",email:"alisouidan@gmail.com",gender:"Male",mobileNumber:"+201002580909",dateOfBirth:Time.now.utc,joinDate:Time.now.utc}}
            expect{Gameball::Player.initialize_player(body)}.to raise_error(Gameball::GameballError)
        end
    end
    context "When user includes an incorrect date format" do
        it "Throws GameballError" do
            Gameball::api_key="7c7636658209418c9a82306a421f76a5"
            Gameball::api_version="v2.0"
            playerUniqueId=rand 50000..100000
            body={playerUniqueId:playerUniqueId,playerAttributes:{displayName:"Souidan",firstName:"Souidan1",lastName:"Souidan2",email:"alisouidan@gmail.com",gender:"Male",mobileNumber:"+201002580909",dateOfBirth:"0123",joinDate:Time.now.utc}}
            expect{Gameball::Player.initialize_player(body)}.to raise_error(Gameball::GameballError)
        end
    end

end
describe Gameball::Event do
    it "create new event" do 
        Gameball::api_key="7c7636658209418c9a82306a421f76a5"
        Gameball::api_version="v2.0"
        res=Gameball::Event.sendEvent({
        events:{view_product_page:{customer_id:"123",product_id:"123",product_title:"title",product_vendor:"vendor",shop_name:"shop"}},
        playerUniqueId:"uinqueKeys123"})
        expect(res).to eq(true)
    end 
    # it "create new event with optional parameters" do 
    #     Gameball::api_key="7c7636658209418c9a82306a421f76a5"
    #     Gameball::api_version="v2.0"
    #     res=Gameball::Event.sendEvent({
    #     events:{view_product_page:{customer_id:"123",product_id:"123",product_title:"title",product_vendor:"vendor",shop_name:"shop"}},
    #     playerUniqueId:"uinqueKeys123",
    #     playerAttributes:{displayName:"Souidan",firstName:"Souidan1",lastName:"Souidan2",email:"alisouidan@gmail.com",gender:"Male",mobileNumber:"+201002580909",dateOfBirth:"0123",joinDate:Time.now.utc}
    #     })
    #     expect(res).to eq(true)
    # end 
describe Gameball::Referral do
    it "Creates new player then new referral" do
        Gameball::api_key="7c7636658209418c9a82306a421f76a5"
        Gameball::api_version="v2.0"
        playerUniqueId=rand 50000..100000
        res=Gameball::Player.initialize_player({playerUniqueId:playerUniqueId,playerAttributes:{displayName:"Souidan",firstName:"Souidan1",lastName:"Souidan2",email:"alisouidan@gmail.com",gender:"Male",mobileNumber:"+201002580909",dateOfBirth:Time.now.utc,joinDate:Time.now.utc}})
        res=Gameball::Referral.create_referral({
        playerCode:"Uen3FBBCB65D2Q",
        playerUniqueId:playerUniqueId
    })

    p res.body
        expect(res.code).to eq("200")
    end
end
end