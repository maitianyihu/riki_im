import ImSDK

//
//  TextMessageNode.swift
//  tencent_im_plugin
//
//  Created by 蒋具宏 on 2020/3/13.
//  其它消息节点
public class OtherMessageNode : AbstractMessageNode{

    override func getNote(elem: TIMElem) -> String {
        return "[其它消息]";
    }
    
    override func analysis(elem: TIMElem) -> AbstractMessageEntity {
        let entity = OtherMessageEntity();
        if(elem.isMember(of: TIMGroupSystemElem.self)){
            var e: TIMGroupSystemElem
            e = elem as! TIMGroupSystemElem;
            print(e.type);
            if(e.type == TIM_GROUP_SYSTEM_TYPE.DELETE_GROUP_TYPE){
                entity.params = "{\"subtype\":\"TIM_GROUP_SYSTEM_DELETE_GROUP_TYPE\"}";
                entity.type = "GroupSystem";
            }else{
                entity.params = "{\"note\":\"IOS暂不支持该节点!\"}";
                entity.type = "\(type(of:elem))";
            }
            
        }else{
            entity.params = "{\"note\":\"IOS暂不支持该节点!\"}";
            entity.type = "\(type(of:elem))";
        }
        return entity;
    }
}
