trigger CommissionDeltaTrigger on Commission_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
