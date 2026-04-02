trigger RatingBridgeTrigger on Rating_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
