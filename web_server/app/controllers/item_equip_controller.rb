class ItemEquipController < ApplicationController
  before_action :auth_check
  
  def save
    @user = UserInstance.where(:USER_NO => params[:user_no]).first
    if @user == nil
      return error("not find user. USER_NO:" + params[:user_no], 100000)
    end

    @character = CharacterInstance.where(:CHARACTER_NO => params[:character_no]).first
    if @character == nil
      return error("not find character" + params[:character_no], 100019)
    end

    count = params[:COUNT]

    @character.COSTUME_ID = 0

    for n in 0..count.to_i-1
      at = "PARAMS_" + n.to_s
      item = params[at]

      @item_instance = ItemInstance.where(:ITEM_NO => item[:ITEM_NO]).first
      if @item_instance == nil
        return error("not find item" + params[:user_no], 100030)
      end

      @item_instance.SLOT_TYPE = item[:SLOT_TYPE]
      @item_instance.CHARACTER_NO = item[:CHARACTER_NO]
      
      if @item_instance.SLOT_TYPE == "EQUIP" || @item_instance.CHARACTER_NO == 0
        debug_logger("invalid equip. " + params[:user_no] + " item_no:" + item[:ITEM_NO].to_s + " slot_type:"+  item[:SLOT_TYPE].to_s + " character_no:" + item[:CHARACTER_NO].to_s)
      end
      
      @item_instance.save

      # 코스튬 업데이트 부분
      if @item_instance.SLOT_TYPE == "EQUIP"
        @item_info = ItemInfo.where(:ITEM_ID => @item_instance.ITEM_ID).first

        if @item_info.CATEGORY == "COSTUME" && @item_info.COSTUME_ID != 0
          @character.COSTUME_ID = @item_info.COSTUME_ID
        end
      end
    end

    @character.save
    message("update success", 0)

  end

end
