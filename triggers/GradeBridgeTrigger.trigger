trigger GradeBridgeTrigger on Grade_Bridge__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradeBridgeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradeBridgeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeBridgeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradeBridgeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradeBridgeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradeBridgeHandler.handleAfterDelete(Trigger.old);
    }
}
