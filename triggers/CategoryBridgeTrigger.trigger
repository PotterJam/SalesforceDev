trigger CategoryBridgeTrigger on Category_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
