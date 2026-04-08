trigger ImpactDeltaTrigger on Impact_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
