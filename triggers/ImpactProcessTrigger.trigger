trigger ImpactProcessTrigger on Impact_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactProcessHandler.handleAfterDelete(Trigger.old);
    }
}
