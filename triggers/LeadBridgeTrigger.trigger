trigger LeadBridgeTrigger on Lead_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
