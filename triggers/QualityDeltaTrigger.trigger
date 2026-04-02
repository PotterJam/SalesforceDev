trigger QualityDeltaTrigger on Quality_Delta__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityDeltaHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityDeltaHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityDeltaHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityDeltaHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityDeltaHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityDeltaHandler.handleAfterDelete(Trigger.old);
    }
}
