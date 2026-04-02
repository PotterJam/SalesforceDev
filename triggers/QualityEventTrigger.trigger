trigger QualityEventTrigger on Quality_Event__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityEventHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityEventHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityEventHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityEventHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityEventHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityEventHandler.handleAfterDelete(Trigger.old);
    }
}
