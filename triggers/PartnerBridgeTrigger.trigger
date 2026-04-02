trigger PartnerBridgeTrigger on Partner_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) PartnerBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) PartnerBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) PartnerBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) PartnerBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
